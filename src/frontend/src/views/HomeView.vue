<script>
import { RouterLink } from "vue-router";

import Footer from "@/components/Footer.vue";
import Header from "@/components/Header.vue";
import Soporte from "@/components/Soporte.vue";
import VistaPrevia from "@/components/VistaPrevia.vue";

export default {
  page: {},
  components: { Header, Footer, Soporte, VistaPrevia },
  data() {
    return {};
  },
  methods: {
    initialize() {
      // marcar en el header la pestaña correspondiente
      this.$refs.vwHeader.selectItem("home");
    },
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
            <h1>
              WAM te conecta hacia la <span clsas="d-block">Tecnología</span>
            </h1>
            <p class="mb-4">
              ¡Compartimos Nuestra Pasión por la Tecnología para Alegrar y
              Simplificar tu Vida!
            </p>
            <p>
              <RouterLink to="/shop" class="btn btn-secondary me-2">Comprar Ahora</RouterLink>
              <!--<a href="#product-section"
                class="btn btn-white-outline">Explorar</a>-->
            </p>
          </div>
        </div>
        <div class="col-lg-7">
          <div class="hero-img-wrap">
            <img src="@/assets/images/—Pngtree—artificial.png" class="img-fluid" />
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Hero Section -->

  <!-- Start Product Section -->
  <VistaPrevia></VistaPrevia>
  <!-- End Product Section -->

  <!-- Start Why Choose Us Section -->
  <div class="why-choose-section">
    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-6">
          <h2 class="section-title">¿Por qué nosotros?</h2>

          <Soporte></Soporte>
        </div>

        <div class="col-lg-5">
          <div class="img-wrap">
            <img src="https://blog.personal.com.py/wp-content/uploads/2024/03/Que%CC%81-tener-en-cuenta-para-comprar-una-PC-gamer.jpg" alt="Image" class="img-fluid" />
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Why Choose Us Section -->

  <!-- Start We Help Section -->
  <div class="we-help-section">
    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-7 mb-5 mb-lg-0">
          <div class="imgs-grid">
            <div class="grid grid-1">
              <img src="https://avatars.mds.yandex.net/get-mpic/5221826/img_id6967564019551899408.png/orig" alt="Untree.co" />
            </div>
            <div class="grid grid-2">
              <img src="https://www.teraguate.com/web/image/138731-3783e613/teclados-gaming-tera.jpg?access_token=dd5cdb20-e31b-4396-872b-6e67999b76da" alt="Untree.co" />
            </div>
            <div class="grid grid-3">
              <img src="https://i.blogs.es/4b069b/gallery-11/650_1200.jpg" alt="Untree.co" />
            </div>
          </div>
        </div>
        <div class="col-lg-5 ps-lg-5">
          <h2 class="section-title mb-4">
            ¡Compartimos Nuestra Pasión por la Tecnología para Alegrar y Simplificar tu Vida!
          </h2>
          <p>
            {{ this.$APP_NAME }} ofrece la tecnología a tu alcance, puedes encontrar cualquier dispositivos con nosotros.
          </p>

          <ul class="list-unstyled custom-list my-4">
            <li>Computadoras</li>
            <li>Cámaras</li>
            <li>Electro domésticoss</li>
            <li>Equipos de sonido</li>
          </ul>
          <p><RouterLink to="/blog" class="btn">Explorar</RouterLink></p>
        </div>
      </div>
    </div>
  </div>
  <!-- End We Help Section -->

  

  

  

  <Footer></Footer>
</template>
