import axios from "axios";
import Controller from "./Controller";
import Sesion from "@/services/Sesion";

class HistorialController extends Controller {

    constructor(hostname) {
        super(hostname);
    }

    async log(hitorial) {
        try {
            const d = new Date()
            const date = d.toISOString().split('T')[0];
            const time = d.toTimeString().split(' ')[0];

            console.log((date + ' ' + time))
            const datos = {
                "descripcion": hitorial,
                "fecha": (date + ' ' + time),
                "idUsuario": Sesion.getUsuario().getId()
            };
            await axios.post(
                this.prepararRutaConexion(['historiales']),
                datos
            ).then(data => {
                console.log("[ ok ] Logguer >", Sesion.getUsuario().getUsuario());
                //this.fireControllerListener(data);
            });
        } catch (error) {
            console.error(error)
        }
    }
}

export default HistorialController;