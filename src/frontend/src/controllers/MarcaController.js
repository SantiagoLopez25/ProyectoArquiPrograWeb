import axios from 'axios';
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
         return this.marcas; 
     } catch (error) {
         console.error('Error: ', error);
         return []; 
     }
 }



}

export default Marca;