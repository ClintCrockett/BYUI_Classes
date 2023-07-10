(def rlelist [1 1 0 1 0 1 3 1 0 1 3 1 0 1 3 1 5 1 0 1 5 1 3 1])

(defn random-prime []
  (let [primes [2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97]]
    (nth primes (rand-int (count primes)))))


(defn bigNums [n]
  (when (> n 1)
    [(repeat n 8)]))


(defn compare-ints [rlelist]
  (vec (map #(cond
               (not (integer? %)) (println "Sorry")
               (= % 1) (random-prime)
               (= % 0) 4
               :else (apply concat (bigNums %)))
            rlelist)))

(compare-ints rlelist)
