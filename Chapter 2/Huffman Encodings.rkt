#lang sicp
#|Huffman Encoding Trees
@Author - Soumitra Pandit
@Date - 21st September 2023

This is the simplest thing I have seen.
I am going to break it down and implement it.
Lets go.|#

;The Huffman Encoding Trees Have to be generated
;From a list of Symbols and their frequencies
;The frequencies are expressed in numbers.
;Now, given this, we can extract the frequencies
;And the Symbols.
;Let me think through this.

;So we have to create something that looks like a tree.
;But, we are starting from the symbol with the
;greatest frequency, instead of the least.
;Now, interestingly, I think the algorithm that I have developed
;For creating trees out of lists should work here with really small
;Changes.

;Okay, can we also use wishful thinking to expedite our development
;here?


;========================================================================
;ENCODING

;Given a Message, create a Huffman Encoding (and thus a message).
;The Message 'Key' Would be the tree that we generate.

;------------------------------------------------------------------------
;What I would likely need (Or wishful thinking)
;1) A function that takes in a list of Symbols and returns a nested list
;With the Symbols and their frequencies
;2) A function that takes in the list created by the previous function
;And gives us the Huffman Tree
;3) A function that goes through the message and replaces the symbol for its encoding

;(define (message->frequency-list message)
;(define (huff-tree list)
;(define (encode message)

;========================================================================
;Decoding

;Given a message, find the symbols from the Encoding and the 'Key'.

;------------------------------------------------------------------------
;What I would likely need (Or wishful thinking)
;1) A function that takes in a message and traverses the Huffman tree,
;Using the encoding as directions and substitues in the Symbol
;when it reaches a leaf.

;========================================================================
;General Design Considerations
;The Tree can have leaves or nodes.
;And empty nodes should never be accessed.
;Also, leaves should not branch out.
;(might seem obvious, but I am thinking of the case where 1 would be a leaf and
;0 might lead to a tree.
;While creating the tree, we will use the (weight tree) function to compare between the
;Choices we have.
;Okay, lets implement this.
;Already, I can see a few potential pit falls.
;Lets say we have the elements in descending order of their prominence,
;And the weight of the first element is always less than the cumulative
;Weight of the remaining list. Then we essentially have a linked list.
;That we can just cascade down of.

;=========================================================================

;Selectors and Constructors

;Node
(define (node value left-node right-node)
  (list value left-node right-node))

(define (value node)
  (car node))

(define (left-node node)
  (cadr node))

(define (right-node node)
  (caddr node))

(define (is-leaf? node)
  (and (null? (right-node node))
       (null? (left-node node))))

;Huffman Complexes
(define (huffman-complex symbols weight)
  (list symbols weight))

(define (extract-symbol huffman-complex)
  (car huffman-complex))

(define (extract-weight huffman-complex)
  (cadr huffman-complex))

(define (combine-symbols complex1 complex2)
  (append (extract-symbol complex1) (extract-symbol complex2)))

(define (add-weights complex1 complex2)
  (+ (extract-weight complex1) (extract-weight complex2)))

(define (combine-huffman-complexes complex1 complex2)
  (huffman-complex (combine-symbols complex1 complex2) (add-weights complex1 complex2)))


;Huffman Node
;A Huffman Node is a special case of a node in which the value is a Huffman Complex

(define (create-huffman-node symbols weight left-node right-node)
  (node (huffman-complex symbols weight) left-node right-node))

(define (huffman-complex-of huffman-node)
  (value huffman-node))

(define (combine-huffman-nodes huffman-node1 huffman-node2)
  (create-huffman-node (combine-symbols (huffman-complex-of huffman-node1) (huffman-complex-of huffman-node2))
                       (add-weights (huffman-complex-of huffman-node1) (huffman-complex-of huffman-node2))
                       huffman-node1
                       huffman-node2))

;The combination of two Huffman-nodes is giving us a Huffman node with the original nodes as its branches.
;I think this, right here is the key.

;Convert a list of Huffman Complexes to a list of Huffman Nodes
;First Lets define Huffman Leaves

(define (create-huffman-leaf symbol weight)
  (create-huffman-node symbol weight '() '()))

;And now we can map this to a list.

(define (map f seq)
  (if (null? seq)
      '()
      (cons (f (car seq)) (map f (cdr seq)))))


(define (frequency-list->huffman-list seq)
  (map (lambda (huffman-complex)
         (create-huffman-leaf (list (extract-symbol huffman-complex))
                              (extract-weight huffman-complex)))
       seq))

(define test-list '((A 9) (B 8) (C 5) (D 3) (E 2) (F 2)))

(frequency-list->huffman-list test-list)

;I also need to figure out a way to compare two Huffman Nodes.

(define (weight-of huffman-node)
  (extract-weight (huffman-complex-of huffman-node)))

;So around this time, I need to start thinking about sorting.
;We need the lowest two nodes at each point.
;A better way to do this might just be to preserve the existing order.
;Because then, we'd have to sort just once. And that's when we create the
;Frequency list.
;Yeah, I like that approach.
;In that case, won't it be easier to have an ascending list?
;Because we want the smallest elements up front.

(define (greater-than? huffman-node1 huffman-node2)
  (> (weight-of huffman-node1) (weight-of huffman-node2)))

(define (first-element huffman-list)
  (car huffman-list))

(define (second-element huffman-list)
  (cadr huffman-list))

(define (list-without-second-element huffman-list)
  (cons (first-element huffman-list) (cddr huffman-list)))

(define (re-sort huffman-list)
  (cond ((null? (cdr huffman-list)) huffman-list)
        ((greater-than? (first-element huffman-list)
                        (second-element huffman-list))
         (cons (second-element huffman-list) (re-sort (list-without-second-element huffman-list))))
        (else huffman-list)))

(define test-list2 '((A 3) (B 4) (E 6) (D 7) (G 9)))
(define huff-list2 (frequency-list->huffman-list test-list2))


(re-sort huff-list2)


;Okay, this seems to be working. Now we can actually implement the algorithm.

(define (combine-first-two-nodes huffman-list)
  (cons (combine-huffman-nodes
         (first-element huffman-list)
         (second-element huffman-list))
        (cddr huffman-list)))

(define (create-huffman-tree huffman-list)
  (cond ((null? huffman-list) huffman-list)
        ((null? (cdr huffman-list)) (car huffman-list))
        (else
         (create-huffman-tree
          (re-sort
           (combine-first-two-nodes huffman-list))))))

(define huff-tree2 (create-huffman-tree huff-list2))
huff-tree2
(extract-symbol (value huff-tree2))
(left-node huff-tree2)
(right-node huff-tree2)

;(combine-huffman-nodes (create-huffman-leaf 'C 10 )(combine-huffman-nodes (create-huffman-leaf 'A 9) (create-huffman-leaf 'B 10)))


;(define huff-node1 (combine-huffman-nodes huff-leaf1 huff-leaf2))
;huff-node1
;(define huff-node2 (combine-huffman-nodes huff-node1 huff-node1))
;huff-node2







