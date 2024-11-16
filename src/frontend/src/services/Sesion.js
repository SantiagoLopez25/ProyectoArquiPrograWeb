import Usuario from "@/models/Usuario";
import CryptoJS from "crypto-js";

class Sesion {

    static #VK_SESION = null;
    static #VS_USUARIO = null;
    static #USUARIO_MODEL = null;

    static init(vk, vs, model) {
        sessionStorage.setItem("VK_SESION", vk);
        sessionStorage.setItem("VS_USUARIO", vs);
        sessionStorage.setItem("USUARIO_MODEL", JSON.stringify(model));
        sessionStorage.setItem("USUARIO_MODEL_ID", model.getId());
        Sesion.load();
    }

    static load() {
        Sesion.#VK_SESION = sessionStorage.getItem("VK_SESION");
        Sesion.#VS_USUARIO = sessionStorage.getItem("VS_USUARIO");
        Sesion.#USUARIO_MODEL = JSON.parse(sessionStorage.getItem("USUARIO_MODEL"));
    }

    static getUsuario() {
        Sesion.load();
        const obj = Sesion.#USUARIO_MODEL;
        const user = new Usuario();
        user.setUsuario(obj.usuario);
        user.setEstado(obj.estado);
        user.setIdEmpleado(obj.idEmpleado);
        user.setIdRol(obj.idRol);
        user.setId(parseInt(sessionStorage.getItem("USUARIO_MODEL_ID")));
        return user;
    }

    static check() {
        Sesion.load();
        if (
            Sesion.#VK_SESION === null || 
            Sesion.#VS_USUARIO === null || 
            Sesion.#USUARIO_MODEL === null
        ) {
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
        Sesion.#USUARIO_MODEL = null;
        sessionStorage.clear();
    }
}

export default Sesion;