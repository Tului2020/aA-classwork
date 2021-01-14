Array.prototype.uniq = function() {
    let retArray = [];
    for (let i = 0; i < this.length; i++) {
        if (!retArray.includes(this[i])) {
            retArray.push(this[i]);
        }
    }
    return retArray;
}

// console.log([1, 2, 2, 3, 3, 3].uniq())

Array.prototype.twoSum = function() {
    let position = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] === -this[j]) {
                position.push([i,j]);
            }
        }
    }
    return position;
}

// console.log([1,-9,23,5,-5].twoSum())

Array.prototype.transpose = function() {

    let array = new Array(this[0].length)
    
    for (let i = 0; i < array.length; i++) {
        array[i] = new Array
        for (let j = 0; j < this.length; j++) {
            array[i].push(this[j][i])
        }
    }

    
    return array
}

// let testArr = [[1, 2], [3, 4], [5, 6]]
// console.log(testArr)
// console.log(testArr.transpose())





