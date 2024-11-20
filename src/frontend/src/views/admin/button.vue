<style>
@import '../../assets/css/styles.min.css';
</style>
<script>
import { loadScript, unloadScript } from "vue-plugin-load-script";

import {
  Chart,
  BarController,
  BarElement,
  CategoryScale,
  LinearScale,
  Tooltip,
  Legend,
} from "chart.js"; //importar componentes específicos de Chart.js
import Sesion from "@/services/Sesion";

//registrar componentes de Chart.js
Chart.register(BarController, BarElement, CategoryScale, LinearScale, Tooltip, Legend);

import Sidebar from '@/components/admin/Sidebar.vue';
import Navbar from '@/components/admin/Navbar.vue';
import Sucursal from "@/controllers/SucursalController";
import ReporteController from '@/controllers/ReporteController'

export default {
    page: {},
    components: { Sidebar, Navbar },
    data() {
        return {
          datos: [],
          reportesv: false,
          tabla: false,
          reporteController: new ReporteController(this.$_SERVER_NAME), // Instancia del controlador
          reporteSeleccionado: "",
          parametros: {
            idSucursal: "",
            mes: "",
            fechaInicio: "",
            fechaFin: "",
        },
        reporteData: [],
        headers: [],
        meses: [
          "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
          "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
        ],
            scripts: [
                '/libs/jquery/dist/jquery.min.js',
                '/libs/bootstrap/dist/js/bootstrap.bundle.min.js',
                '/js/sidebarmenu.js',
                '/js/app.min.js',
                '/libs/simplebar/dist/simplebar.js',

                /* solar icons */
                'https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js',
            ],   
        }
    },
    methods: {
      async generarReporte() {
        this.tabla = true;
      try {
        let data = [];
        switch (this.reporteSeleccionado) {
          case "topProductosPorSucursal":
            data = await this.reporteController.getTopProductosPorSucursal(this.parametros.idSucursal);
            break;
          case "topProductosGeneral":
            data = await this.reporteController.getTopProductosGeneral();
            break;
          case "productosConBajaExistencia":
            data = await this.reporteController.getProductosConBajaExistencia(this.parametros.idSucursal);
            break;
          case "productosMasVendidosPorMesG":
            //obtener los datos de la gráfica
            data = await this.reporteController.getProductosMasVendidosPorMesG(this.parametros.mes); this.tabla=false;
            this.renderizarGrafica(data);
            break;
          case "getProductosMasVendidosPorMesG":
            data = await this.reporteController.getProductosMasVendidosPorMesG(this.parametros.mes);
            break;
          case "productosMasVendidosPorMesYSucursal":
            data = await this.reporteController.getProductosMasVendidosPorMesYSucursal(
              this.parametros.idSucursal,
              this.parametros.mes
            );
            break;
          case "productosMasVendidosPorMesGeneral":
            data = await this.reporteController.getProductosMasVendidosPorMesGeneral(this.parametros.mes);
            break;
          case "clientesFrecuentesPorSucursal":
            data = await this.reporteController.getClientesFrecuentesPorSucursal(this.parametros.idSucursal);
            break;
          case "clientesFrecuentesGeneral":
            data = await this.reporteController.getClientesFrecuentesGeneral();
            break;
          case "reporteComprasPorRango":
            data = await this.reporteController.getReporteComprasPorRango(
              this.parametros.fechaInicio,
              this.parametros.fechaFin
            );
            break;
          case "mostrarHistorial":
            data = await this.reporteController.getHistorial();
            break;
          default:
            console.error("Reporte no válido.");
        }

        this.reporteData = data;
        this.headers = this.reporteData.length > 0 ? Object.keys(this.reporteData[0]) : [];
      } catch (error) {
        console.error("Error al obtener el reporte:", error);
        alert("Error al obtener el reporte.");
      }
    },
    activarValor() {
      switch (this.reporteSeleccionado) {
          case "topProductosPorSucursal":
            this.reportesv = true;
            break;
          case "productosConBajaExistencia":
            this.reportesv = true;
            break;
          case "productosMasVendidosPorMesYSucursal":
            this.reportesv = true;
            break;
          case "clientesFrecuentesPorSucursal":
            this.reportesv = true;
            break;
          default:
            this.reportesv = false;
        }
    },
    renderizarGrafica(datos) {
      const labels = datos.map((producto) => producto.Producto); //nombres de los productos
      const valores = datos.map((producto) => producto.Cantidad_Total); //cantidades totales vendidas

      //generar colores aleatorios para cada barra
      const colores = valores.map(() => `rgba(${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, ${Math.floor(Math.random() * 255)}, 0.6)`);

      //destruir gráfica existente antes de crear una nueva
      if (this.grafica) {
        this.grafica.destroy(); //destruye la instancia previa del gráfico
        this.grafica = null; //limpia la referencia para evitar conflictos
      }

      const ctx = document.getElementById("grafica").getContext("2d");

      //crea la nueva instancia del gráfico
      this.grafica = new Chart(ctx, {
        type: "bar", //tipo de gráfica (barras)
        data: {
          labels: labels,
          datasets: [
            {
              label: "Cantidad Vendida",
              data: valores,
              backgroundColor: colores, //Se usan los colores generados
              borderColor: colores.map((color) => color.replace('0.6', '1')), //hacer los bordes más sólidos
              borderWidth: 1,
            },
          ],
        },
        options: {
          responsive: true,
          plugins: {
            legend: {
              display: true,
              position: "top",
            },
            tooltip: {
              enabled: true,
            },
          },
          scales: {
            x: {
              type: "category",
              title: {
                display: true,
                text: "Productos",
              },
            },
            y: {
              type: "linear",
              beginAtZero: true,
              title: {
                display: true,
                text: "Cantidad Vendida",
              },
            },
          },
        },
      });
    }
  },
    beforeMount() {
      if (! Sesion.check()) {
        this.$router.push('/admin/signin');
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

        var sucursales = new Sucursal(this.$_SERVER_NAME);
        sucursales.setControllerListener(data => {
          console.log(data)
          this.datos = data;
        });
        sucursales.listarSucursal();
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
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <aside class="left-sidebar">
      <Sidebar></Sidebar>
    </aside>

    <div class="body-wrapper">
      <Navbar></Navbar>
      <div class="body-wrapper-inner">
        <div class="container-fluid">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title fw-semibold mb-4">Reportes</h5>

              <!-- formulario para seleccionar reporte -->
              <div class="mb-3">
                <label for="reporteSeleccionado" class="form-label">Selecciona un reporte</label>
                <select v-model="reporteSeleccionado" id="reporteSeleccionado" class="form-select" @change="activarValor">
                  <option value="topProductosPorSucursal">Top 100 productos más vendidos por sucursal</option>
                  <option value="topProductosGeneral">Top 100 productos más vendidos en general</option>
                  <option value="productosConBajaExistencia">Productos con baja existencia por sucursal</option>
                  <option value="productosMasVendidosPorMesG">Grafica de productos mas vendidos por mes</option>
                  <option value="productosMasVendidosPorMesYSucursal">Productos más vendidos por mes y sucursal</option>
                  <option value="productosMasVendidosPorMesGeneral">Productos más vendidos por mes en general</option>
                  <option value="clientesFrecuentesPorSucursal">Clientes frecuentes por sucursal</option>
                  <option value="clientesFrecuentesGeneral">Clientes frecuentes generales</option>
                  <option value="reporteComprasPorRango">Compras por rango de fechas</option>
                  <option value="mostrarHistorial">Historial de usuarios</option>
                </select>
              </div>

              <!-- parámetros dinámicos -->
              <div class="mb-3" v-if="reportesv">
                    <label for="opcionSucursalesProducto" class="form-label">Sucursal</label>
                    <select id="opcionSucursalesProducto" class="form-select" v-model="parametros.idSucursal">
                    <option v-for="(element, index) in datos" :key="index" :value="element.idSucursal">
                      {{ element.nombre }}
                    </option>
                </select>
              </div>

              <div v-if="reporteSeleccionado.includes('PorMes')">
                <label for="mes" class="form-label">Mes</label>
                <select v-model="parametros.mes" id="mes" class="form-select">
                  <option v-for="(mes, index) in meses" :key="index" :value="index + 1">{{ mes }}</option>
                </select>
              </div>

              <div v-if="reporteSeleccionado === 'reporteComprasPorRango'">
                <label for="fechaInicio" class="form-label">Fecha inicio</label>
                <input v-model="parametros.fechaInicio" type="date" id="fechaInicio" class="form-control">
                <label for="fechaFin" class="form-label mt-2">Fecha fin</label>
                <input v-model="parametros.fechaFin" type="date" id="fechaFin" class="form-control">
              </div>

              <!-- generar reporte -->
              <button @click="generarReporte" class="btn btn-primary mt-3">Generar Reporte</button>

              <!-- tabla de resultados -->
              <div v-if="reporteData.length > 0 && tabla" class="mt-4">
                <h5 class="card-title fw-semibold mb-3">Resultados</h5>
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th v-for="(header, index) in headers" :key="index">{{ header }}</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="(fila, index) in reporteData" :key="index">
                      <td v-for="(valor, key) in fila" :key="key">{{ valor }}</td>
                    </tr>
                  </tbody>
                </table>
              </div>

                <!-- Gráfica -->
              <div v-if="reporteSeleccionado === 'productosMasVendidosPorMesG'" class="mt-4">
                <canvas id="grafica"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>