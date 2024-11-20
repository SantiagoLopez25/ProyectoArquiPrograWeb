import axios from "axios";
import Controller from "./Controller";

class Inventario extends Controller {
    url;
    inventario = [];
    constructor(server) {
        super(server);
        this.url = server + "/inventario"; 
    }

    async getInventario(id) {
        //Esta función trabaja de manera asincrona
        try {
            //Petición tipo get para obtener el inventario
            const response = await axios.get(this.url+'/'+id);
            this.inventario = response.data;
            return this.inventario;
        } catch (error) {
            console.error("Error: ", error);
            return [];
        }
    }




    async putTraslado( datos) {
        try {
            const request = this.url
            const response = await axios.put(request, datos);

            
            console.log('Traslado existoso:', response.data);
            return true
        } catch (error) {
            console.error('Error al trasladar el producto:', error);
            return false
        }

    }   

}

export default Inventario;
