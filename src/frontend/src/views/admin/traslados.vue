<style>
@import '../../assets/css/styles.min.css';
</style>
<script>
import { loadScript, unloadScript } from "vue-plugin-load-script";

import Sidebar from '@/components/admin/Sidebar.vue';
import Navbar from '@/components/admin/Navbar.vue';

import Sucursal from "@/controllers/SucursalController";
import Inventario from "@/controllers/InventarioController";
import LogService from "@/services/LogService";

export default {
    page: {},
    components: { Sidebar, Navbar },
    data() {
        return {
            scripts: [
                '/libs/jquery/dist/jquery.min.js',
                '/libs/bootstrap/dist/js/bootstrap.bundle.min.js',
                '/js/sidebarmenu.js',
                '/js/app.min.js',
                '/libs/simplebar/dist/simplebar.js',

                /* solar icons */
                'https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js'
            ],
            
           
            isModalMensaje: false,
            mensajeModal: '',
            nombre: '',
            precio: '',
            marca: '',
            sucursales: [],
            sucursal: '',
            isModalTrasladar: false,
            inventario: [],
            cantidad: 0,
            cantidadTraslado: 0,
            sucursalesTraslado: [],
            sucursalTraslado: '',
            idProducto: 0
            
        }
    },
    methods: {

        modalTrasladar(producto){
          
          this.idProducto = producto.idProducto
          this.isModalTrasladar=true
          this.nombre = producto.nombre
          this.cantidad = producto.cantidad
          this.marca = producto.nombre_marca
          
        },

        listarInventario(){
         
          this.inventario=[]
          const id = this.sucursal.idSucursal


          const inventario = new Inventario(this.$_SERVER_NAME)
          inventario.getInventario(id).then(data => { //Obtiene el inventario desde el controlador
          this.inventario= data
          const id = this.sucursal.idSucursal
          
          this.sucursalesTraslado = this.sucursales.filter((_, index) => index !== id-1);
          this.sucursalTraslado = this.sucursalesTraslado[0]
        });
        },
       

        trasladarProducto(){ //Función para trasladar un producto
         
          this.isModalTrasladar = false
        
          
          const traslado = new Inventario(this.$_SERVER_NAME)
          try{
                var datos = {
                  idSucursalDonante: this.sucursal.idSucursal,
                  idSucursalBeneficiada: this.sucursalTraslado.idSucursal,
                  idProducto: this.idProducto,
                  cantidad: this.cantidadTraslado
                }
               console.log('hola')
                console.log(datos)
                 var respuesta = false
                 respuesta = traslado.putTraslado(datos)
               
                if(respuesta){ //Producto trasladado correctamente
                  
                    this.mensajeModal = 'Producto trasladado'
                    this.isModalMensaje = true
                }
                else {
                  this.mensajeModal = 'Error al trasladar el producto'
                  this.isModalMesnaje = true
                }
               
           } catch (error){
                this.mensajeModal = 'Error al trasladar el producto'
                this.isModalMensaje = true
           }

        },



        cerrarModal(){
          this.isModalMensaje = false
          this.isModalTrasladar = false
          this.listarInventario()

            
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


        const sucursal = new Sucursal(this.$_SERVER_NAME)
        sucursal.getSucursales().then(data => { 
            this.sucursales= data
            this.sucursal = this.sucursales[0]
            this.listarInventario()
        });

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
              <h4 class="card-title fw-semibold mb-4">Administración de Inventario y Traslados</h4>
              
             
              <div class="form-group row">
                            <div class="col-md-12">
                                <label for="precio_venta" class="text-black">Sucursal</label>
                                <select class="form-control"  v-model="sucursal" required @change="listarInventario()" placeholder="Seleccione una sucursal">
                                    <option
                                      v-for="(sucursalLista, index) in sucursales"
                                      :key="index"
                                      :value="sucursalLista">
                                      {{ sucursalLista.nombre }}
                                    </option>
                                </select>
                            </div>
                        </div>
              
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Producto</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Acción</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(producto, index) in inventario" :key="index">
                        
                            <td>{{producto.idProducto}}</td>
                            <td> <div class="d-flex align-items-center product">
                              <img :src="producto.ruta" class="img-fluid flex-shrink-0 rounded"
                                width="60" height="60" />
                              <div class="ms-3 product-title">
                                <h6 class="fs-3 mb-0 text-truncate-2">
                                   {{ producto.nombre }} 
                                </h6>
                              </div>
                            </div></td>
                            <td> 
                                <h6 class="fs-3 mb-0 text-truncate-2">
                                   {{ producto.nombre_marca }} 
                                </h6>
                              </td>
                            <td>  
                                <h6 class="fs-3 mb-0 text-truncate-2">
                                   {{ producto.cantidad }} 
                                </h6>
                              </td>
                            <td>
                                <div class="d-flex justify-content-around align-items-center gap-2 my-2">
                                    <button type="button" class= "btn btn-warning  px-2" @click="modalTrasladar(producto)">Trasladar</button>
                                    

                                </div>
                            </td>
                            
                        </tr>
                       
                    </tbody>
                </table>

                


            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


<!-- Modal formulario para trasladar un producto-->
  <div v-if="isModalTrasladar" class="modal-overlay" @click="cerrarModal">
      <div class="modal-content" @click.stop>
        <br><br><br><br>
        <div class="row mb-5">
            <div class="col-md-12 text-center">
        <div class="card">

          
          
          <form @submit.prevent="trasladarProducto">
            <div class="card-body">
              <br>
              <h1 class="h1 mb-3 text-black">Trasladar Produto</h1>
              <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
                    <h2 class="h3 mb-3 text-black">Información del producto</h2>
                    <div class="p-3 p-lg-5 border bg-white">
                       
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_fname" class="text-black">Nombre del producto </label>
                                <input type="text" class="form-control" id="c_fname" name="c_fname" v-model="nombre" readonly>
                            </div>
                            
                        </div>
                          <br>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_companyname" class="text-black">Marca  </label> 
                                <input type="text" class="form-control" id="c_companyname" name="c_companyname" v-model="marca" readonly>
                            </div>
                        </div>
                          <br>
                          <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_companyname" class="text-black">Stock  </label> 
                                <input type="text" class="form-control" id="c_companyname" name="c_companyname" v-model="cantidad"  readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">

                    

                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">Datos del traslado </h2>
                            <div class="p-3 p-lg-5 border bg-white">
                                
                              <div class="form-group row">
                            <div class="col-md-12">
                                  <label for="c_fname" class="text-black">Cantidad <span
                                        class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="c_fname" name="c_fname" v-model="cantidadTraslado" required @change="limiteTraslado()" :max="cantidad" :min="0">
                            </div>
                            <br>
                            
                        </div>
                        <br>
                        <div class="form-group row">
                            <div class="col-md-12">
                              <label for="precio_venta" class="text-black">Sucursal</label>
                                <select class="form-control"  v-model="sucursalTraslado" required  placeholder="Seleccione una sucursal">
                                    <option
                                      v-for="(sucursalLista, index) in sucursalesTraslado"
                                      :key="index"
                                      :value="sucursalLista">
                                      {{ sucursalLista.nombre }}
                                    </option>
                                </select>
                            </div>
                        </div>
                        <br>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            </div>

            <div class="d-flex justify-content-center">
                <button class="btn btn-light m-1" @click="cerrarModal">
                Cancelar
                </button>
                <p>&nbsp; &nbsp; </p>
                <button type="submit" class="btn btn-success m-1">
                Trasladar
              </button>
            </div>
            <br>
            


          </form>
                </div>

            </div>
        </div>



      </div>
    </div>

    <!--Final del modal-->


   

    

    <!-- Modal mensaje -->
    <div v-if="isModalMensaje" class="modal-overlay" @click="cerrarModal">
    <div class="modal-content" @click.stop>
      <br><br>
      <div class="row mb-5">
        <div class="col-md-12 text-center">
          
          <div class="card">
            
            <div class="card-body">

             <br><br><br>
              <h2 class="h3 mb-3 text-black">{{ mensajeModal }}</h2>
              <br><br><br><br>
              
              <div class="d-flex justify-content-center">
                <button class="btn btn-primary" @click="cerrarModal">
                  Aceptar
                </button>
              </div>
            </div>
          
        </div>
      </div>
      </div>
    </div>
    </div>
<!-- Final del modal mensaje -->


</template>