import Model from "./Model";

class Historial extends Model {

    #descripcion;
    #fecha;
    #idUsuario;

    constructor() {
        super();
    }

    setDescripcion(descripcion) {
        this.#descripcion = descripcion;
    }
    setFecha(fecha) {
        this.#fecha = fecha;
    }
    setIdUsuario(idUsuario) {
        this.#idUsuario = idUsuario;
    }

    getDescripcion() {
        return this.#descripcion;
    }
    getFecha() {
        return this.#fecha;
    }
    getIdUsuario() {
        return this.#idUsuario;
    }
}

export default Historial;