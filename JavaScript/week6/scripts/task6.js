/* Lesson 6 */

let upper = 0
function upperLevel(){
    // array to hold dice values to multiply them later
    const dice = [];
    const numbers = [1,2,3,4,5,6];
    dice.push(parseInt(document.querySelector("#addend1").value));
    dice.push(parseInt(document.querySelector("#addend2").value));
    dice.push(parseInt(document.querySelector("#addend3").value));
    dice.push(parseInt(document.querySelector("#addend4").value));
    dice.push(parseInt(document.querySelector("#addend5").value));
    dice.push(parseInt(document.querySelector("#addend6").value));
    let total = document.getElementById("total");
    let sum = document.getElementById("sum");
    
    // map through each value in both dice and numbers array multipying them
    const addNum = (dice, numbers) => {
        return dice.map((n, index) => n * numbers[index]);
    }
    // add all multiplied numbers together
    let combin = addNum(dice, numbers)
    combin = combin.reduce((add, s) => add + s, 0);
    sum.value = combin;

    if (combin >= 65){
        total.value = combin + 35;
        upper = combin + 35;
    }
    else{
        total.value = combin;
        upper = combin;
    }
}

function lowerLevel(){
    // array to hold dice values to multiply them later
    upperLevel();
    const dice = [];
    const numbers = [3,4,1,1,1,1,1,100];
    dice.push(parseInt(document.querySelector("#three").value));
    dice.push(parseInt(document.querySelector("#four").value));
    dice.push(parseInt(document.querySelector("#house").value));
    dice.push(parseInt(document.querySelector("#small").value));
    dice.push(parseInt(document.querySelector("#large").value));
    dice.push(parseInt(document.querySelector("#yahtzee").value));
    dice.push(parseInt(document.querySelector("#chance").value));
    dice.push(parseInt(document.querySelector("#more").value));
    let lower = document.getElementById("lower");
    let grand = document.getElementById("grand");
    
    // map through each value in both dice and numbers array multipying them
    const addNum2 = (dice, numbers) => {
        return dice.map((n, index) => n * numbers[index]);
    }
    // add all multiplied numbers together
    let combin = addNum2(dice, numbers)
    combin = combin.reduce((add, s) => add + s, 0);
    lower.value = combin;
    grand.value = parseInt(lower.value) + upper;
}
document.querySelector("#addNumbers").addEventListener("click", lowerLevel);