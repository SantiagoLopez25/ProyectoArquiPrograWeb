<script>
import { RouterLink } from "vue-router";

import Footer from "@/components/Footer.vue";
import Header from "@/components/Header.vue";

export default {
  page: {},
  components: { Header, Footer },
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
  <div class="product-section" id="#product-section">
    <div class="container">
      <div class="row">
        <!-- Start Column 1 -->
        <div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
          <h2 class="mb-4 section-title">Productos de la más alta tecnología</h2>
          <p class="mb-4">
            Con nosotros encuentras los productos y tecnologías que necesitas al mejor precio
            y con la más alta calidad
          </p>
          <RouterLink class="btn btn-black btn-lg py-3 btn-block" to="/shop">Comprar</RouterLink>
        </div>
        <!-- End Column 1 -->

        <!-- Start Column 2 -->
        <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
          <a class="product-item" >
            <img src="https://walmartgt.vtexassets.com/arquivos/ids/266640/Laptop-HP-Gamin-15-R5-8Gb-256Gb-15Ec1025-2-44461.jpg?v=637871997956200000" class="img-fluid product-thumbnail" />
            <h3 class="product-title">Laptop Gamer HP</h3>
            <RouterLink to="/shop"> <strong class="product-price">Q5000.00</strong> </RouterLink>

            <span class="icon-cross">
              <img src="@/assets/images/cross.svg" class="img-fluid" />
            </span>
          </a>
        </div>
        <!-- End Column 2 -->

        <!-- Start Column 3 -->
        <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
          <a class="product-item" >
            <img src="https://elektragt.vtexassets.com/arquivos/ids/195138/Audifonos-Sony-WH-CH520B-4003397--2-.jpg?v=638476786217930000" class="img-fluid product-thumbnail" />
            <h3 class="product-title">Sony WCH-520</h3>
            <RouterLink to="/shop"><strong class="product-price">Q400.00</strong></RouterLink>

            <span class="icon-cross">
              <img src="@/assets/images/cross.svg" class="img-fluid" />
            </span>
          </a>
        </div>
        <!-- End Column 3 -->

        <!-- Start Column 4 -->
        <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
          <a class="product-item" >
            <img src="https://images.samsung.com/latin/smartphones/galaxy-s24-ultra/images/galaxy-s24-ultra-highlights-color-titanium-yellow-back-mo.jpg?imbypass=true" class="img-fluid product-thumbnail" />
            <h3 class="product-title">Samsung Galaxy s24-Ultra</h3>
          <RouterLink to="/shop"> <strong class="product-price">Q.15000</strong></RouterLink>

            <span class="icon-cross">
              <img src="@/assets/images/cross.svg" class="img-fluid" />
            </span>
          </a>
        </div>
        <!-- End Column 4 -->
      </div>
    </div>
  </div>
  <!-- End Product Section -->

  <!-- Start Why Choose Us Section -->
  <div class="why-choose-section">
    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-6">
          <h2 class="section-title">¿Por qué nosotros?</h2>

          <div class="row my-5">
            <div class="col-6 col-md-6">
              <div class="feature">
                <div class="icon">
                  <img src="@/assets/images/truck.svg" alt="Image" class="imf-fluid" />
                </div>
                <h3>Compras instantáneas</h3>
                <p>
                  No necesitas más de 2 minutos para realizar una compra
                </p>
              </div>
            </div>

            <div class="col-6 col-md-6">
              <div class="feature">
                <div class="icon">
                  <img src="@/assets/images/bag.svg" alt="Image" class="imf-fluid" />
                </div>
                <h3>Fácil de comprar</h3>
                <p>
                  Nuestra prioridad son nuestros clientes, por eso búscamos
                  ofrecerte comodidad al usar nuestro sitio
                </p>
              </div>
            </div>

            <div class="col-6 col-md-6">
              <div class="feature">
                <div class="icon">
                  <img src="@/assets/images/support.svg" alt="Image" class="imf-fluid" />
                </div>
                <h3>Disponibilidad 24/7</h3>
                <p>
                  Puedes realizar una compra cuando lo desees
                </p>
              </div>
            </div>

            <div class="col-6 col-md-6">
              <div class="feature">
                <div class="icon">
                  <img src="@/assets/images/return.svg" alt="Image" class="imf-fluid" />
                </div>
                <h3>Poder de la amistad</h3>
                <p>
                  Si nos compras productos, juntos aumentamos el poder de la amistad
                </p>
              </div>
            </div>
          </div>
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
            We Help You Make Modern Interior Design
          </h2>
          <p>
            Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis
            nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate
            velit imperdiet dolor tempor tristique. Pellentesque habitant morbi
            tristique senectus et netus et malesuada
          </p>

          <ul class="list-unstyled custom-list my-4">
            <li>Donec vitae odio quis nisl dapibus malesuada</li>
            <li>Donec vitae odio quis nisl dapibus malesuada</li>
            <li>Donec vitae odio quis nisl dapibus malesuada</li>
            <li>Donec vitae odio quis nisl dapibus malesuada</li>
          </ul>
          <p><a herf="#" class="btn">Explore</a></p>
        </div>
      </div>
    </div>
  </div>
  <!-- End We Help Section -->

  

  

  

  <Footer></Footer>
</template>
