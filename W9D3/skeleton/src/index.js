const View = require('./ttt-view')
const Game = require('./../solution/game')  // require appropriate file

  $(() => {
    const rootEl = $('.ttt')
    const game = new Game();
    new View(game, rootEl);

  });
