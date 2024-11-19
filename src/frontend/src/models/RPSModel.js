class RPSModel {

    idProductoSucursal = 0;
    cantidad = 0;
    idProducto = 0;
    idSucursal = 0;

    constructor() { }

    setCantidad(cantidad) {
        this.cantidad = cantidad;
    }

    setIdProductoSucursal(idProductoSucursal) {
        this.idProductoSucursal = idProductoSucursal;
    }

    setIdProducto(idProducto) {
        this.idProducto = idProducto;
    }

    setIdSucursal(idSucursal) {
        this.idSucursal = idSucursal;
    }

    getIdSucursal() {
        return this.idSucursal;
    }

    getIdProducto() {
        return this.idProducto;
    }

    getCantidad() {
        return this.cantidad;
    }

    getIdProductoSucursal() {
        return this.idProductoSucursal;
    }
}

export default RPSModel;