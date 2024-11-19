import axios from 'axios';
import Controller from './Controller';
import data from '@/assets/libs/bootstrap/js/src/dom/data';

class Sucursal extends Controller {

    url
    sucursales = [];
    ubicaciones = [];


    constructor(server) {
        super(server);
        this.url = server + '/sucursales' // Servidor -> Laravel'/datosproductos'

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

    async listarSucursal() {
        try {
            await axios.get(this.prepararRutaConexion(['sucursales'])).then(data => {
                this.fireControllerListener(data.data);
            })
        } catch (error) {
            console.error(error)
        }
    }

    separarUbicaciones() { //Función para separar la ubicación de las sucursales en latitud y longitud
        this.ubicaciones = []
        this.sucursales.forEach(sucursal => {
            const [lat, lng] = sucursal.ubicacion.split(',');
            const id = sucursal.idSucursal
            const nombreSucursal = sucursal.nombre


            const ubicacion = {
                idSucursal: id,
                latitud: lat,
                longitud: lng,
                nombre: nombreSucursal
            }

            this.ubicaciones.push(ubicacion)


        });

    }
}

export default Sucursal;