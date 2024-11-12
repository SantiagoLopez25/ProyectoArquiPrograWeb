<script>
import { RouterLink } from "vue-router";
import Footer from "@/components/Footer.vue";
import Header from "@/components/Header.vue";
import axios from "axios";

export default {
  components: { Header, Footer },
  data() {
    return {
      form: {
        nombre: '',
        telefono: '',
        direccion: '',
        email: '',
        estado: true
      }
    };
  },
  methods: {
    initialize() {
      //Marcar en el header la pestaña correspondiente
      this.$refs.vwHeader.selectItem("contact");
    },
    async registrarCliente() {
      try {
        const response = await axios.post('http://localhost:8000/api/cliente-contacto', this.form);
        alert("Registrado exitosamente");
        this.limpiarF();
      } catch (error) {
        console.error(error.response?.data || error);
        alert("Error al registrar cliente");
      }
    },
    limpiarF() {
      this.form = {
        nombre: '',
        telefono: '',
        direccion: '',
        email: '',
        estado: true
      };
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
            <h1>¡Suscríbete en nuestra Plataforma!</h1>
            <p class="mb-4">
              Serás el primero en enterarte de nuestras novedades, descuentos,
              lanzamientos y más.
            </p>
            <p>
              <RouterLink to="/shop" class="btn btn-secondary me-2"
                >Comprar Ahora</RouterLink
              >
            </p>
          </div>
        </div>
        <div class="col-lg-7">
          <div class="hero-img-wrap">
            <img
              src="@/assets/images/—Pngtree—artificial.png"
              class="img-fluid"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Hero Section -->

  <!-- Start Contact Form -->
  <div class="untree_co-section">
    <div class="container">
      <div class="block">
        <div class="row justify-content-center">
          <div class="col-md-8 col-lg-8 pb-4">
            <div class="row mb-5">
              <div class="col-lg-4">
                <div
                  class="service no-shadow align-items-center link horizontal d-flex active"
                  data-aos="fade-left"
                  data-aos-delay="0"
                >
                  <div class="service-icon color-1 mb-4">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-geo-alt-fill"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"
                      />
                    </svg>
                  </div>
                  <!-- /.icon -->
                  <div class="service-contents">
                    <p>8 Avenida, Zona 1, Quetzaltenango</p>
                  </div>
                  <!-- /.service-contents-->
                </div>
                <!-- /.service -->
              </div>

              <div class="col-lg-4">
                <div
                  class="service no-shadow align-items-center link horizontal d-flex active"
                  data-aos="fade-left"
                  data-aos-delay="0"
                >
                  <div class="service-icon color-1 mb-4">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-envelope-fill"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"
                      />
                    </svg>
                  </div>
                  <!-- /.icon -->
                  <div class="service-contents">
                    <p>infoWAM@outlook.com</p>
                  </div>
                  <!-- /.service-contents-->
                </div>
                <!-- /.service -->
              </div>

              <div class="col-lg-4">
                <div
                  class="service no-shadow align-items-center link horizontal d-flex active"
                  data-aos="fade-left"
                  data-aos-delay="0"
                >
                  <div class="service-icon color-1 mb-4">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-telephone-fill"
                      viewBox="0 0 16 16"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"
                      />
                    </svg>
                  </div>
                  <!-- /.icon -->
                  <div class="service-contents">
                    <p>+502 7761 8937</p>
                  </div>
                  <!-- /.service-contents-->
                </div>
                <!-- /.service -->
              </div>
            </div>

            <form @submit.prevent="registrarCliente">
              <div class="row">
                <div class="col-6">
                  <div class="form-group">
                    <label class="text-black" for="nombre">Nombre</label>
                    <input v-model="form.nombre" type="text" class="form-control" id="nombre" placeholder="David Maldonado"/>
                  </div>
                </div>
                <div class="col-6">
                  <div class="form-group">
                    <label class="text-black" for="tel">Teléfono</label>
                    <input v-model="form.telefono" type="text" class="form-control" id="tel" placeholder="38153893"/>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="text-black" for="dir">Dirección</label>
                <input v-model="form.direccion" type="text" class="form-control" id="dir" placeholder="1ra calle 27-98 zona 14"/>
              </div>
              <div class="form-group">
                <label class="text-black" for="email">Correo electrónico</label>
                <input v-model="form.email" type="email" class="form-control" id="email" placeholder="david@gmail.com"/>
              </div>

              <button type="submit" class="btn btn-primary-hover-outline" style="position: relative; top: 30px;">
                Registrarse
             </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- End Contact Form -->

  <Footer>></Footer>
</template>
