;; User inputs a color of food they want to eat give them a list of that color foods
;; can combin colors to make meals

(def red-foods ["Spaghetti" "Jello" "Strawberries" "Raspberries"])
(def orange-foods ["Orange Chicken" "Salmon" "Shrimp" "Sweet Potatoes"])
(def yellow-foods ["Curry" "Banana" "Lemon Pepper Chicken" "Pineapple"])
(def green-foods ["Pesto Chicken" "Ceasar Salad" "Pesto Sandwich" "Peas"])
(def purple-foods ["Blackberrries" "Blueberries"])
(def white-foods ["White Rice" "Unseasoned Chicken" "bread" "Tofu"])

(defn get-food-for-color [color]
  (case color
    "red" (rand-nth red-foods)
    "orange" (rand-nth orange-foods)
    "yellow" (rand-nth yellow-foods)
    "green" (rand-nth green-foods)
    "purple" (rand-nth purple-foods)
    "white" (rand-nth white-foods)))

(println "Enter three colors (red, orange, yellow, green, purple, or white):")
(let [color1 (read-line)
      color2 (read-line)
      color3 (read-line)]
  (println "Your meal is:")
  (println (str (get-food-for-color color1) ", " (get-food-for-color color2) ", " (get-food-for-color color3))))
