import Model from "./Model";

class Usuario extends Model {

    #usuario = "";
    #password  = "";
    
    #estado = false;

    #idEmpleado = 0;
    #idRol = 0;

    constructor()  {
        super();
    }

    // setters 
    setUsuario(usuario) {
        this.#usuario = usuario;
    }
    setPassword(password) {
        this.#password = password;
    }
    setEstado(estado) {
        this.#estado = estado;
    }
    setIdEmpleado(idEmpleado) {
        this.#idEmpleado = idEmpleado;
    }
    setIdRol(idRol) {
        this.#idRol = idRol;
    }

    // getters
    getUsuario() {
        return this.#usuario;
    }
    getPassword() {
        return this.#password;
    }
    getIdEmpleado() {
        return this.#idEmpleado;
    }
    getIdRol() {
        return this.#idRol;
    }

    // especiales
    isActivo() {
        return this.#estado;
    }
}

export default Usuario;