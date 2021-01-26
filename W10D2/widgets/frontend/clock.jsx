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
    // this.componentDidMount();
    this.tick()
  }

  tick() {
    this.setState({
      time: new Date()
    })
    // this.state = { time: new Date()};
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
        Time: {this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()}
        <br></br>
        Date: {this.state.time.toDateString()}
      </div>
    )
  }
}

export default Clock