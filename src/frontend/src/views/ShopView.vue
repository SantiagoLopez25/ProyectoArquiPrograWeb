<script>
import { RouterLink } from 'vue-router'
import Footer from '@/components/Footer.vue';
import Header from '@/components/Header.vue';
import Producto from '@/controllers/ProductoController';
import CarritoService from '@/services/CarritoService';

export default {
    page: {},
    components: { Header, Footer },
    data() {
        return {
            productos: [],
            isModalNuevoVisible: false,
            isModalExistenteVisible: false
        }
    },
    methods: {
        initialize() {
            // marcar en el header la pestaña correspondiente
            this.$refs.vwHeader.selectItem('shop')
        },
        agregarCarrito(producto) {
            //console.log(producto)
            var resultado = CarritoService.agregarProducto(producto);
            if(resultado){
                this.isModalNuevoVisible = true;
            }
            else{
                this.isModalExistenteVisible = true
            }

        },
        cerrarModal(){
            this.isModalNuevoVisible = false
            this.isModalExistenteVisible = false
        }
        
    },

   

    mounted() {
        this.initialize();
        const producto = new Producto(this.$_SERVER_NAME)
        
        producto.getProductos().then(data => { //Obtiene los productos desde el controlador
            this.productos= data
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
                        <h1>Compras</h1>
                    </div>
                </div>
                <div class="col-lg-7">

                </div>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->



    <div class="untree_co-section product-section before-footer-section">
        <div class="container">
            <div class="row">

                <div v-for="(producto, index) in productos" :key="index" class="col-12 col-md-4 col-lg-3 mb-5">
                    <a class="product-item" @click="agregarCarrito(producto)" >
                        <img :src="producto.ruta" class="img-fluid product-thumbnail">
                        <h3 class="product-title">{{ producto.nombre }}</h3>
                        <strong class="product-price">Q.{{ producto.precioVenta }}</strong>

                        <span class="icon-cross">
                            <img src="@/assets/images/cross.svg" class="img-fluid">
                        </span>
                    </a>
                </div>

            </div>
        </div>
    </div>

    
    <!-- Modal -->
    <div v-if="isModalNuevoVisible" class="modal-overlay" @click="cerrarModal">
      <div class="modal-content" @click.stop>
        <div class="row mb-5">
          <div class="col-md-12 text-center">
            <h2 class="h3 mb-3 text-black">Agregado al carrito</h2>
            <label for="c_code" class="text-black mb-3">
              El producto que seleccionaste fue ingresado al carrito
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

    <div v-if="isModalExistenteVisible" class="modal-overlay" @click="cerrarModal">
      <div class="modal-content" @click.stop>
        <div class="row mb-5">
          <div class="col-md-12 text-center">
            <h2 class="h3 mb-3 text-black">Ya en el carrito</h2>
            <label for="c_code" class="text-black mb-3">
              El producto que seleccionaste ya está ingresado en el carrito
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

