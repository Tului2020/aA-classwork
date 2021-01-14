Array.prototype.myEach = function (cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i])
  }
}

let testCB = function (num) {
  return num + 1
}

// console.log([1,23,4,5,6].myEach(testCB))
// console.log([1,23,4,5,6].forEach(testCB))

Array.prototype.myMap = function (cb) {
  let retArr = []
  for (let i = 0; i < this.length; i++) {
    retArr.push(cb(this[i]))
  }
  return retArr
}

// arr = [1,23,4,5,6]
// console.log(arr.myMap(testCB))
// console.log(arr)

Array.prototype.myReduce = function(callback, initialValue) {
  let acc = this[0]
  let idx = 1
  if (initialValue !== undefined) {
    acc = initialValue
    idx = 0
  }

  for (let i = idx; i < this.length; i++) {
    acc = callback(acc, this[i])
  }
  return acc
}

console.log([1, 2, 3].myReduce(function(acc, el) {
  return acc + el;
}, 10));











