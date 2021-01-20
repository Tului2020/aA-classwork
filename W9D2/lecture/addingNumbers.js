function boringAddThreeNumbers(num1, num2, num3) {
  return num1 + num2 + num3;
}

function addThreeNumbers(num1) {
  return function(num2) {
    return function(num3) {
      return num1 + num2 + num3;
    }
  }
}



const coolAddThreeNumbers = (num1, num2, num3) => num1 + num2 + num3;

const coolerAddThreeNumbers = num1 =>{
  return num2 => {
    return num3 => {
      return num1 + num2 + num3;
    }
  }
}

const superCoolestAddThreeNumbers = (num1) => (num2) => (num3) => num1 + num2 + num3;


// console.log(addThreeNumbers(3)(2)(1));
// console.log(boringAddThreeNumbers(3, 2, 1));
// console.log(coolAddThreeNumbers(3, 2, 1));
// console.log(coolerAddThreeNumbers(3)(2)(1));
// console.log(superCoolestAddThreeNumbers(3)(2)(1));


function continuousAdd() {
  const args = [];
  return function _curriedAdd(num) {
    args.push(num);
    console.log(args.reduce((acc, el) => acc + el));
    return _curriedAdd;
  }
}

const adder = continuousAdd();

adder(1)(3)(2)
console.log(args);