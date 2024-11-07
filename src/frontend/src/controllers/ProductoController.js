import axios from 'axios';
class Producto {
     
 
    url
    productos = []; 
   constructor(){
        this.url = 'http://127.0.0.1:8000/datosproductos'

   }

   async getProductos() { //Esta función trabaja de manera asincrona
     try {
        //Petición tipo get para obtener los productos
         const response = await axios.get(this.url); 
         this.productos = response.data;
         console.log(this.productos);
         return this.productos; 
     } catch (error) {
         console.error('Error: ', error);
         return []; 
     }
 }

}

export default Producto;