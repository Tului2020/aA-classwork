// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let board = new Array();
  for (let i = 0; i < 8; i++){
    board.push(new Array());
    for (let j = 0; j < 8; j++){
      board[i].push(undefined)
    }
  }
  board[3][3] = new Piece('white')
  board[4][4] = new Piece('white')
  board[4][3] = new Piece('black')
  board[3][4] = new Piece('black')
  return board;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (0 <= x && x <= 7 && 0 <= y && y <= 7){
    return true;
  }
  return false;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos) === false){
    throw new Error("Not valid pos!");
  } else {
    return this.grid[pos[0]][pos[1]];
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);
  if (piece === undefined){
    return false;
  } else {
    return piece.color === color;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.getPiece(pos) !== undefined) {
    return true;
  } else {
    return false;
  }

};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */


//  Solve this recursively!!!!!!!!!!
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip=[]){


  let nextPos = [pos[0] + dir[0], pos[1] + dir[1]];

  if (!this.isValidPos(nextPos)) {
    return [];
  } else{
    if (!this.isOccupied(nextPos)){
      return [];
    } else {
      if (!this.isMine(nextPos, color)){
        piecesToFlip.push(nextPos);
        return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
      } else {
        return piecesToFlip;
      }
    }

  }


  
  
  
  // iterative version:
  /** piecesToFlip = [];
  let nextPos = [pos[0] + dir[0], pos[1] + dir[1]];

  // //  until one of the following conditions is met
  // // 1. nextPos.color === color OR (isMine)
  // // 2. nextPos is undefined (isMine)
  // // 3. nextPos is invalid position OR (isValidPos)

  // while (!this.isMine(nextPos, color) || this.isValidPos(nextPos) ) {

  //   if (this.isMine(nextPos, color)) {
  //     return piecesToFlip;
  //   } else if (!this.isValidPos(nextPos)){

  //   }

  // }

  while (this.isValidPos(nextPos) && !this.isMine(nextPos, color) && this.isOccupied(nextPos)) {
    // console.log(nextPos);
    piecesToFlip.push([nextPos[0], nextPos[1]])
    // piecesToFlip.push(nextPos)
    nextPos[0] = nextPos[0] + dir[0];
    nextPos[1] = nextPos[1] + dir[1];


    if (this.isMine(nextPos, color)) {
      return piecesToFlip
    }
  }
  return []
  **/

};

// let board = new Board;
// board.grid[2][2] = new Piece('white')
// console.log(board)
// console.log(board._positionsToFlip([5, 5], 'black', [-1, -1]));


/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  // array_of_moves = [ [], [], [], [] , [[3, 2]]]
  // array_of_moves.map {|array| array.length}
  // [0, 0, 0, 0, 1].sum > 0

  let flips = []
  for (let i = 0; i < Board.DIRS.length; i++){
    flips.push(this._positionsToFlip(pos, color, Board.DIRS[i], []))
  }

  const reducer = (accumulator, currentValue) => accumulator + currentValue;
  let numMoves = flips.map(x => x.length).reduce(reducer)



  if (this.isOccupied(pos) || numMoves === 0 ){
    return false;
  }
  return true;
};

// let board = new Board;
// console.log(board.validMove([5, 3], 'white'));


/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (this.validMove(pos, color)) {
    this.grid[pos[0]][[pos[1]]] = new Piece(color);
    for(let i = 0; i < Board.DIRS.length; i++){
      let flips = this._positionsToFlip(pos, color, Board.DIRS[i], []);
      if (flips.length > 0){
        for (let flipPos = 0; flipPos < flips.length; flipPos++){
          this.getPiece(flips[flipPos]).flip()
        }
      }
    }
  } else {
    throw new Error("Invalid move!");
  }

};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validMovesArr = [];
  for(let i = 0; i < 8; i++){
    for(let j = 0; j < 8; j++){
      if(!this.isOccupied([i, j]) && this.validMove([i, j], color)){
        validMovesArr.push([i, j]);
      }
    }
  }
  return validMovesArr;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  // validMoves
  return this.validMoves(color).length > 0;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove("white") || !this.hasMove("black");
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE