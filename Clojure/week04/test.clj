(defn cartesian-product [& colls]
  (if (empty? colls)
    '(())
    (for [x (first colls)
          xs (apply cartesian-product (rest colls))
          y (cons x (first xs))]
      y)))

(def first-ripples ["Vanilla" "Chocolate" "Cherry-Ripple"])
(def second-ripples ["Lemon" "Butterscotch" "Licorice-Ripple"])
(def combin (concat first-ripples second-ripples))

(filter #(some #{%} ["Chocolate"]) (cartesian-product combin combin))
