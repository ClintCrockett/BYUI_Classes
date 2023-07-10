;; User inputs a color of food they want to eat give them a list of that color foods
;; can combin colors to make meals

;; User can decide if they was salty, sweet, sour, bitter, or savory or combin 
(defn get-food [taste]
  (let [salty-foods ["nFries" "Chips" "Sardines" "Pickles"]
        sweet-foods ["Cake" "Donut" "Ice Cream" "Muffin"]
        sour-foods ["Lemon" "Pomegranate" "Sour Cream" "Kimchi"]
        bitter-foods ["Brussel Sprouts" "Dark Chocolate" "Asparagus" "Kale"]
        savory-foods ["Burrito" "Ravioli" "Scrambled Eggs" "Burger"]
        foods-map {"salty" salty-foods
                   "sweet" sweet-foods
                   "sour" sour-foods
                   "bitter" bitter-foods
                   "savory" savory-foods}]
    (cond
      (= taste "combine")
        (let [tastes (do (println "Enter two tastes separated by a space:") (read-line))
            [taste1 taste2] (clojure.string/split tastes #" ")]
        (str "This is the food combination for you!\n"
            (get-food taste1) " and " (get-food taste2)))



      (contains? foods-map taste)
      (rand-nth (get foods-map taste))

      :else "Invalid input. Please try again.")))

(println "\nSelect a taste: salty, sweet, sour, bitter, savory, or combine")
(let [taste (read-line)]
  (println (get-food taste)))

