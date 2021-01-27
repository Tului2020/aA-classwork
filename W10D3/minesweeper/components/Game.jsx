import React from 'react'
import * as Minesweeper  from './../minesweeper'
import Board from './Board'
// import Tile from './Tile'

class Game extends React.Component {
  constructor(props){
    super(props);
    this.state = {board: new Minesweeper.Board(9, 2)};

    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {

  }

  render() {
    return <Board board={this.state.board} updateGame={this.updateGame} />
    // return (new Board(this.state.board, this.updateGame))
  }

}

export default Game;


