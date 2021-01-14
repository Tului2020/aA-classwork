function range(start, end) {
    if (start === end) {
        return [end];
    } else {
        return range(start, end - 1).concat([end]);
    }
}

// console.log(range(0, 10))

function sumRec(arr) {
    if (arr.length === 1) {
        return arr[0];
    } else {
        return arr[0] + sumRec(arr.slice(1,arr.length))
    }
}

// console.log(sumRec([2,4,6]))

function exponent(base, exp) {
    if (exp === 0) {
        return 1;
    } else {
        if (exp < 0) {
            return exponent(base, exp - exp / Math.abs(exp))/base
        } else {
            return exponent(base, exp - exp / Math.abs(exp)) * base
        }
        // return base * exponent(base, exp - exp/Math.abs(exp))
        
    }
}

// console.log(exponent(3.0, 0))
// start w/ 0
function fibonacci(n) {
  if (n <= 1) {
    return 1;
  } else {
    return fibonacci(n-1) + fibonacci(n-2);
  }
}

// console.log(fibonacci(1))

function deepDup(arr) {
  let dup = []

  for (let i = 0; i < arr.length; i++){
    if (Array.isArray(arr[i])) {
      dup.push(deepDup(arr[i]))
    } else {
      dup.push(arr[i])
    }
  }
  return dup

  // if (Array.isArray(arr) === false) {
  //     return arr;
  // } else {
  //     arr.forEach(deepDub)
  // }
}

// arr = [12,'3213', [321321, '32131']]
// arr1 = deepDup(arr)

// arr[2][1] = 4
// console.log(arr)
// console.log(arr1)


