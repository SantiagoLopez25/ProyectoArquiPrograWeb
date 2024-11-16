import axios from "axios";

import Usuario from "@/models/Usuario";
import Controller from "./Controller";

class UsuarioController extends Controller {

    constructor(hostname) {
        super(hostname);
    }

    prepararUsuario(data) {
        let us = new Usuario();
        if (data === null) {
            return us;
        }

        us.setId(data.idUsuario);
        us.setPassword(data.password);
        us.setEstado(data.estado);
        us.setUsuario(data.usuario);
        us.setIdEmpleado(data.idEmpleado);
        us.setIdRol(data.idRol);
        return us;
    }

    async buscarUsuario(nombre) {
        if (nombre == null || nombre.length === 0) {
            return;
        }

        try {
            await axios.get(this.prepararRutaConexion(['api', 'usuarios', nombre])).then(data => {
                const dt = data.data;
                if (dt == null || dt.length === 0) {
                    dt[0] = null;
                }
                this.fireControllerListener(this.prepararUsuario(data.data[0]));
            });
        } catch (error) {
            console.error('js.class.UsuarioController ' , error);
        }
    }
}


export default UsuarioController;