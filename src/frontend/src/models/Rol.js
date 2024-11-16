import Model from "./Model";

class Rol extends Model {

    #nombre = "";
    #estado = 0;

    constructor() {
        super();
    }

    // setters
    setNombre(nombre) {
        this.#nombre = nombre;
    }
    setEstado(estado) {
        this.#estado = estado;
    }

    // getters
    getNombre() {
        return this.#nombre;
    }

    // especiales
    isActivo() {
        return this.#estado;
    }

    toString() {
        return `{
    "idRol": ${this.getId()},
    "nombre": ${this.getNombre()},
    "estado": ${this.isActivo()}
}`;
    }
}

export default Rol;