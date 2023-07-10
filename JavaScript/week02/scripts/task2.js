/* Lesson 2 */

/* VARIABLES */

// Step 1: declare and instantiate a variable to hold your name
let name = "Jayton Crockett";
// Step 2: place the value of the name variable into the HTML file (hint: document.querySelector())
document.querySelector('#name').textContent = name;

// Step 3: declare and instantiate a variable to hold the current year
let year = new Date().getFullYear();     
// Step 4: place the value of the current year variable into the HTML file
document.querySelector('#year').textContent = year;

// Step 5: declare and instantiate a variable to hold the name of your picture
let img = 'images/selfie.png';
// Step 6: copy your image into the "images" folder

// Step 7: place the value of the picture variable into the HTML file (hint: document.querySelector().setAttribute())
document.querySelector('img').setAttribute('src', img);
/* ARRAYS */


// Step 1: declare and instantiate an array variable to hold your favorite foods
const food_list = ['Orange Chicken', 'Alfredo', 'Cereal'];
// Step 2: place the values of the favorite foods variable into the HTML file
document.querySelector('#food').innerHTML = food_list;

// Step 3: declare and instantiate a variable to hold another favorite food
let add_food = 'Hawaiian Rolls';
// Step 4: add the variable holding another favorite food to the favorite food array
food_list.push(add_food);
// Step 5: repeat Step 2
document.querySelector('#food').textContent = food_list;

// Step 6: remove the first element in the favorite foods array
food_list.shift();
// Step 7: repeat Step 2
document.querySelector('#food').textContent = food_list;

// Step 8: remove the last element in the favorite foods array
food_list.pop();
// Step 7: repeat Step 2
document.querySelector('#food').textContent = food_list;