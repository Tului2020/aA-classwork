import React from 'react'
import * as Minesweeper  from './../minesweeper'
import Board from './Board'
// import Tile from './Tile'

class Game extends React.Component {
  constructor(props){
    super(props);
    this.state = {board: new Minesweeper.Board(9, 2)};

    this.updateGame = this.updateGame.bind(this);
    this.gameOver = this.gameOver.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tile, alt) {
    if (alt){
      tile.toggleFlag();
    } else{
      tile.explore()
    }
    this.setState({board: this.state.board})
    console.log(this.gameOver())
  }


  gameOver(){
    if (this.state.board.lost()){
      return 'lost'
    } else if (this.state.board.won()) {
      return 'won'
    } else {
      return 'play'
    }
  }

  restartGame() {
    console.log("restartGame")
    this.setState({board: new Minesweeper.Board(this.state.board.gridSize, this.state.board.numBombs)})
  }

  render() {
    
    if (this.gameOver() === 'lost' || this.gameOver() === 'won') {
      this.restartGame();
    }
    return <Board board={this.state.board} updateGame={this.updateGame} />
    // return (new Board(this.state.board, this.updateGame))
  }

}

export default Game;


