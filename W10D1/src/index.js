const DOMNodeCollection = require('./dom_node_collection');

window.$l = function(arg) {
    let elements = [];
    if (typeof arg === 'string') {
        const nodeList =  document.querySelectorAll(arg); // this line changes the string to instance of htmlelement
        elements = Array.from(nodeList);
    } else if (arg instanceof HTMLElement) {
        elements.push(arg);
    }
    return new DOMNodeCollection(elements);
}