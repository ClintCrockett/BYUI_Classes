;; @author Rick Neff
;; @copyright 2020 Rick Neff licensed under the <a>
;;        rel="license"
;;        href="http://creativecommons.org/licenses/by/4.0/"
;;        target="_blank">
;;        Creative Commons Attribution 4.0 International License</a>
;;
;;
;; These solutions are not intended to be ideal solutions. Instead,
;; they are solutions that you can compare against yours to see
;; other options and to come up with even better solutions.
;;


(defn gcd [a b]
    (if (zero? b)
      a
      (recur b (mod a b))))

  (defn gcd-instrumented [a b]
    (if (zero? b)
      a
      (do
       (println a '= b (list (quot a b)) '+ (rem a b))
       (recur b (mod a b)))))

  (defn gcd-no-recursion [a b]
    (last ; for the greatest
     (filter
      #(and (zero? (mod b %)) (zero? (mod a %)))
      (range 1 (inc (min a b))))))

  (defn gcd-via-reduce []
    (loop [a (map #(Integer/parseInt %) (clojure.string/split (read-line) #" "))]
      (cond
        (reduce > a) (recur (list (reduce - a) (last a)))
        (reduce < a) (recur (list (- (reduce - a)) (first a)))
        (reduce = a) (println (first a)))))

  (gcd 45 67)

  (gcd-instrumented 45 67)

  (gcd-no-recursion 45 67)

