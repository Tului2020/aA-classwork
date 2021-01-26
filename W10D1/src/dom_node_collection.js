class DOMNodeCollection {
    constructor(HTMLElements) {
        this.HTMLElements = HTMLElements;
        return this;
    }

    html(txt) {
        if (txt) {
            this.HTMLElements.forEach(element => {
            element.innerHTML = txt;
        })} else {
            return this.HTMLElements[0].innerHTML;
        }
    };

    empty() {
        this.html(' ');
    };

    append(inp) {
        // debugger
        if (typeof inp === 'string'){
            this.HTMLElements.forEach(element => {
                element.innerHTML += inp;
            })
        } else if (inp instanceof Array && inp.every(el => el instanceof HTMLElement)){
            this.HTMLElements.forEach(element => {
                inp.forEach(el => {
                    element.innerHTML += el.outerHTML;
                })
            })
        } else if (inp instanceof HTMLElement) {
            this.HTMLElements.forEach(element => {
                element.innerHTML += inp.outerHTML;
            })
        } else if (inp instanceof DOMNodeCollection) {
            this.HTMLElements.forEach(element => {
                inp.HTMLElements.forEach(el2 =>{
                    element.innerHTML += el2.outerHTML;
                })
            })
        }
    };

    attr(attribute, value) {
        if (typeof value === 'string') {
            this.HTMLElements.forEach(el => {
                el.setAttribute(attribute, value);
            })
        } else {
            return this.HTMLElements[0].getAttribute(attribute);
        }
    }

    addClass(...newClasses) {
        this.HTMLElements.forEach(el => {
            newClasses.forEach(newclass => {
                el.classList.add(newclass);
            })
        })
    }

    removeClass(...newClasses) {
        this.HTMLElements.forEach(el => {
            newClasses.forEach(newclass => {
                el.classList.remove(newclass);
            })
        })
    }

    children() {
        let childs = [];
        this.HTMLElements.forEach(el => {
            childs = childs.concat(Array.from(el.children));
        })
        return new DOMNodeCollection(childs);
    }

    parent() {
        let parents = [];
        this.HTMLElements.forEach(el => {
            if (!parents.includes(el.parentElement)) parents.push(el.parentElement);
        })
        return new DOMNodeCollection(parents);
    }

    find(selector) {
        let found = [];
        this.HTMLElements.forEach(el => {
            const nodeList = el.querySelectorAll(selector);
            found = found.concat(Array.from(nodeList));
        })
        return new DOMNodeCollection(found);
    }

    remove() {
        this.HTMLElements.forEach(el => {
            el.innerHTML = ' ';
        })
    }
}

module.exports = DOMNodeCollection;