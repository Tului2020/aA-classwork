import React from 'react'
import * as Minesweeper from './../minesweeper'
import Tile from './tile'

class Board extends React.Component {

  render() {
    // debugger

    const grid = this.props.board.grid.map ((object, index) => {
      return (<div key={index}>
        {object.map((tileObject, index2) => {
          return (<div key={index2}>
            <Tile tile={tileObject} updateGame={this.props.updateGame} />
          </div>)
        })}
      </div>)

    }) 

    return (
      <div>
        {grid}
      </div>
    )
  }
}

export default Board;