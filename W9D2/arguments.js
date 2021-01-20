function sum1(context) {  
  let counter = 0;
  for (let i = 0; i < arguments.length; i++) {
    counter += arguments[i];
  }
  return counter;
  // console.log(arguments)
  // console.log(context)
  // console.log('dadas')
}

// console.log(sum1(1,23,4,2,31,2,2));



function sum2(...nums) {
  let counter = 0;
  for (let i = 0; i < nums.length; i++) {
    counter += nums[i];
  }
  return counter;
}

// console.log(sum2(1,23,4,2,31,2,2));




Function.prototype.myBind1 = function (context) {
  const fn = this
  const inputs = Array.from(arguments).slice(1)
    
  return function boundFunction() {
    const inputs2 = Array.from(arguments)
     
    return fn.apply(context, inputs.concat(inputs2))
  };

  
}
// markov.says.myBind1(pavlov)("meow", "a tree");



Function.prototype.myBind2 = function (ctx, ...bindArgs) {
  return this.apply(ctx, bindArgs)
}



class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");


// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind1(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind1(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind1(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind1(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true


Function.prototype.curry = function (numArgs) {  
    let args = []; // 1. empty arr for args

    return function curriedSum(arg) {
        args.push(arg);

        if (args.length === numArgs) {
            return args.reduce((acc, el) => acc + el)    // arr.inject{|acc, el| acc + el }
            
        } else {
            return curriedSum;
        }
    }
    //return curriedSum;
};



function curriedSum(numArgs) {
    const numbers = [];

    return function _curriedSum(number) {
        numbers.push(number);
        if (numbers.length === numArgs) {
            return numbers.reduce((acc, el) => acc + el) 
        } else {
            return _curriedSum;
        }
    }
}

// using apply
Function.prototype.curry1 = function (numArgs) {
    const numbers = [];
    const fn = this;

    return function _curriedSum(number) {
        numbers.push(number);
        if (numbers.length === numArgs) {
            return fn.apply(null, numbers)
        } else {
            return _curriedSum;
        }
    }
};


//sumThree;
console.log(sum2.curry1(4)(1)(49)(27)(6));


//console.log(curriedSum(3)(4)(20)(6));

// (9, 5, 6, 7, 8, 43)

// Note that the curried version returns functions at each invocation until it has the full number of arguments it needs.At this point it actually invokes sumThree and returns the result.

// Write a curriedSum function that takes an integer(how many numbers to sum) and returns a function that can be successively called with single arguments until it finally returns a sum.That is:

// const sum = curriedSum(4); 4 is numArgs
// sum(5)(30)(20)(1); // => 56  each of () is arg

// Hint: curriedSum(numArgs) should:
// Define an empty array, numbers.
// Defines a function, _curriedSum that:

// Closes over numArgs and numbers.
// Takes a single number as an argument.
// Appends this to numbers each time.
// If numbers.length === numArgs, it sums the numbers in the array and returns the result.
//     Else, it returns itself.





function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

// or more briefly:
//console.log(sumThree.curry(3)(4)(20)(6)); // == 30








/**
 * With ES6 arrow functions
 * Notice we dont need to keep track of the `this` context (const fn = this).
 * An arrow function does not have its own `this`,
 * the `this` value of the enclosing execution context is used.
 */
Function.prototype.curry2 = function (numArgs) {
    const numbers = [];
    
    // () => functions

    return _curriedSum = (number) => {
        numbers.push(number);
        if (numbers.length === numArgs) {
            return this(...numbers);
        } else {
            return _curriedSum;
        }
    }
}

console.log(sum2.curry2(4)(1)(49)(27)(6));

