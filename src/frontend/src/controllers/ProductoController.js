import axios from "axios";
import Controller from "./Controller";

class Producto extends Controller {
    url;
    productos = [];
    constructor(server) {
        super(server);
        this.url = server + "/datosproductos"; // Servidor -> Laravel'/datosproductos'
    }

    async getProductos() {
        //Esta función trabaja de manera asincrona
        try {
            //Petición tipo get para obtener los productos
            const response = await axios.get(this.url);
            this.productos = response.data;
            return this.productos;
        } catch (error) {
            console.error("Error: ", error);
            return [];
        }
    }

    async buscarProducto(id) {
        try {
            await axios.get(this.prepararRutaConexion(['datosproductos', id])).then(data => {
                this.fireControllerListener(data.data);
            });
        } catch (error) {
            console.error(error)
        }
    }
}

export default Producto;
