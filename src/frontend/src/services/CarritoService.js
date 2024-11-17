class CarritoService {
    constructor() {
      this.productosSeleccionados = [];
      this.total;
    }
  
    agregarProducto(producto) {
      //Agrega un producto al carrito si no está aggregado
      const existe = this.productosSeleccionados.some(obj => obj.nombre === producto.nombre);

      if(!existe){
        this.productosSeleccionados.push(producto);
        this.productosSeleccionados[this.productosSeleccionados.length - 1].cantidad = 1;
        this.productosSeleccionados[this.productosSeleccionados.length - 1].total = 0.00;
        return true;
      }

      else{
        return false;
      }
      
    }
  
    obtenerProductos() {
      //Devuelve todos los productos que tiene el carrito
      return this.productosSeleccionados;
    }

    varciarCarrito(){
      //Vacia el carrito
      this.productosSeleccionados = [];
      this.total = ''
    }

    quitarProducto(indice) {
        //Quita un producto especifico del carrito
        if (indice >= 0 && indice < this.productosSeleccionados.length) {
          this.productosSeleccionados.splice(indice, 1); 
        }
      }

    guardarTotal(indice, total){
      // Guarda el total a pagar (por producto según su cantidad)
      this.productosSeleccionados[indice].total = total
    }

    cambiarCantidad(indice, cantidad){
      //Guarda la cantidad seleccionada por producto
        this.productosSeleccionados[indice].cantidad = cantidad
    }

    guardarTotalCompra(total){
      this.total = total
      
    }

    obtenerTotalCompra(){
      return this.total
    }
  }
  
  export default new CarritoService(); 