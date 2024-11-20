import HistorialController from "@/controllers/HistorialController";

class LogService {

    static #LOG_CONTROLLER = null;

    constructor() {}
    static listener(evnt) {
        if (LogService.#LOG_CONTROLLER !== null) {
            LogService.#LOG_CONTROLLER.setControllerListener(evnt);
        }
    } 
    static log(hostname, info) {
        LogService.check(hostname);
        LogService.#LOG_CONTROLLER.log(info);

        /* debug */
        console.info(info);
    }

    static check(hostname) {
        if (LogService.#LOG_CONTROLLER === null) {
            LogService.#LOG_CONTROLLER = new HistorialController(hostname);
        }
    }
}

export default LogService;