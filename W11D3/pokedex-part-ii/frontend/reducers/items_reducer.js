import {RECEIVE_POKEMON} from './../actions/pokemon_actions'

const itemsReducer = (oldState={}, action) => {
  Object.freeze(oldState)
  let newState = Object.assign({}, oldState);

  switch (action.type){
    case RECEIVE_POKEMON:
      newState = action.payload.items
      return newState;

    default:
      return oldState

  }

}


export default itemsReducer;
