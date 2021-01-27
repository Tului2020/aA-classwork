import React from 'react'
import * as Minesweeper from './../minesweeper'

class Tile extends React.Component {
  render() {
    if (this.props.tile.flagged) {
      return (
        <div className="tile-flagged">
          {"\u2691"}
        </div>
      )
    } else if (this.props.tile.explored){
      if (this.props.tile.bombed){
        return (
          <div className="tile-bombed">
            { '\uD83D\uDCA3'}
          </div>
        )
      }

      return (
        <div className="tile-explored">
          {this.props.tile.adjacentBombCount()}
        </div>
      )

    } else {
      return (
        <div className="tile-hidden">
          H
        </div>
      )
    } 


    // debugger
    // return (
    // <div>
    //   E
    // </div>) 
  }
}

export default Tile;