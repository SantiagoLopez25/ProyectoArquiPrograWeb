class Model {

    #id = 0;

    constructor() { 
        /* nothing. */
    }

    getId() {
        return this.#id;
    }

    setId(id) {
        this.#id = id;
    }
}

export default Model;