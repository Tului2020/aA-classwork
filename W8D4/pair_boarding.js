// Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and 
// node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's 
// descendants. The tree s could also be considered as a subtree of itself.
// Example 1:Given tree s:
//      3
//     / \
//    4   5
//   / \
//  1   2
// Given tree t:
//    4   
//   / \
//  1   2
// Return true, because t has the same structure and node values with a subtree of s.
// Example 2:`
// Given tree s:
//      3
//     / \
//    4   5
//   / \
//  1   2
//     /
//    0
// Given tree t:
//    4
//   / \
//  1   2
// Return false.

function Tree(value){
  this.value = value;
  this.children = [];
  this.parent = null;
}

let t3 = new Tree(3); 
let t4 = new Tree(4); 
let t5 = new Tree(5); 
let t1 = new Tree(1); 
let t2 = new Tree(2); 

t3.children.push(t4, t5);

t4.children.push(t1, t2);


// console.log(t3);

function checkTree(s, t){

}

function bfs(tree, targetValue){
  let queue = [tree];
  while (queue.length > 0){
    // console.log([queue[0].value, queue[0]]);

    if (queue[0].value === targetValue){
      console.log(true);
      return true;
    } else {
      console.log(queue[0].children);
      queue.concat(queue[0].children);
      console.log(queue);
      queue.shift();
      console.log(queue);
    }
  }
  return false;
}

console.log(bfs(t3, 5));