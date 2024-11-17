<script>
import { RouterLink } from 'vue-router'
import Footer from '@/components/Footer.vue';
import Header from '@/components/Header.vue';
import CarritoService from '@/services/CarritoService';
import UbicacionService from '@/services/UbicacionesService';
import Sucursal from '@/controllers/SucursalController';
import FacturaController from '@/controllers/FacturaController';

export default {
  page: { },
  components: {Header, Footer},
  data() {
    return {
        productos: CarritoService.obtenerProductos(),
        total: CarritoService.obtenerTotalCompra(),
        ubicaciones: [],
        posicionObtenida: false,
        lat: 0,
        lng: 0,
        isModalVisible: false,
        isModalError: false,
        isModalDatos: false,
        isFormularioClietne: false,
        nombreSucursal: 'a',
        cliente: '',
        direccion: '',
        correo: '',
        mensajeModal: ''
        
    }
  },
  methods: {
        initialize() {
            // marcar en el header la pestaña correspondiente
            this.$refs.vwHeader.selectItem('')
        },

        getUbicacion() {
           
            
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                (position) => {
                    // Obtener latitud y longitud
                    const lat = position.coords.latitude;
                    const lng = position.coords.longitude;

                    UbicacionService.setUbicacion(lat, lng)
                    this.nombreSucursal = UbicacionService.tiendaMasCercana()
                    
                    
                    
                    
                },
                (error) => {
                    //En caso de cualquier error se asigna una ubicación aleatoria
                    UbicacionService.ubicacionAleatoria()
                    this.nombreSucursal= UbicacionService.tiendaMasCercana()
                    
                }
                );

               
                  
                
                
            } 
            else {
                //alert("La geolocalización no es compatible con este navegador.");
                UbicacionService.ubicacionAleatoria()
                this.nombreSucursal= UbicacionService.tiendaMasCercana()
            }

                  
        },

        cerrarModal(){
            this.isModalVisible = false
            this.isModalError = false
            this.isModalDatos = false
           
        },

        completarCompra(){
            if (this.nombre == '' || this.direccion == '' ) {
                this.mensajeModal = 'Su nomber y su dirección son requeridos'
                this.isModalDatos = true
            }
            else if(!this.productos){
                this.mensajeModal = 'No hay productos agregados'
                this.isModalDatos = true
            }
            else{
                this.isModalVisible = true
            
            }
          
        },

        enviarCompra(){
           
           
            const venta = new FacturaController(this.$_SERVER_NAME)

           var datos = {
                montoTotal: this.total,
                idSucursal: UbicacionService.getIdSucursal(),
                nombreCliente: this.cliente,
                direccion: this.direccion,
                correo: this.correo
           }

          
           try{
                var respuesta = false
                 respuesta = venta.postVenta(datos, this.productos)
               
                if(respuesta){
                    this.$router.push('/thankyou'); //Redirigir a /thankyou
                    
                }
                else {
                    this.isModalError = true
                }

               

           } catch (error){
                //console.error('Error al realizar la transacción:', error.response?.data?.message || error.message);
                this.isModalError = true
           }
           
            
        }
  
    },
    mounted() {
        this.initialize();
        

        const sucursal = new Sucursal(this.$_SERVER_NAME)
        
        sucursal.getSucursales().then(data => { //Obtiene las ubicaciones de las sucursales desde el controlador
            this.ubicaciones= data
            UbicacionService.setUbicaciones(this.ubicaciones)
            this.getUbicacion();
        });

   
        
    }
};
</script>
<template>
    <Header ref="vwHeader"></Header>

    <!-- Start Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-5">
                    <div class="intro-excerpt">
                        <h1>Checkout</h1>
                    </div>
                </div>
                <div class="col-lg-7">

                </div>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->

    <div class="untree_co-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-12">
                    <h1 class="h1 mb-3 text-black">{{nombreSucursal}}</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
                    <h2 class="h3 mb-3 text-black">Complete su información</h2>
                    <div class="p-3 p-lg-5 border bg-white">
                       
                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_fname" class="text-black">Nombre <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="c_fname" name="c_fname" v-model="cliente" required>
                            </div>
                            
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_companyname" class="text-black">Dirección <span
                                    class="text-danger">*</span> </label> 
                                <input type="text" class="form-control" id="c_companyname" name="c_companyname" v-model="direccion" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="c_address" class="text-black">Correo electrónico </label>
                                <input type="text" class="form-control" id="c_address" name="c_address" v-model="correo" >
                            </div>
                        </div>
                        

                    </div>
                </div>
                <div class="col-md-6">

                    

                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">Detalles de la orden</h2>
                            <div class="p-3 p-lg-5 border bg-white">
                                <table class="table site-block-order-table mb-5">
                                    <thead>
                                        <th>Producto</th>
                                        <th>Total</th>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(producto, index) in productos" :key="index">
                                            <td>{{producto.nombre}} <strong class="mx-2">x</strong> {{ producto.cantidad }}</td>
                                            <td>Q.{{ producto.total }}</td>
                                        </tr>
                                       
                                        
                                        <tr>
                                            <td class="text-black font-weight-bold"><strong>Total de la compra</strong></td>
                                            <td class="text-black font-weight-bold"><strong>Q.{{ total }} </strong></td>
                                        </tr>
                                    </tbody>
                                </table>

                               
                                <div class="form-group">
                                    <button class="btn btn-black btn-lg py-3 btn-block" @click="completarCompra()"
                                    to="/thankyou">Finalizar Orden</button>
                                    
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- </form> -->
        </div>
    </div>


    <!-- Modal -->
<div v-if="isModalVisible" class="modal-overlay" @click="cerrarModal">
      <div class="modal-content" @click.stop>
        <div class="row mb-5">
          <div class="col-md-12 text-center">
            <h2 class="h3 mb-3 text-black">¿Estás seguro de realizar la compra?</h2>
            <label for="c_code" class="text-black mb-3">
              
            </label>
            <div class="d-flex justify-content-center">
                <button class="btn btn-black btn-sm" @click="cerrarModal">
                Cancelar
                </button>
                <p>&nbsp; &nbsp; </p>
                <button class="btn btn-black btn-sm" @click="enviarCompra()"
                  > Completar compra
                </button>
               
              
            </div>
          </div>
        </div>
      </div>
    </div>



     <!-- Modal -->
<div v-if="isModalError" class="modal-overlay" @click="cerrarModal">
      <div class="modal-content" @click.stop>
        <div class="row mb-5">
          <div class="col-md-12 text-center">
            <h2 class="h3 mb-3 text-black">Ocurrio un error inesperado</h2>
            <label for="c_code" class="text-black mb-3">
              
            </label>
            <div class="d-flex justify-content-center">
                <button class="btn btn-black btn-sm" @click="cerrarModal">
                Aceptar
                </button>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div v-if="isModalDatos" class="modal-overlay" @click="cerrarModal">
      <div class="modal-content" @click.stop>
        <div class="row mb-5">
          <div class="col-md-12 text-center">
            <h2 class="h3 mb-3 text-black">{{ mensajeModal }}</h2>
            <br>
            <label for="c_code" class="text-black mb-3">
              
            </label>
            <div class="d-flex justify-content-center">
                <button class="btn btn-black btn-sm" @click="cerrarModal">
                Aceptar
                </button>
            </div>
          </div>
        </div>
      </div>
    </div>


     




    <Footer></Footer>
</template>