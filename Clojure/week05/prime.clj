;; List to decode (coded list)
(def RLEPRIMES [1 1 0 1 0 1 3 1 0 1 3 1 0 1 3 1 5 1 0 1 5 1 3 1 0 1 3 1 5 1 5 1 0 1 5 1 3 1 0 1 5 1 3 1 5 1 7 1 3])

;; List of prime numbers to be assigned to a number in the decode list
(defn random-prime []
  (let [primes [2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97]]
    (nth primes (rand-int (count primes)))))


;; List of composite numbers to be assigned to a number in the coded list
(defn random-composite []
  (loop []
    (let [x (inc (rand-int 99))]
      (if (prime? x)
        (recur)
        x))))
;; Checks composite number for prime number
(defn prime? [x]
  (cond (< x 2) false
        (= x 2) true
        (even? x) false
        :else (not-any? #(zero? (rem x %)) (range 3 (inc (Math/sqrt x))))))

;; Defines that if the coded number is more then 1 it will be the composite number 
;; x numbers of times
(defn composite [x]
  (when (> x 1)
    [(repeat x (random-composite))]))

;; Prints either prime, composite, or multiple composite based on the coded numbers
(defn compare-num [RLEPRIMES]
  (vec (map #(cond
               (not (integer? %)) (println "Sorry")
               (= % 1) (random-prime)
               (= % 0) (random-composite)
               :else (apply concat (composite %)))
            RLEPRIMES)))

(compare-num RLEPRIMES)