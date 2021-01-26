import React from "react" 
import ReactDOM from "react-dom" 
import Clock from "./frontend/clock"

function Root() {
  return (
    <div>
      <Clock />
    </div>
  )
}


document.addEventListener('DOMContentLoaded', ()=> {
  const reactRoot = document.getElementById('main');
  ReactDOM.render(Root(), reactRoot);
});






