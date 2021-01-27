// import * as Minesweeper from './../minesweeper'
import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/Game'

function Root() {
  return (
    <div>
      <Game />
    </div>
  );
}


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root />, document.getElementById('game'));
});