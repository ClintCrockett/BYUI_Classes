;; Defining the function adding in the perameters a and b
(defn gcd [a b]
    ;; If b is zero a is the greatest common denominator
    (if (zero? b)
    ;; Print a
      a
    ;; Else divide a and b to find the largest number without a remainder of 
    ;; both numbers and print each time
        (do
            (println a '= b (list (quot a b)) '+ (rem a b))
            (recur b (mod a b)))))
;; Calling the function using two number to divide by
(gcd 480 1001)