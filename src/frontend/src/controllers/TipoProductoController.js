import axios from 'axios';
class TipoProducto {
     
 
    url;
   
    tiposP = []; 
   constructor(server){
       this.url  = server + '/tiposp' // Servidor -> Laravel'/marcas'
       
   }

   async getTipoProductos() { //Esta función trabaja de manera asincrona
    try {
        //Petición tipo get para obtener las marcas
         const response = await axios.get(this.url); 
         this.tiposP = response.data;
         return this.tiposP; 
     } catch (error) {
         console.error('Error: ', error);
         return []; 
     }
 }



}

export default TipoProducto;