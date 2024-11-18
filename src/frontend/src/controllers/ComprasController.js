import axios from "axios";
import Controller from "./Controller";

class ComprasController extends Controller  {

    constructor(hostname) {
        super(hostname);
    }

    async guardar(datos) {
        try {
            await axios.post(this.prepararRutaConexion(['compras']), datos).then(data => {
                this.fireControllerListener(data);
            });
        } catch (error) {
            console.log(error);
        }
    }
}

export default ComprasController;