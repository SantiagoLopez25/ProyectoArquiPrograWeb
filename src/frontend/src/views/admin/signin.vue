<script>
import { loadScript, unloadScript } from "vue-plugin-load-script";
import { sha512 } from "js-sha512";
import CryptoJS from "crypto-js";

import UsuarioController from "@/controllers/UsuarioController";
import Sesion from "@/services/Sesion";
import LogService from "@/services/LogService";

export default {
  page: {},
  components: {},
  data() {
    return {
      appName: this.$APP_NAME,
      userController: null,
      scripts: [
        '/libs/jquery/dist/jquery.min.js',
        '/libs/bootstrap/dist/js/bootstrap.bundle.min.js',
        /* solar icons */
        'https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js'
      ]
    }
  },
  methods: {
    initComponents() {
      this.userController = new UsuarioController(this.$_SERVER_NAME);

    },
    html(myId) {
      return document.getElementById(myId);
    },
    login() {
      this.userController.setControllerListener(data => {
        if (sha512(this.html('pass').value) === data.getPassword()) {
          // Generamos una clave secreta aleatoria
          const kk_key = CryptoJS.lib.WordArray.random(15);
          const kv_key = CryptoJS.lib.WordArray.random(16);

          sessionStorage.setItem(
            kk_key.toString(),
            CryptoJS.AES.encrypt("true", kv_key.toString())
          );

          Sesion.init(kk_key.toString(), kv_key.toString(), data);
          LogService.log(this.$_SERVER_NAME, "sesión inicidada");
          
          this.$router.push('/admin/')
        } else {
          this.$K_OPCION = null;
          sessionStorage.clear();
          alert('Error al iniciar sesión');
        }
      })
      this.userController.buscarUsuario(
        this.html('user').value, 
        /*this.html('pass').value*/
      )
    }
  },
  beforeMount() {
    if (Sesion.check()) {
        this.$router.push('/admin/');
    }
  },
  mounted() {
    this.scripts.forEach((element) => {
      loadScript(element)
        .then(() => {
          if (this.$DEBUG) {
            console.info('[ ok ] :Load Script (', element, ')')
          }
        })
        .catch(() => {
          if (this.$DEBUG) {
            console.error('[ error ] :Load Script {', element, '}')
          }
        });
    })

    this.initComponents();
  },
  unmounted() {
    this.scripts.forEach((element) => {
      unloadScript(element)
        .then(() => {
          if (this.$DEBUG) {
            console.info('[ ok ] :Unload Script', element)
          }
        })
        .catch(() => {
          if (this.$DEBUG) {
            console.error('[ error ] :Unload Script', element)
          }
        });
    })
  }
}
</script>

<template>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden text-bg-light min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <RouterLink to="/admin/" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="@/assets/logo.svg" alt="" width="50px">
                </RouterLink>
                <p class="text-center">Iniciar sesión en {{ this.$APP_NAME }}</p>
                <form @submit.prevent="submit">
                  <div class="mb-3">
                    <label for="user" class="form-label">Username</label>
                    <input type="text" class="form-control" id="user" aria-describedby="emailHelp" required>
                  </div>
                  <div class="mb-4">
                    <label for="pass" class="form-label">Password</label>
                    <input type="password" class="form-control" id="pass" required>
                  </div>

                  <!-- <div class="d-flex align-items-center justify-content-between mb-4">
                    <div class="form-check">
                      <input class="form-check-input primary" type="checkbox" value="" id="flexCheckChecked" checked>
                      <label class="form-check-label text-dark" for="flexCheckChecked">
                        Remeber this Device
                      </label>
                    </div>
                    <a class="text-primary fw-bold" href="">Forgot Password ?</a>
                  </div> -->
                  <!--<RouterLink to="/admin/" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2">Sign In</RouterLink>-->
                  <button type="submit" class="btn btn-primary w-100 py-8 fs-4 mb-4 rounded-2" v-on:click="login()">Ingresar</button>
                  <div class="d-flex align-items-center justify-content-center">
                    <p class="fs-4 mb-0 fw-bold">Eres nuevo en {{ this.$APP_NAME }}?</p>
                    <RouterLink class="text-primary fw-bold ms-2" to="/admin/signup">Crear una cuenta</RouterLink>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<style>
@import '../../assets/css/styles.min.css';
</style>