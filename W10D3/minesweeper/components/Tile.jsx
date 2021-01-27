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

      let bombs;
      if (this.props.tile.adjacentBombCount() === 0) {
        bombs = ''
      } else {
        bombs = this.props.tile.adjacentBombCount()
      }
      return (
        <div className="tile-explored">
          { bombs}
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