#lang sicp
(#%require sicp-pict)
#|Ex 2.49 segment->painter
@Author - Soumitra Pandit
@Date - 13th September 2023
Yeah, I have lost interest in this.
Like this is so boring, there is no need to
get into this. The only interesting part of this
problem was the wave painter but that was because
I thought we were going to use the "wave" painter
somehow implicitly. But no, its just brute work.
So no, I am out.
|#
;I can write down the segment->painter function though

(define (segment-painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       ;draw segment
       (draw-line
        ((frame-coord-map frame)(start-segment segment))
        ((frame-coord-map frame)(end-segment segment))))
     segment-list)))

;and draw line is a function that draws a line?
;(frame-coord-map frame) takes in a vector and returns
;that vector transformed to that frame.
;That is kind of cool actually. Very elegant implementation.
