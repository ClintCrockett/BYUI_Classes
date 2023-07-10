/* Lesson 5 */

/* IF/ELSE IF */

// Step 1: Declare and initialize a new variable to hold the current date
var date = new Date();
// Step 2: Declare another variable to hold the day of the week
// Step 3: Using the variable declared in Step 1, assign the value of the variable declared in Step 2 to the day of the week ( hint: getDay() )
var week_day = date.getDay();

// Step 4: Declare a variable to hold a message that will be displayed
var message = '';
// Step 5: Using an if statement, if the day of the week is a weekday (i.e. Monday - Friday), set the message variable to the string 'Hang in there!'
if (week_day != 0 && week_day != 6){
    message = 'Hang in there!';
}
// Step 6: Using an else statement, set the message variable to 'Woohoo!  It is the weekend!'
else{
    'Woohoo!  It is the weekend!';
}
/* SWITCH, CASE, BREAK */

// Step 1: Declare a new variable to hold another message
var new_message = '';
// Step 2: Use switch, case and break to set the message variable to the day of the week as a string (e.g. Sunday, Monday, etc.) using the day of week variable declared in Step 2 above
switch (new Date().getDay()) {
    case 0:
        new_message = "Sunday";
      break;
    case 1:
        new_message = "Monday";
      break;
    case 2:
        new_message = "Tuesday";
      break;
    case 3:
        new_message = "Wednesday";
      break;
    case 4:
        new_message = "Thursday";
      break;
    case 5:
        new_message = "Friday";
      break;
    case 6:
        new_message = "Saturday";
  }
/* OUTPUT */

// Step 1: Assign the value of the first message variable to the HTML element with an ID of message1
document.getElementById("message1").innerHTML = message;
// Step 2: Assign the value of the second message variable to the HTML element with an ID of message2
document.getElementById("message2").innerHTML = new_message;

/* FETCH */
// Step 1: Declare a global empty array variable to store a list of temples
// Step 2: Declare a function named output that accepts a list of temples as an array argument and does the following for each temple:
function output(temple_list){
    temple_list.forEach((temples) => {
        // - Creates an HTML <article> element
        var artical = document.createElement("article");

        // - Creates an HTML <h3> element and add the temple's templeName property to it
        var t_name = document.createElement("h3");
        t_name.textContent = temples.templeName;
        
        // - Creates an HTML <h4> element and add the temple's location property to it                
        var t_location = document.createElement("h4");
        t_location.textContent = temples.location;
        // - Creates an HTML <h4> element and add the temple's dedicated property to it
        var t_dedicated = document.createElement("h4");
        t_dedicated.textContent = temples.dedicated;
                
        // - Creates an HTML <img> element and add the temple's imageUrl property to the src attribute and the temple's templeName property to the alt attribute
        var t_img = document.createElement("img");
        t_img.setAttribute('src', temples.imageUrl);
        t_img.setAttribute('alt', temples.templeName);

        // - Appends the <h3> element, the two <h4> elements, and the <img> element to the <article> element as children
        artical.appendChild(t_name);
        artical.appendChild(t_location);
        artical.appendChild(t_dedicated);
        artical.appendChild(t_img);
        // - Appends the <article> element to the HTML element with an ID of temples
        document.getElementById("temples").appendChild(artical);
    });
}

// Step 3: Create another function called getTemples. Make it an async function.
async function get_temples(){
    // Step 4: In the function, using the built-in fetch method, call this absolute URL: 'https://byui-cse.github.io/cse121b-course/week05/temples.json'. Create a variable to hold the response from your fetch. You should have the program wait on this line until it finishes.
    var grab = await fetch('https://byui-cse.github.io/cse121b-course/week05/temples.json');
    // Step 5: Convert your fetch response into a Javascript object ( hint: .json() ). Store this in the templeList variable you declared earlier (Step 1). Make sure the the execution of the code waits here as well until it finishes.
    temple_list = await grab.json();
    // Step 6: Finally, call the output function and pass it the list of temples. Execute your getTemples function to make sure it works correctly.    
    output(temple_list);
};
get_temples();
// Step 7: Declare a function named reset that clears all of the <article> elements from the HTML element with an ID of temples
function reset(){
    document.getElementById("temples").innerHTML = "";
}
// Step 8: Declare a function named sortBy that does the following:
// - Calls the reset function
// - Sorts the global temple list by the currently selected value of the HTML element with an ID of sortBy
// - Calls the output function passing in the sorted list of temples
function sortBy(){
    reset();
    let sort = document.getElementById("sortBy").value;

    switch (sort){
        case "templeNameAscending":
            output(
                temple_list.sort((temple1, temple2)=>{
                    if (temple1.templeName<temple2.templeName){
                        return -1;
                    } else if (temple1.Name>temple2.templeName){
                         return 1;
                    } else{
                        return 0
                    }
                })
            ); 
            break;

        case "templeNameDescending":
            output(
                temple_list.sort((temple1, temple2)=>{
                    if (temple1.templeName>temple2.templeName){
                        return -1;
                    } else if (temple1.Name<temple2.templeName){
                        return 1;
                    } else{
                        return 0
                    }
                })
            );
            break;
    }
};
// Step 9: Add a change event listener to the HTML element with an ID of sortBy that calls the sortBy function
document.getElementById("sortBy").addEventListener("change", sortBy);
/* STRETCH */

// Consider adding a "Filter by" feature that allows users to filter the list of temples
// This will require changes to both the HTML and the JavaScript files
