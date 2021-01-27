import React from 'react'
import * as Minesweeper from './../minesweeper'
import Tile from './Tile'

class Board extends React.Component {

  render() {
    // debugger

    const grid = this.props.board.grid.map ((object, index) => {
      return (<div className="row" key={index}>
        {object.map((tileObject, index2) => {
          return (<div className="tile" key={index2}>
            <Tile tile={tileObject} updateGame={this.props.updateGame} />
          </div>)
        })}
      </div>)

    }) 

    return (
      <div className="board">
        {grid}
      </div>
    )
  }
}

export default Board;