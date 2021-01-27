import React from 'react'
import * as Minesweeper from './../minesweeper'
import Tile from './tile'

class Board extends React.Component {

  render() {
    // debugger

    const grid = this.props.board.grid.map ((object, index) => {
      return (<div>
        {object.map((tileObject, index2) => {
          <li key={index, index2}>
            <Tile tile={tileObject} updateGame={this.props.updateGame} />
          </li>
        })}
      </div>)

      /*for(let i = 0; i < grid.length; i++) {
          for(let j = 0; j < grid[0].length; j++) {
            grid[i][j] = <title/>
          }
      }*/
    }) 

    return (
      <div>
        {grid}
      </div>
    )
  }
}

export default Board;