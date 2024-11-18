<style>
@import '../../assets/css/styles.min.css';
</style>
<script>
import { loadScript, unloadScript } from "vue-plugin-load-script";

import Sesion from "@/services/Sesion";

import Sidebar from '@/components/admin/Sidebar.vue';
import Navbar from '@/components/admin/Navbar.vue';
import RPSController from "@/controllers/RPSController";
import Sucursal from "@/controllers/SucursalController";
import ComprasController from "@/controllers/ComprasController";

export default {
    page: {},
    components: { Sidebar, Navbar },
    data() {
        return {
            datos: [],
            productos: [],
            idProductoSucursal: -1,
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
      cambiarProducto(id) {
        var rps = new RPSController(this.$_SERVER_NAME);
        rps.setControllerListener(dt => {
          this.productos = dt;
        });
        rps.listar(id);
        
      },
      seleccionarProducto(id) {
        this.idProductoSucursal = id;
      },
      guardarCompra() {
        const pack = {
          idProductoSucursal: this.idProductoSucursal,
          cantidad: parseInt(this.html('cantidadProducto').value),
          fecha: this.html('fechaCompraSRP').value,
          estado: this.html('esadoCompraSucursal').checked
        };

        var c = new ComprasController(this.$_SERVER_NAME);
        c.guardar(pack);
        this.resetUI();

        alert('Compra Exitosa...');
      },
      html(myId) {
        return document.getElementById(myId)
      },
      resetUI() {
        this.html('cantidadProducto').value = "0";
        this.html('esadoCompraSucursal').checked = true;
      }
    },
    beforeMount() {
      if (! Sesion.check()) {
        this.$router.push('/admin/signin');
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

        var sucursales = new Sucursal(this.$_SERVER_NAME);
        sucursales.setControllerListener(data => {
          console.log(data)
          this.datos = data;
        });
        sucursales.listarSucursal();
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
                <form @submit.prevent="prevent">
                    <fieldset>
                      <legend><h1>Gestión - Compras</h1></legend>
                      <div class="mb-3">
                        <label for="cantidadProducto" class="form-label">Cantidad Comprada:</label>
                        <input type="number" id="cantidadProducto" class="form-control" placeholder="Ingrese cantidad (entero)">
                      </div>
                      <div class="mb-3">
                        <label for="fechaCompraSRP" class="form-label">Fecha Ingreso:</label>
                        <input type="date" id="fechaCompraSRP" class="form-control" placeholder="2020/12/12">
                      </div>
                      <div class="mb-3">
                        <label for="disabledSelect" class="form-label">Compra - Sucursal</label>
                        <select id="disabledSelect" class="form-select">
                          <option v-for="(element, index) in datos" :key="index" :value="element.idSucursal" @click="cambiarProducto(element.idSucursal)">
                            {{ element.nombre }}
                          </option>
                        </select>
                      </div>

                      <div class="mb-3">
                        <label for="disabledSelect" class="form-label">Producto - Sucursal</label>
                        <select id="disabledSelect" class="form-select">
                          <option v-for="(element, index) in productos" :key="index" @click="seleccionarProducto(element.idProductoSucursal)">
                            {{ element.nombre}}
                          </option>
                        </select>
                      </div>
                      <div class="mb-3">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="esadoCompraSucursal" checked>
                          <label class="form-check-label" for="esadoCompraSucursal">
                            Estado de la compra
                          </label>
                        </div>
                      </div>
                      <button type="submit" class="btn btn-primary" @click="guardarCompra()">Guardar transacción</button>
                    </fieldset>
                  </form>



              </div>
            </div>
          </div>
        </div>
      </div>



    </div>
  </div>
</template>