Array.prototype.bubbleSort = function() {
  let sorting = true;

  while (sorting) {
    sorting = false;

    for (let i = 0; i < this.length - 1; i++){
      if (this[i] > this[i + 1]) {
        let temp = this[i]
        this[i] = this[i + 1]
        this[i + 1] = temp
        sorting = true
      }
    }
  }
  return this
}


// let x = [1,2,3,4,5,6, 1, -10, -11]
// console.log(x.bubbleSort())

String.prototype.substrings = function() {
  let subs = []

  for (let i = 0; i < this.length; i++){
    for (let j = i + 1; j < this.length; j++){
      subs.push(this.slice(i, j))
    }
  }
  return subs
}


console.log('123456'.substrings())
