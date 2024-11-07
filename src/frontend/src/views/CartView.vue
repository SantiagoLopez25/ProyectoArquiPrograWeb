<script>
import { RouterLink } from 'vue-router'
import Footer from '@/components/Footer.vue';
import Header from '@/components/Header.vue';
import CarritoService from '@/services/CarritoService';

export default {
    page: {},
    components: { Header, Footer },
    data() {
        return {
            productos: CarritoService.obtenerProductos(), //Llena productos con la lista del carrito guardada en CarritoService
            isModalVisible: false
        }
    },
    methods: {
        initialize() {
            // marcar en el header la pestaña correspondiente
            this.$refs.vwHeader.selectItem('')
        },

        quitarProduto(index){
            //Quita un producto del carrito de compras
            CarritoService.quitarProducto(index)
            this.productos =  CarritoService.obtenerProductos()
            this.productos = [...this.productos]; //Forzando para que vue detecte el cambio y actualice automáticamente la tabla
        },

        limpiarCarrito(){
            CarritoService.varciarCarrito()
            this.productos = [] //Limpiar la lista del carrito
            this.productos = [...this.productos]
            this.isModalVisible = false;
        },

        calcularTotal(index, cantidad, precio){
            //Calcula el total a pagar por producto individual dependiendo de la cantidad seleccionada
            if(cantidad == null || cantidad == ''){
                cantidad = 1
            }
            var total = parseFloat(parseFloat(cantidad)*parseFloat(precio)).toFixed(2)
            CarritoService.guardarTotal(index, total)
            return total
        },

        agregarCantidad(index, producto){
            //Aumenta la cantidad de un producto
            // Se guarda en el arreglo local y en el global
            var cantidad = parseInt( parseInt(producto.cantidad) + parseInt(1))
            CarritoService.cambiarCantidad(index, cantidad)
            this.productos[index].cantidad= cantidad
        },

        quitarCantidad(index, producto){ 
            //Disminuye la cantidad de un producto
            // Se guarda en el arreglo local y en el global
            if(producto.cantidad > 1 ){
                var cantidad = parseInt( parseInt(producto.cantidad) - parseInt(1))
                CarritoService.cambiarCantidad(index, cantidad)
                this.productos[index].cantidad= cantidad
            } 
        },

        calcularTotalCompra(){
            //Calcula el total de toda la compra, el cual se muestra en pantalla y se guarda en CarritoService
            var total = 0
            this.productos.forEach(producto => {
                total= parseFloat( parseFloat(total) + parseFloat(producto.total))
            });

           total = total.toFixed(2)
            
            CarritoService.guardarTotalCompra(total)
            return total
        
        },

        cerrarModal(){
            this.isModalVisible = false
            
        },

        abrirModal(){
            this.isModalVisible = true
        }

    },
    mounted() {
        this.initialize();
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
                        <h1>Carrito de Compras</h1>
                    </div>
                </div>
                <div class="col-lg-7">

                </div>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->



    <div class="untree_co-section before-footer-section">
        <div class="container">
            <div class="row mb-5">
                <form class="col-md-12" method="post">
                    <div class="site-blocks-table">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">Imagen</th>
                                    <th class="product-name">Producto</th>
                                    <th class="product-price">Precio</th>
                                    <th class="product-quantity">Cantidad</th>
                                    <th class="product-total">Total</th>
                                    <th class="product-remove">Quitar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(producto, index) in productos" :key="index">
                                    <td class="product-thumbnail">
                                        <img :src="producto.ruta" alt="Image" class="img-fluid">
                                    </td>
                                    <td class="product-name">
                                        <h2 class="h5 text-black">{{ producto.nombre }}</h2>
                                    </td>
                                    <td>Q.{{ producto.precioVenta }}</td>
                                    <td>
                                        <div class="input-group mb-3 d-flex align-items-center quantity-container"
                                            style="max-width: 120px;">
                                            <div >
                                                <a class="btn btn-black btn-sm"
                                                    @click="quitarCantidad(index, producto)"   >-</a>
                                            </div>
                                                <h2 class="h5 text-black">&nbsp; &nbsp; {{ producto.cantidad }} &nbsp;&nbsp; </h2>
                                            <div >
                                                <a class="btn btn-black btn-sm"
                                                    @click="agregarCantidad(index, producto)">+</a>
                                            </div>
                                        </div>

                                    </td>
                                    <td>Q.{{ calcularTotal(index,producto.cantidad, producto.precioVenta) }}</td>
                                    <td><a @click="quitarProduto(index)" class="btn btn-black btn-sm">X</a></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </form>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="row mb-5">
                        <div class="col-md-6 mb-3 mb-md-0">
                            <button class="btn btn-black btn-sm btn-block" @click="abrirModal">Limpiar Carrito</button>
                        </div>
                        <div class="col-md-6">
                           <RouterLink class="btn btn-black btn-sm btn-block" to="/shop">
                                Seguir comprando
                           </RouterLink>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="text-black h4" for="coupon">Coupon</label>
                            <p>Enter your coupon code if you have one.</p>
                        </div>
                        <div class="col-md-8 mb-3 mb-md-0">
                            <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-black">Apply Coupon</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 pl-5">
                    <div class="row justify-content-end">
                        <div class="col-md-7">
                            <div class="row">
                                <div class="col-md-12 text-right border-bottom mb-5">
                                    <h3 class="text-black h4 text-uppercase">Total De La Compra</h3>
                                </div>
                            </div>
                            
                            <div class="row mb-5">
                                <div class="col-md-6">
                                    <span class="text-black">Total</span>
                                </div>
                                <div class="col-md-6 text-right">
                                    <strong class="text-black">Q.{{ calcularTotalCompra() }}</strong>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <RouterLink class="btn btn-black btn-lg py-3 btn-block" to="/checkout">Ir al Checkout</RouterLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- Modal -->
<div v-if="isModalVisible" class="modal-overlay" @click="cerrarModal">
      <div class="modal-content" @click.stop>
        <div class="row mb-5">
          <div class="col-md-12 text-center">
            <h2 class="h3 mb-3 text-black">¿Estas seguro de vaciar el carrito?</h2>
            <label for="c_code" class="text-black mb-3">
              ¡Si vacias el carrtio no podras recuperarlo!
            </label>
            <div class="d-flex justify-content-center">
                <button class="btn btn-black btn-sm" @click="cerrarModal">
                Cancelar
                </button>
                <p>&nbsp; &nbsp; </p>
                <button class="btn btn-black btn-sm" @click="limpiarCarrito()">
                Vaciar
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    

    <Footer></Footer>
</template>

<style>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}

.modal-content {
  background: white;
  padding: 20px;
  border-radius: 8px;
  width: 400px;
  max-width: 90%;
  text-align: center;
  z-index: 10000;
}
</style>