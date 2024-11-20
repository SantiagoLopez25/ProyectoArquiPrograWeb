import axios from 'axios';
import Controller from "./Controller";
import LogService from "@/services/LogService";

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
      LogService.log(this.$_SERVER_NAME, "[GET]: Obtener reporte: Top 100 productos más vendidos por sucursal");
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getTopProductosGeneral() {
    try {
      const response = await axios.get(`${this.apiBase}/top-productos/general`);
      LogService.log(this.$_SERVER_NAME, "[GET]: Obtener reporte: Top 100 productos más vendidos en general");
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
      LogService.log(this.$_SERVER_NAME, "[GET]: Obtener reporte: Productos con baja existencia por sucursal");
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
      LogService.log(this.$_SERVER_NAME, "[GET]: Obtener reporte: Grafica de productos mas vendidos por mes");
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
      LogService.log(this.$_SERVER_NAME, "[GET]: Obtener reporte: Productos más vendidos por mes y sucursal");
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
      LogService.log(this.$_SERVER_NAME, "[GET]: Obtener reporte: Productos más vendidos por mes en general");
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
      LogService.log(this.$_SERVER_NAME, "[GET]: Obtener reporte: Clientes frecuentes por sucursal");
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getClientesFrecuentesGeneral() {
    try {
      const response = await axios.get(`${this.apiBase}/clientes-frecuentes-general`);
      LogService.log(this.$_SERVER_NAME, "[GET]: Obtener reporte: Clientes frecuentes generales");
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
      LogService.log(this.$_SERVER_NAME, "[GET]: Obtener reporte: Compras por rango de fechas");
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }

  async getHistorial() {
    try {
      const response = await axios.get(`${this.apiBase}/historial`);
      LogService.log(this.$_SERVER_NAME, "[GET]: Obtener reporte: Historial de usuarios");
      return response.data;
    } catch (error) {
      this.handleError(error);
    }
  }
}

export default ReporteController;
