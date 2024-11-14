import axios from 'axios';
class Sucursal {
     
 
    url
    sucursales = []; 
    ubicaciones = [];
   
    

    constructor(server){
       this.url  = server + '/sucursales' // Servidor -> Laravel'/datosproductos'

   }

    async getSucursales() { //Esta función trabaja de manera asincrona
        try {
            //Petición tipo get para obtener las sucursales
            const response = await axios.get(this.url); 
            this.sucursales = response.data;
           

            this.separarUbicaciones()

            return this.ubicaciones; 
        } catch (error) {
            console.error('Error: ', error);
            return []; 
        }
    }   

    separarUbicaciones(){ //Función para separar la ubicación de las sucursales en latitud y longitud
        this.ubicaciones= []
        this.sucursales.forEach(sucursal => {
            const [lat, lng] = sucursal.ubicacion.split(',');
            const id = sucursal.idSucursal

            
            const ubicacion = {
                idSucursal : id,
                latitud: lat,
                longitud: lng
            }

            this.ubicaciones.push(ubicacion)
             
            
        });
       
    }


 

}

export default Sucursal;