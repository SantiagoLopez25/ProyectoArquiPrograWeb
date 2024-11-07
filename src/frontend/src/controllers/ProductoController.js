import axios from 'axios';
class Producto {
     
 
    url
    productos = []; 
   constructor(server){
       this.url  = server + '/datosproductos' // Servidor -> Laravel'/datosproductos'

   }

   async getProductos() { //Esta función trabaja de manera asincrona
    try {
        //Petición tipo get para obtener los productos
         const response = await axios.get(this.url); 
         this.productos = response.data;
         return this.productos; 
     } catch (error) {
         console.error('Error: ', error);
         return []; 
     }
 }

}

export default Producto;