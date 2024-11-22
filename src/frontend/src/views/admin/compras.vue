<style>
@import '../../assets/css/styles.min.css';
</style>
<script>
import { loadScript, unloadScript } from "vue-plugin-load-script";

import Sesion from "@/services/Sesion";

import Sidebar from '@/components/admin/Sidebar.vue';
import Navbar from '@/components/admin/Navbar.vue';
import ComprasController from "@/controllers/ComprasController";

export default {
    page: {},
    components: { Sidebar, Navbar },
    data() {
        return {
            pedidos: [],
            scripts: [
                '/libs/jquery/dist/jquery.min.js',
                '/libs/bootstrap/dist/js/bootstrap.bundle.min.js',
                '/js/sidebarmenu.js',
                '/js/app.min.js',
                '/libs/simplebar/dist/simplebar.js',

                /* solar icons */
                'https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js'
            ]
        }
    },
    methods: {
        consultarCompras() {
            var compras = new ComprasController(this.$_SERVER_NAME);
            compras.setControllerListener(data => {
                this.pedidos = data;
            });
            compras.listar();
        },
        completarCompra(id) {
            var compras = new ComprasController(this.$_SERVER_NAME);
            compras.setControllerListener(data => {
                this.consultarCompras();
            })
            compras.completar(id);
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
        
        this.consultarCompras();
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
    <!-- Sidebar Start -->
    <Sidebar></Sidebar>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
      <Navbar></Navbar>

      <!--  Header End -->
      <div class="body-wrapper-inner">
        <div class="container-fluid">
          <div class="card">
            <div class="card-body">
              <div class="row">
                
                <h1>Gestión - Pedidos a Proveedor</h1>
                <div>
                    <br>
                    <label>Compras pendientes</label>
                    <br>
                </div>
                <table class="table table-hove">
                    <thead>
                        <tr>
                        <th scope="col">#</th>
                        <th scope="col"><h6>No. Stock</h6></th>
                        <th scope="col"><h6>Cantidad</h6></th>
                        <th scope="col"><h6>Fecha</h6></th>
                        <th scope="col"><h6>Estado</h6></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(element, index) in pedidos" :key="index">
                            <th scope="row">{{ element.idCompra }}</th>
                            <td>{{ element.idProductoSucursal }}</td>
                            <td>{{ element.cantidad }}</td>
                            <td>{{ element.fecha }}</td>
                            <td><button type="button" class="btn btn-success m-1" @click="completarCompra(element.idCompra)">Completar</button></td>
                        </tr>
                    </tbody>
                </table>

              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</template>