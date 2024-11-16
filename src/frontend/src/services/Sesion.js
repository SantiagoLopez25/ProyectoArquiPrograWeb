import CryptoJS from "crypto-js";

class Sesion {

    static #VK_SESION = null;
    static #VS_USUARIO = null;

    static init(vk, vs) {
        Sesion.#VK_SESION = vk;
        Sesion.#VS_USUARIO = vs;
    }

    static check() {
        if (Sesion.#VK_SESION === null 
                || Sesion.#VS_USUARIO == null) {
            return false;
        }

        const __val__ = CryptoJS.AES.decrypt(sessionStorage.getItem(Sesion.#VK_SESION), Sesion.#VS_USUARIO).toString(CryptoJS.enc.Utf8);
        if (__val__ !== null && __val__.length !== 0 && __val__ === "true") {
            return true;
        }
        return false;
    }

    static close() {
        Sesion.#VK_SESION = null;
        Sesion.#VS_USUARIO = null;
        sessionStorage.clear();
    }
}

export default Sesion;