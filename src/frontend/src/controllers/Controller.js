class Controller {

    listener;

    constructor(hostname) {
        this.hostname = hostname;
    }

    setControllerListener(listener) {
        this.listener = listener;
    }

    fireControllerListener(args) {
        if (this.listener !== null) {
            this.listener(args);
        }
    }

    prepararRutaConexion(args) {
        let ruta = this.hostname;
        for (let i = 0; i < args.length; i++) {
            ruta += '/' + args[i];
        }
        return ruta;
    }
}

export default Controller;