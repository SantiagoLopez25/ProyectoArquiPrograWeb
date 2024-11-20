import axios from 'axios';
import LogService from '@/services/LogService';
class Marca {
     
 
    url;
   
    marcas = []; 
   constructor(server){
       this.url  = server + '/marcas' // Servidor -> Laravel'/marcas'
       
   }

   async getMarcas() { //Esta función trabaja de manera asincrona
    try {
        //Petición tipo get para obtener las marcas
         const response = await axios.get(this.url); 
         this.marcas = response.data;
         LogService.log(this.$_SERVER_NAME, "[GET]: Obtener listado de marcas")
         return this.marcas; 
     } catch (error) {
         console.error('Error: ', error);
         return []; 
     }
 }



}

export default Marca;