const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

//write a func
function addNumbers(sum, numsLeft, completionCallback){
//     If numsLeft > 0, then:
    if(numsLeft > 0){
//           Prompt the user for a number(use reader).
//           Pass a callback that:
//           Uses parseInt to parse the input.
        reader.question("Enter a number", function(input){
            let number = parseInt(input);
            sum += number;
        }
            addNumbers(sum, numsLeft-1, completionCallback);
//            Increment the sum and console.log it.
//           Recursively calls addNumbers again, passing in:
//                  the increased sum,
//                  the decreased numsLeft,
//                  and the same completionCallback.
        }
    }
    else{
        completionCallback(sum)
    }
//     If numsLeft === 0, call completionCallback(sum) 
        // so that the total sum can be used.

}