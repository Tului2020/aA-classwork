Function.prototype.myThrottle = function(interval){
    let tooSoon = false;
    return(...args) => {
        if (tooSoon === false){
            tooSoon = true;
            setTimeout(function(){tooSoon = false;}, interval);
            this(...args);
        }
           
    };
};


class SearchBar {
    constructor() {
      this.query = "";
  
      this.type = this.type.bind(this);
      this.search = this.search.bind(this);
    }
  
    type(letter) {
      this.query += letter;
      this.search();
    }
  
    search() {
      console.log(`searching for ${this.query}`);
    }
}





// 













Function.prototype.myDebounce = function(interval) {
    let timeOut;

    return(...args) => {
        let fnc = () => {
            timeOut = null;
            this(...args);
        }
        clearTimeout(timeOut);
        timeOut = setTimeout(fnc, interval);
    };

   

};



const searchBar = new SearchBar();


searchBar.search = searchBar.search.myDebounce(5000);
// searchBar.search()




const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};


queryForHelloWorld();




// class Neuron {
//     fire() {
//         console.log("Firing!");
//     }
// }

// const neuron = new Neuron();
// // When we create a new Neuron,
// // we can call #fire as frequently as we want

// // The following code will try to #fire the neuron every 10ms. Try it in the console:
// // const interval = setInterval(() => {
// //     neuron.fire();
// // }, 10);

// // You can use clearInterval to stop the firing:
// // clearInterval(interval);

// // Using Function#myThrottle, we should be able to throttle
// // the #fire function of our neuron so that it can only fire
// // once every 500ms:
// neuron.fire = neuron.fire.myThrottle(500);
// const interval = setInterval(() => {
//     neuron.fire();
// }, 10);

// // interval();


