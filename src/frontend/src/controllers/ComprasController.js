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

    async listar() {
        try {
            await axios.get(this.prepararRutaConexion(['compras'])).then(data => {
                this.fireControllerListener(data.data);
            });
        } catch (error) {
            console.error(error)
        }
    }

    async completar(id) {
        try {
            await axios.put(this.prepararRutaConexion(['compras', id])).then(data => {
                this.fireControllerListener(data);
            });
        } catch (error) {
            console.log(error)
        }
    }
}

export default ComprasController;