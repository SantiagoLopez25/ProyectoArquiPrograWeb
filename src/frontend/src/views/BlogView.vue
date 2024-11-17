<script>
import { RouterLink } from "vue-router";
import Footer from "@/components/Footer.vue";
import Header from "@/components/Header.vue";
import Testimonials from "@/components/Testimonials.vue";
import Producto from "@/controllers/ProductoController";

export default {
  page: {},
  components: { Header, Footer, Testimonials },
  data() {
    return {
      nombreHost: this.$APP_NAME,
      dbProductos: []
    };
  },
  methods: {
    initialize() {
       // marcar en el header la pestaña correspondiente
        this.$refs.vwHeader.selectItem('blog')
    }
  },
  mounted() {
    this.initialize()
    var producto = new Producto(this.$_SERVER_NAME);
    producto.getProductos().then(data => {
      var offset = 9;
      if (data.length > offset) {
        this.dbProductos = data.slice(0, 9);
      } else {
        this.dbProductos = data;
      }
    });
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
            <h1>Blog - {{ nombreHost }}</h1>
            <p class="mb-4">
              Haz que tu vida sea más SMART, ¡Pásate por wam.com y descubrelo!
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
            <img src="@/assets/images/image01.png" class="img-fluid" />
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Hero Section -->

  <!-- Start Blog Section -->
  <div class="blog-section">
    <div class="container">
      <div class="row">

        <div v-for="(producto, index) in dbProductos" :key="index" class="col-12 col-sm-6 col-md-4 mb-5">
          <div class="post-entry">
            <a href="#" class="post-thumbnail"
              ><img
                :src="producto.ruta"
                alt="Image"
                class="img-fluid"
            /></a>
            <div class="post-content-entry">
              <h3><a href="#">{{ producto.nombre }}</a></h3>
              <div class="meta">
                <span>{{ producto.descripcion }}</span>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
  <!-- End Blog Section -->

  <!-- Start Testimonial Slider -->
  <Testimonials></Testimonials>
  <!-- End Testimonial Slider -->

  <Footer></Footer>
</template>
