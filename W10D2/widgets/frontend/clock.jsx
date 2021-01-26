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

  tick() {
    this.setState(state => {
      time: new Date()
    })
  } 

  componentDidMount() {
    this.interval = setInterval(() => this.tick(), 1000);
  }

   componentWillUnmount() {
    clearInterval(this.interval);
  }


  render() {
    return (
      <div>
        Time: {this.state.time}
      </div>
    )
  }
}

export default Clock