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

   async deleteProducto(id) {
      try {
          const request = this.urlProducto + id
          const response = await axios.patch(request, {
              estado: false
          });

          console.log('Producto eliminado exitosamente:', response.data);
      } catch (error) {
          console.error('Error al eliminar el producto:', error);
      }
    }


    async postProducto(datosP){
      try {
          const response = await axios.post(this.urlProducto, datosP);


          console.log(response.data.mensaje)

          return 1
        } catch (error) {
          console.error('Error:', error.response?.data?.mensaje || error.mensaje);
          return 0
        }

    }

    async patchProducto(id, datos) {
        try {
            const request = this.urlProducto + id
            const response = await axios.patch(request, datos);

            
            console.log('Producto editado exitosamente:', response.data);
        } catch (error) {
            console.error('Error al editar el producto:', error);
        }

    }   

}

export default Producto;
