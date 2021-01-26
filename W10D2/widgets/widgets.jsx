import React from "react" 
import ReactDOM from "react-dom" 

function Root() {
  return (<h1>hello</h1>)
}


document.addEventListener('DOMContentLoaded', ()=> {
  const reactRoot = document.getElementById('main');
  ReactDOM.render(Root(), reactRoot);
  // ReactDOM.render(<Widget />, reactRoot)
});






