<style>
@import '../../assets/css/styles.min.css';
</style>
<script>
import { loadScript, unloadScript } from "vue-plugin-load-script";

import Sidebar from '@/components/admin/Sidebar.vue';
import Navbar from '@/components/admin/Navbar.vue';
import Producto from '@/controllers/ProductoController';
import Marca from "@/controllers/MarcaController";
import TipoProducto from "@/controllers/TipoProductoController";
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
            productos: [],
            isModalNuevoVisible: false,
            isModalEditarVisible: false,
            isModalEliminarVisible: false,
            isModalMensaje: false,
            mensajeModal: '',
            id: 0,
            nombre: '',
            imagen: '',
            precio: '',
            marca: '',
            marcas: [],
            tiposP: [],
            tipoP: '',
            descripcion: ''
        }
    },
    methods: {
        modalNuevoProducto(){ //Función para abrir el modal de nuevo producto
           this.isModalNuevoVisible = true
           this.nombre = ''
           this.precio = ''
           this.imagen = ''
           this.descripcion = ''
           
        },

        modalEditarProducto(producto){ //Función para abrir el modal de editar y llenar los datos 
            this.id = producto.idProducto
            this.nombre = producto.nombre
            this.descripcion = producto.descripcion
            this.imagen = producto.ruta
            this.precio = producto.precioVenta
           
            this.isModalEditarVisible = true

        },

        modalEliminarProducto(producto){ //Modal para abrir el modal de elimiar producto
            this.nombre = producto.nombre
            this.id = producto.idProducto
            this.isModalEliminarVisible = true

         
        },

        crearProducto(){ //Función para crear un nuevo producto
          this.isModalNuevoVisible = false
          
          const producto = new Producto(this.$_SERVER_NAME)
          try{
                var datos = {
                  nombreProducto: this.nombre,
                  precioVenta: this.precio,
                  descripcion: this.descripcion,
                  imagen: this.imagen,
                  idMarca: this.marca.idMarca,
                  idTipoProducto: this.tipoP.idTipoProducto
                }
               
                var respuesta = false
                 respuesta = producto.postProducto(datos)
               
                if(respuesta){ //Producto registrado correctamente
                    this.nombre = ''
                    this.imagen=''
                    this.descripcion='',
                    this.marca = '',
                    this.tipoP = '',
                    this.precio= ''
                    this.mensajeModal = 'Producto registrado'
                    this.isModalMensaje = true
                    LogService.log(this.$_SERVER_NAME, "[POST]: Crear nuevo producto")
                }
                else {
                  this.mensajeModal = 'Error al registrar el producto'
                  this.isModalMesnaje = true
                }
               
           } catch (error){
                this.mensajeModal = 'Error al registrar el producto'
                this.isModalMensaje = true
           }

        },


        async editarProducto(){
          this.isModalEditarVisible = false
          
          const producto = new Producto(this.$_SERVER_NAME)
          try{
                var datos = {
                  nombre: this.nombre,
                  precioVenta: this.precio,
                  descripcion: this.descripcion,
                  ruta: this.imagen,
                  idMarca: this.marca.idMarca,
                  idTipoProducto: this.tipoP.idTipoProducto
                }
                console.log(datos)
                var respuesta = false
                respuesta =  producto.patchProducto(this.id,datos )
                
                
               
                if(respuesta){ //Producto editado correctamente
                    this.nombre = ''
                    this.imagen=''
                    this.descripcion='',
                    this.marca = '',
                    this.tipoP = '',
                    this.precio= ''
                    
                    this.mensajeModal = 'Producto editado'
                    this.isModalMensaje = true
                    LogService.log(this.$_SERVER_NAME, "[PATCH]: Editar producto")
  
                }
                else {
                  
                  this.mensajeModal = 'Error al editar el producto'
                  this.isModalMensaje = true
                }
               
           } catch (error){
           
                this.mensajeModal = 'Error al editar el producto'
                this.isModalMensaje = true
           }

        },

        eliminarProducto(){
          this.isModalEliminarVisible = false
          try{
            const productoController = new Producto(this.$_SERVER_NAME)
            productoController.deleteProducto(this.id)

            this.isModalMensaje= true
            this.mensajeModal= 'Producto eliminado'
            LogService.log(this.$_SERVER_NAME, "[PATCH]: Eliminación de un producto (parcialmente)")


          }
          catch(error){
            
            this.isModalMensaje= true
            this.mensajeModal= 'Error al eliminar el producto'
          }
            

            

        },

        cerrarModal(){
            this.isModalNuevoVisible = false
            this.isModalEditarVisible = false
            this.isModalEliminarVisible = false
            this.isModalMensaje = false
            const producto = new Producto(this.$_SERVER_NAME)
            producto.getProductos().then(data => { //Obtiene los productos desde el controlador
            this.productos= data
           });
           LogService.log(this.$_SERVER_NAME, "[GET]: Obtener listado de productos")

            
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

        const producto = new Producto(this.$_SERVER_NAME)
        
        producto.getProductos().then(data => { //Obtiene los productos desde el controlador
            this.productos= data
        });
        LogService.log(this.$_SERVER_NAME, "[GET]: Obtener listado de productos")

        const marca = new Marca(this.$_SERVER_NAME)
        marca.getMarcas().then(data => { 
            this.marcas= data
        });

        const tipoP = new TipoProducto(this.$_SERVER_NAME)
        tipoP.getTipoProductos().then(data => { 
            this.tiposP= data
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
              <h4 class="card-title fw-semibold mb-4">Administración de Productos</h4>
              <button type="button" class="btn btn-primary m-1" @click="modalNuevoProducto()">Nuevo Producto</button>
              
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Producto</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Acción</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(producto, index) in productos" :key="index">
                        
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
                                   {{ producto.precioVenta }} 
                                </h6>
                              </td>
                            <td>
                                <div class="d-flex justify-content-around align-items-center gap-2 my-2">
                                    <button type="button" class= "btn btn-warning  px-2" @click="modalEditarProducto(producto)">Editar</button>
                                    <button type="button" class="btn btn-danger px-2" @click="modalEliminarProducto(producto)">Eliminar</button>

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


<!-- Modal formulario para ingresar un producto-->
  <div v-if="isModalNuevoVisible" class="modal-overlay" @click="cerrarModal">
      <div class="modal-content" @click.stop>
        <br><br><br><br>
        <div class="row mb-5">
            <div class="col-md-12 text-center">
        <div class="card">

          
          
          <form @submit.prevent="crearProducto">
            <div class="card-body">
              <br>
              <h1 class="h1 mb-3 text-black">Nuevo Produto</h1>
              <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
                    <h2 class="h3 mb-3 text-black">Información del producto</h2>
                    <div class="p-3 p-lg-5 border bg-white">
                       
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_fname" class="text-black">Nombre del producto <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="c_fname" name="c_fname" v-model="nombre" required>
                            </div>
                            
                        </div>
                          <br>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_companyname" class="text-black">Precio venta <span
                                    class="text-danger">*</span> </label> 
                                <input type="text" class="form-control" id="c_companyname" name="c_companyname" v-model="precio" required>
                            </div>
                        </div>
                          <br>
                        <div class="form-group">
                            <label for="c_order_notes" class="text-black">Descripción del producto</label>
                            <textarea name="c_order_notes" id="c_order_notes" cols="30" rows="5" class="form-control" v-model="descripcion"
                                placeholder="Escribe la descripción del producto"></textarea>
                        </div>
                        

                    </div>
                </div>
                <div class="col-md-6">

                    

                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">Información adicional</h2>
                            <div class="p-3 p-lg-5 border bg-white">
                                
                              <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_fname" class="text-black">Imagen del producto <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="c_fname" name="c_fname" v-model="imagen" required placeholder="url">
                            </div>
                            <br>
                            
                        </div>
                        <br>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="precio_venta" class="text-black">Marca<span class="text-danger" >* </span></label>
                                <select class="form-control"  v-model="marca" required>
                                    <option
                                      v-for="(marcaProducto, index) in marcas"
                                      :key="index"
                                      :value="marcaProducto">
                                      {{ marcaProducto.nombre }}
                                    </option>
                                </select>
                            </div>
                        </div>
                        <br>

                        <div class="form-group">
                            <label for="descripcion_producto" class="text-black">Tipo de producto <span
                                        class="text-danger">*</span></label>
                            <select name="descripcion_producto" class="form-control" v-model="tipoP" required>
                                <option
                                  v-for="(tipoProducto, index) in tiposP"
                                  :key="index"
                                  :value="tipoProducto">
                                  {{ tipoProducto.nombre }}
                                </option>
                            </select>
                        </div>

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
                Guardar
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


    <!-- Modal formulario para editar un producto-->
  <div v-if="isModalEditarVisible" class="modal-overlay" @click="cerrarModal">
      <div class="modal-content" @click.stop>
        <br>
        <br><br><br>
        <div class="row mb-5">
            <div class="col-md-12 text-center">
        <div class="card">

          
          
          <form @submit.prevent="editarProducto">
            <div class="card-body">
              <div class="row">
                <br>
                 <h1 class="h1 mb-3 text-black">Editar Producto</h1>
                <div class="col-md-6 mb-5 mb-md-0">
                    <h2 class="h3 mb-3 text-black">Información del producto</h2>
                    <div class="p-3 p-lg-5 border bg-white">
                       
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_fname" class="text-black">Nombre del producto <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="c_fname" name="c_fname" v-model="nombre" required>
                            </div>
                            
                        </div>
                          <br>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_companyname" class="text-black">Precio venta <span
                                    class="text-danger">*</span> </label> 
                                <input type="text" class="form-control" id="c_companyname" name="c_companyname" v-model="precio" required>
                            </div>
                        </div>
                          <br>
                        <div class="form-group">
                            <label for="c_order_notes" class="text-black">Descripción del producto</label>
                            <textarea name="c_order_notes" id="c_order_notes" cols="30" rows="5" class="form-control" v-model="descripcion"
                                placeholder="Escribe la descripción del producto"></textarea>
                        </div>
                        

                    </div>
                </div>
                <div class="col-md-6">

                    

                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">Información adicional</h2>
                            <div class="p-3 p-lg-5 border bg-white">
                                
                              <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_fname" class="text-black">Imagen del producto <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="c_fname" name="c_fname" v-model="imagen" required placeholder="url">
                            </div>
                            <br>
                            
                        </div>
                        <br>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="precio_venta" class="text-black">Marca<span class="text-danger" >* </span></label>
                                <select class="form-control"  v-model="marca" required>
                                    <option
                                      v-for="(marcaProducto, index) in marcas"
                                      :key="index"
                                      :value="marcaProducto">
                                      {{ marcaProducto.nombre }}
                                    </option>
                                </select>
                            </div>
                        </div>
                        <br>

                        <div class="form-group">
                            <label for="descripcion_producto" class="text-black">Tipo de producto <span
                                        class="text-danger">*</span></label>
                            <select name="descripcion_producto" class="form-control" v-model="tipoP" required>
                                <option
                                  v-for="(tipoProducto, index) in tiposP"
                                  :key="index"
                                  :value="tipoProducto">
                                  {{ tipoProducto.nombre }}
                                </option>
                            </select>
                        </div>

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
                Guardar
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

    <!-- Modal Eliminar -->
    <div v-if="isModalEliminarVisible" class="modal-overlay" @click="cerrarModal">
    <div class="modal-content" @click.stop>
      <br><br><br><br>
      <div class="row mb-5">
        <div class="col-md-12 text-center">
          
          <div class="card">
            <br>
              <h1 class="h1 mb-3 text-black">Eliminación de Producto</h1>
            <div class="card-body">

             <br><br><br>
              <h2 class="h3 mb-3 text-black">¿Está seguro de eliminar el producto: {{ nombre }}?</h2>
              <br><br><br><br>
              
              <div class="d-flex justify-content-center">
                <button class="btn btn-light m-1" @click="cerrarModal">
                Cancelar
                </button>
                <p>&nbsp; &nbsp; </p>
                <button type="submit" class="btn btn-danger m-1" @click="eliminarProducto">
                Eliminar
              </button>
            </div>
            <br>
          
        </div>
      </div>
      </div>
    </div>
    </div>
    </div>
<!-- Final del modal mensaje -->

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