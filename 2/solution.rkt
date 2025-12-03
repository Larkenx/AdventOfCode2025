#lang racket

(require math/base)
(require test-engine/racket-tests)

(define product-id-ranges (string-split (first (port->lines (open-input-file "input.txt"))) ","))

(define (is-invalid-id? product-id)
    (letrec ([product-id-length (string-length product-id)]
          [midpoint (/ product-id-length 2)])
        (cond
            [(odd? product-id-length) #false]
            [else (equal? (substring product-id 0 midpoint) (substring product-id midpoint))]
)))

(define (get-list-of-invalid-ids product-range) ; -> returns list of invalid ids as numbers from the product id range
    (letrec ([number-range (map string->number (string-split product-range "-"))]
            [start (first number-range)]
            [end (last number-range)]
            [product-ids (inclusive-range start end)])
    ; for each product id in the range, add to
    (foldr (λ (product-id invalid-id-list)
            (if (is-invalid-id? (number->string product-id)) 
                (cons product-id invalid-id-list) 
                invalid-id-list))
        '() product-ids)
))

(define (solve all-ranges)
    (sum (flatten (map get-list-of-invalid-ids all-ranges))))

(check-expect (get-list-of-invalid-ids "11-22") '(11 22))
(check-expect (solve '("11-22")) 33)
(check-expect (get-list-of-invalid-ids "1188511880-1188511890") '(1188511885))
(check-expect (get-list-of-invalid-ids "1698522-1698528") '())
(check-expect (get-list-of-invalid-ids "446443-446449") '(446446))

(test)

(print (solve product-id-ranges))
