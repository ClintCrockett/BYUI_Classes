(defn cartesian-product
      ([] '(()))
      ([xs & more]
        (mapcat #(map (partial cons %)
                      (apply cartesian-product more))
                xs)))

(def firstRipples ["Vanilla", "Chocolate", "Cherry-Ripple"])

(def secondRipples ["Lemon", "Butterscotch", "Licorice-Ripple"])

(def combin (concat firstRipples, secondRipples))

(filter #(or (= (first %) "Chocolate") (= (second %) "Chocolate"))
    (cartesian-product combin combin)
)
