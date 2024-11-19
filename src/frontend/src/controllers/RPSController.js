import axios from "axios";
import Controller from "./Controller";
import RPSModel from "@/models/RPSModel";

class RPSController extends Controller {

    constructor(hostname) {
        super(hostname);
    }

    async listarTodo() {
        try {
            await axios.get(this.prepararRutaConexion(['rps'])).then(data => {
                var list = [];

                data.data.forEach(element => {
                    let model = new RPSModel();
                    model.setIdProductoSucursal(element.idProductoSucursal);
                    model.setCantidad(element.cantidad);
                    model.setIdProducto(element.idProducto);
                    model.setIdSucursal(element.idSucursal);
                    list.push(model);
                });

                this.fireControllerListener(list);
            });
        } catch (error) {
            console.error(error)
        }
    }

    async listar(id) {
        try {
            await axios.get(this.prepararRutaConexion(['api', 'rps', id])).then(data => {
                this.fireControllerListener(data.data);
            });
        } catch (error) {
            console.error(error)
        }
    }
}

export default RPSController;