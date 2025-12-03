#lang racket

(require math/base)
(require test-engine/racket-tests)

(let product-id-ranges (string-split (first (port->lines (open-input-file "input.txt"))) ","))

(define (number-of-invalid-ids product-range)
    (let number-range (map string->number (string-split product-range "-")))
    (let start (first number-range))
    (let end (last number-range))
)

; Given a product ID, find the number of times any sequence of numbers repeat
; Grab 1 to N-1 first characters of the product id, see if it repeats
(define (number-of-repeating-sequences product-id)
    (let digits (string-split (number->string product-id)))
   
)

; Given a string, will return the number of times the string appears sequentially 
; 2, 122345 -> 2
; 1, 131313 -> 0
; 13, 1313 -> 2
; 123, 123123 -> 2
; 123456, 1234560123456 -> 2
(define (count-sequences token str)
    (cond
        [(empty-string? str) 0] ; empty strings have no occurences
        [(string-prefix? str token) (+ 1 (count-sequences token (substring str 1)))] ; token is in the prefix of the string, add 1 and check the rest 
        [else (count-sequences token (substring str 1))])
)

(check-expect (count-sequences "2" "22422422") 6)
(check-expect (count-sequences "2" "22422422") 6)


; (sum (map  number-of-invalid-ids product-id-ranges))