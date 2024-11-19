import axios from "axios";

import Rol from "@/models/Rol";
import Controller from "./Controller";

class RolController extends Controller {

    constructor(hostname) {
        super(hostname);
    }

    prepareNewUserRol(obj) {
        let user = new Rol();
        user.setEstado(obj.estado);
        user.setNombre(obj.nombre);
        user.setId(obj.idRol);
        return user;
    }

    async buscarRol(id) {
        try {
            await axios.get(this.prepararRutaConexion(['roles', id])).then(data => {
                this.fireControllerListener(this.prepareNewUserRol(data.data));
            });
        } catch (error) {
            console.error('js.class.RolController ' , error);
        }
    }
}

export default RolController;