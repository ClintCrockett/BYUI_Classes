/* Lesson 4 */

/* DATA */

// Step 1: Declare a new variable to hold information about yourself
const info = {
    // Step 2: Inside of the object, add a property named name with a value of your name as a string
    name: "Jayton Crockett",
    // Step 3: Add another property named photo with a value of the image path and name (used in Task 2) as a string
    photo: "images/selfie.png",
    // Step 4: Add another property named favoriteFoods with a value of an array of your favorite foods as strings ( hint: [] )
    favoriteFoods: ["Orange Chicken", "Pizza", "Alfredo"],
    // Step 5: Add another property named hobbies with a value of an array of your hobbies as strings
    hobbies: ["Pickleball", "Swimming", "Working Out"],
    // Step 6: Add another property named placesLived with a value of an empty array
    placesLived: [
        // Step 7: Inside of the empty array above, add a new object with two properties: place and length and values of an empty string
        // Step 8: For each property, add appropriate values as strings
        {place: "Suprise, Arizona", length: "18 years"},
        {place: "Rexburg, Idaho", length: "1.5 years"}
    ]
};


/* OUTPUT */

// Step 1: Assign the value of the name property (of the object declared above) to the HTML <span> element with an ID of name
document.getElementById("name").innerHTML = info.name;
// Step 2: Assign the value of the photo property as the src attribute of the HTML <img> element with an ID of photo
document.getElementById("photo").setAttribute('src', info.photo);
// Step 3: Assign the value of the name property as the alt attribute of the HTML <img> element with an ID of photo
document.getElementById("photo").setAttribute('alt', info.photo);
var favFoods = info.favoriteFoods

// Step 4: For each favorite food in the favoriteFoods property, create an HTML <li> element and place its value in the <li> element
const food = info.favoriteFoods;
const foodList = food.map(function(food){
    // Step 5: Append the <li> elements created above as children of the HTML <ul> element with an ID of favorite-foods
    // document.getElementById("").innerHTML = ;
    return `<li> ${food} <li>`
})
document.getElementById("favorite-foods").innerHTML = foodList.join('');

// Step 6: Repeat Step 4 for each hobby in the hobbies property
const hobbies = info.hobbies;
const hobbyList = hobbies.map(function(hobbies){
    // Step 7: Repeat Step 5 using the HTML <ul> element with an ID of hobbies
    return `<li> ${hobbies} <li>`
})
document.getElementById("hobbies").innerHTML = hobbyList.join('');

// Step 8: For each object in the <em>placesLived</em> property:
// - Create an HTML <dt> element and put its place property in the <dt> element
// - Create an HTML <dd> element and put its length property in the <dd> element
const placeHTML = "";
const places = info.placesLived;

for (let i in places){
    // Step 9: Append the HTML <dt> and <dd> elements created above to the HTML <dl> element with an ID of places-lived
    document.getElementById("places-lived").innerHTML += `<dt> ${places[i].place} </dt>`;
    document.getElementById("places-lived").innerHTML += `<dd> ${places[i].length} </dd>`;
}