import React from "react" 
// import ReactDOM from "react-dom" 

class Clock extends React.Component {

  constructor(props) {
    super(props);
    // this.time = new Date();
    this.state = { time: new Date()};


    // this.hour = this.time.getHours();
    // this.minute = this.time.getMinutes();
    // this.second = this.time.getSeconds();
    // console.log([this.hour, this.minute, this.second]);
    this.tick();
  }

  render() {

  }

  tick() {
    window.setInterval( () => {
      this.second += 1;


      if (this.second === 60){
        this.second = 0;
        this.minute += 1;
      } 
      if (this.minute === 60){
        this.minute = 0;
        this.hour += 1;
      } 
      if (this.hour === 24){
        this.hour = 0;
      } 
    }, 1000)
  } 

}