/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./react_minesweeper.jsx");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./minesweeper.js":
/*!************************!*\
  !*** ./minesweeper.js ***!
  \************************/
/*! exports provided: Tile, Board */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Tile", function() { return Tile; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "Board", function() { return Board; });
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

var Tile = /*#__PURE__*/function () {
  function Tile(board, pos) {
    _classCallCheck(this, Tile);

    this.board = board;
    this.pos = pos;
    this.bombed = false;
    this.explored = false;
    this.flagged = false;
  }

  _createClass(Tile, [{
    key: "adjacentBombCount",
    value: function adjacentBombCount() {
      var bombCount = 0;
      this.neighbors().forEach(function (neighbor) {
        if (neighbor.bombed) {
          bombCount++;
        }
      });
      return bombCount;
    }
  }, {
    key: "explore",
    value: function explore() {
      if (this.flagged || this.explored) {
        return this;
      }

      this.explored = true;

      if (!this.bombed && this.adjacentBombCount() === 0) {
        this.neighbors().forEach(function (tile) {
          tile.explore();
        });
      }
    }
  }, {
    key: "neighbors",
    value: function neighbors() {
      var _this = this;

      var adjacentCoords = [];
      Tile.DELTAS.forEach(function (delta) {
        var newPos = [delta[0] + _this.pos[0], delta[1] + _this.pos[1]];

        if (_this.board.onBoard(newPos)) {
          adjacentCoords.push(newPos);
        }
      });
      return adjacentCoords.map(function (coord) {
        return _this.board.grid[coord[0]][coord[1]];
      });
    }
  }, {
    key: "plantBomb",
    value: function plantBomb() {
      this.bombed = true;
    }
  }, {
    key: "toggleFlag",
    value: function toggleFlag() {
      if (!this.explored) {
        this.flagged = !this.flagged;
        return true;
      }

      return false;
    }
  }]);

  return Tile;
}();
Tile.DELTAS = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]];
var Board = /*#__PURE__*/function () {
  function Board(gridSize, numBombs) {
    _classCallCheck(this, Board);

    this.gridSize = gridSize;
    this.grid = [];
    this.numBombs = numBombs;
    this.generateBoard();
    this.plantBombs();
  }

  _createClass(Board, [{
    key: "generateBoard",
    value: function generateBoard() {
      for (var i = 0; i < this.gridSize; i++) {
        this.grid.push([]);

        for (var j = 0; j < this.gridSize; j++) {
          var tile = new Tile(this, [i, j]);
          this.grid[i].push(tile);
        }
      }
    }
  }, {
    key: "onBoard",
    value: function onBoard(pos) {
      return pos[0] >= 0 && pos[0] < this.gridSize && pos[1] >= 0 && pos[1] < this.gridSize;
    }
  }, {
    key: "plantBombs",
    value: function plantBombs() {
      var totalPlantedBombs = 0;

      while (totalPlantedBombs < this.numBombs) {
        var row = Math.floor(Math.random() * (this.gridSize - 1));
        var col = Math.floor(Math.random() * (this.gridSize - 1));
        var tile = this.grid[row][col];

        if (!tile.bombed) {
          tile.plantBomb();
          totalPlantedBombs++;
        }
      }
    }
  }, {
    key: "lost",
    value: function lost() {
      var lost = false;
      this.grid.forEach(function (row) {
        row.forEach(function (tile) {
          if (tile.bombed && tile.explored) {
            lost = true;
          }
        });
      });
      return lost;
    }
  }, {
    key: "won",
    value: function won() {
      var won = true;
      this.grid.forEach(function (row) {
        row.forEach(function (tile) {
          if (tile.flagged === tile.revealed || tile.flagged !== tile.bombed) {
            won = false;
          }
        });
      });
      return won;
    }
  }]);

  return Board;
}();

/***/ }),

/***/ "./react_minesweeper.jsx":
/*!*******************************!*\
  !*** ./react_minesweeper.jsx ***!
  \*******************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _minesweeper__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./minesweeper */ "./minesweeper.js");


/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map