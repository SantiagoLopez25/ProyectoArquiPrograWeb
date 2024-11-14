

class UbicacionService {

    constructor(){
        this.ubicaciones = [];
        this.latitud;
        this.longitud;
        this.idSucursal;
    }

    setUbicaciones(ubicaciones){
        
        this.ubicaciones = ubicaciones
    }

    ubicacionAleatoria(){
        // se genera una ubicación aleatorioa dentro de Guatemala 
        this.latitud =  (Math.random() * (17.8 - 13.7) + 13.7).toFixed(6)
        this.longitud = (Math.random() * (-88.2 + 92.3) - 92.3).toFixed(6)
    }

    setUbicacion(latitud, longitud){
        this.latitud = latitud
        this.longitud = longitud
    }

    // Función para encontrar la ubicación más cercana
    tiendaMasCercana(){

        let closest = null;
        let minDistance = Infinity;
       

        this.ubicaciones.forEach(ubicacion => {
            const distance = this.haversineDistance(
                parseFloat(this.latitud),
                parseFloat(this.longitud),
                parseFloat(ubicacion.latitud),
                parseFloat(ubicacion.longitud))

            if (distance < minDistance) {
            minDistance = distance
            
            closest = ubicacion
            }
        });

        this.idSucursal = closest
        return closest;

    }

    // Función para calcular la distancia usando la fórmula de Haversine
    haversineDistance(lat1, lon1, lat2, lon2) {

        lat1 = parseFloat(lat1);
        lon1 = parseFloat(lon1);
        lat2 = parseFloat(lat2);
        lon2 = parseFloat(lon2);
    
        // Verificar si los valores son números válidos
        if (isNaN(lat1) || isNaN(lon1) || isNaN(lat2) || isNaN(lon2)) {
            console.error("Error: Coordenadas inválidas");
            return Infinity;
        }


        const toRad = angle => (angle * Math.PI) / 180;
      
        const R = 6371; // Radio de la Tierra en kilómetros
        const dLat = toRad(lat2 - lat1);
        const dLon = toRad(lon2 - lon1);
        const a =
          Math.sin(dLat / 2) ** 2 +
          Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLon / 2) ** 2;
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      
        return R * c; // Retorna la distancia en kilómetros
    }

    getIdSucursal(){
        return this.idSucursal
    }

}

export default new UbicacionService();