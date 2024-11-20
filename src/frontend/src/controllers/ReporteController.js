import axios from 'axios';

class ReporteController {
  constructor(server) {
    this.apiBase = `${server}/reportes`;
  }

  //manejar errores
  handleError(error) {
    console.error("Error en la solicitud:", error);
    throw error.response ? error.response.data : { message: "Error desconocido" };
  }

  //metodos para cada reporte
  async getTopProductosPorSucursal(idSucursal) {
    try {
      const response = await axios.get(`${this.apiBase}/top-productos/sucursal`, {
        params: { idSucursal },
      });
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getTopProductosGeneral() {
    try {
      const response = await axios.get(`${this.apiBase}/top-productos/general`);
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getProductosConBajaExistencia(idSucursal) {
    try {
      const response = await axios.get(`${this.apiBase}/productos-baja-existencia`, {
        params: { idSucursal },
      });
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getProductosMasVendidosPorMesG(mes) {
    try {
      const response = await axios.get(`${this.apiBase}/productos-mas-vendidos-mes`, {
        params: { mes },
      });
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }  

  async getProductosMasVendidosPorMesYSucursal(idSucursal,mes) {
    try {
      const response = await axios.get(`${this.apiBase}/productos-mas-vendidos-sucursal`, {
        params: { idSucursal, mes },
      });
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getProductosMasVendidosPorMesGeneral(mes) {
    try {
      const response = await axios.get(`${this.apiBase}/productos-mas-vendidos-general`, {
        params: { mes },
      });
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getClientesFrecuentesPorSucursal(idSucursal) {
    try {
      const response = await axios.get(`${this.apiBase}/clientes-frecuentes-sucursal`, {
        params: { idSucursal },
      });
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getClientesFrecuentesGeneral() {
    try {
      const response = await axios.get(`${this.apiBase}/clientes-frecuentes-general`);
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getReporteComprasPorRango(fechaInicio, fechaFin) {
    try {
      const response = await axios.get(`${this.apiBase}/comprasR`, {
        params: { fecha_inicio: fechaInicio, fecha_fin: fechaFin },
      });
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getHistorial() {
    try {
      const response = await axios.get(`${this.apiBase}/historial`);
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }
}

export default ReporteController;
