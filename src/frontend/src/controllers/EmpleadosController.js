import axios from "axios";
import Controller from "./Controller";

class EmpleadosController extends Controller {

    constructor(hostname) {
        super(hostname);
    }

    async listarTodo() {
        try {
            await axios.get(this.prepararRutaConexion(['empleados'])).then(data => {
                this.fireControllerListener(data.data);
            });
        } catch (error) {
            console.error(error)
        }
    }
}

export default EmpleadosController;