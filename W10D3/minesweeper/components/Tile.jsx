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
      // debugger
      return (
        <div className="tile-hidden"
          onClick={(e) => this.props.updateGame(this.props.tile, e.altKey)}>
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