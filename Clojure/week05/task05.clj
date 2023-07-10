(def RLEPRIME [1 1 0 1 0 1 3 1 0 1 3 1 0 1 3 1 5 1 0 1 5 1 3 1 0 1 3 1 5 1 5 1 0 1 5 1 3 1 0 1 5 1 3 1 5 1 7 1 3])

(defn compare-ints [RLEPRIME]
  (if (neg? (count RLEPRIME))
    (println "Sorry")
    (if (>= (count RLEPRIME) 2)
      (map #(cond (= % 1) 7
                  (= % 0) 4
                  :else (bigNums %))
           (range (count RLEPRIME)))
      (println "Sorry"))))


(compare-ints RLEPRIME)
