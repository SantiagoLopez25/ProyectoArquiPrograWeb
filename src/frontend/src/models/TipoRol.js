class TipoRol {

    static VK_ADMINISTRADOR = "Administrador";
    static VK_GERENTE = "Gerente";

    constructor() {}

    static isAdministrador(rol) {
        return TipoRol.VK_ADMINISTRADOR.toLowerCase() === rol.getNombre().toLowerCase();
    }

    static isGerente(rol) {
        return TipoRol.VK_GERENTE.toLowerCase() === rol.getNombre().toLowerCase();
    }
}

export default TipoRol;