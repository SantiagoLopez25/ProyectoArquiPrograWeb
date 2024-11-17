import axios from 'axios';
class FacturaController {
    url;
    constructor(server) {
    this.url = `${server}/facturas`;
  }

  
  //Post para que se ejecute el procedimiento almacenado para realizar la transacción
  async postVenta(datosF, detalle){
    try {
        const response = await axios.post(this.url, {
          datos: datosF,
          detalleFactura: detalle
        });
       

        console.log(response.data.mensaje)
        if (response.data.status === 'success') {
          return 1;
        } else {
          return 0;
        }

      } catch (error) {
        console.error('Error:', error.response?.data?.mensaje || error.mensaje);
        return 0
      }
    
  }

}

export default FacturaController;
