import axios from 'axios';
import LogService from '@/services/LogService';

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
         LogService.log(this.$_SERVER_NAME, "[GET]: Obtener listado de tipo de productos")
         return this.tiposP; 
     } catch (error) {
         console.error('Error: ', error);
         return []; 
     }
 }



}

export default TipoProducto;