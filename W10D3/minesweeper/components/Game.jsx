import React from 'react'
import Minesweeper  from './../minesweeper'

class Game extends React.Component {
  constructor(props){
    super(props);
    this.state = {board: new Minesweeper.Board()};
  }

  updateGame() {

  }

  render() {
    return this.state.board
  }

}



