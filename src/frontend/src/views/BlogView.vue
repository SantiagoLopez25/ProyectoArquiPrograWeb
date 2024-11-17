<script>
import { RouterLink } from "vue-router";
import Footer from "@/components/Footer.vue";
import Header from "@/components/Header.vue";
import Testimonials from "@/components/Testimonials.vue";

export default {
  page: {},
  components: { Header, Footer, Testimonials },
  data() {
    return {
      nombreHost: this.$APP_NAME,
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
        <div class="col-12 col-sm-6 col-md-4 mb-5">
          <div class="post-entry">
            <a href="#" class="post-thumbnail"
              ><img
                src="@/assets/images/post-1.jpg"
                alt="Image"
                class="img-fluid"
            /></a>
            <div class="post-content-entry">
              <h3><a href="#">First Time Home Owner Ideas</a></h3>
              <div class="meta">
                <span>by <a href="#">Kristin Watson</a></span>
                <span>on <a href="#">Dec 19, 2021</a></span>
              </div>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 mb-5">
          <div class="post-entry">
            <a href="#" class="post-thumbnail"
              ><img
                src="@/assets/images/post-2.jpg"
                alt="Image"
                class="img-fluid"
            /></a>
            <div class="post-content-entry">
              <h3><a href="#">How To Keep Your Furniture Clean</a></h3>
              <div class="meta">
                <span>by <a href="#">Robert Fox</a></span>
                <span>on <a href="#">Dec 15, 2021</a></span>
              </div>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 mb-5">
          <div class="post-entry">
            <a href="#" class="post-thumbnail"
              ><img
                src="@/assets/images/post-3.jpg"
                alt="Image"
                class="img-fluid"
            /></a>
            <div class="post-content-entry">
              <h3><a href="#">Small Space Furniture Apartment Ideas</a></h3>
              <div class="meta">
                <span>by <a href="#">Kristin Watson</a></span>
                <span>on <a href="#">Dec 12, 2021</a></span>
              </div>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 mb-5">
          <div class="post-entry">
            <a href="#" class="post-thumbnail"
              ><img
                src="@/assets/images/post-1.jpg"
                alt="Image"
                class="img-fluid"
            /></a>
            <div class="post-content-entry">
              <h3><a href="#">First Time Home Owner Ideas</a></h3>
              <div class="meta">
                <span>by <a href="#">Kristin Watson</a></span>
                <span>on <a href="#">Dec 19, 2021</a></span>
              </div>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 mb-5">
          <div class="post-entry">
            <a href="#" class="post-thumbnail"
              ><img
                src="@/assets/images/post-2.jpg"
                alt="Image"
                class="img-fluid"
            /></a>
            <div class="post-content-entry">
              <h3><a href="#">How To Keep Your Furniture Clean</a></h3>
              <div class="meta">
                <span>by <a href="#">Robert Fox</a></span>
                <span>on <a href="#">Dec 15, 2021</a></span>
              </div>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 mb-5">
          <div class="post-entry">
            <a href="#" class="post-thumbnail"
              ><img
                src="@/assets/images/post-3.jpg"
                alt="Image"
                class="img-fluid"
            /></a>
            <div class="post-content-entry">
              <h3><a href="#">Small Space Furniture Apartment Ideas</a></h3>
              <div class="meta">
                <span>by <a href="#">Kristin Watson</a></span>
                <span>on <a href="#">Dec 12, 2021</a></span>
              </div>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 mb-5">
          <div class="post-entry">
            <a href="#" class="post-thumbnail"
              ><img
                src="@/assets/images/post-1.jpg"
                alt="Image"
                class="img-fluid"
            /></a>
            <div class="post-content-entry">
              <h3><a href="#">First Time Home Owner Ideas</a></h3>
              <div class="meta">
                <span>by <a href="#">Kristin Watson</a></span>
                <span>on <a href="#">Dec 19, 2021</a></span>
              </div>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 mb-5">
          <div class="post-entry">
            <a href="#" class="post-thumbnail"
              ><img
                src="@/assets/images/post-2.jpg"
                alt="Image"
                class="img-fluid"
            /></a>
            <div class="post-content-entry">
              <h3><a href="#">How To Keep Your Furniture Clean</a></h3>
              <div class="meta">
                <span>by <a href="#">Robert Fox</a></span>
                <span>on <a href="#">Dec 15, 2021</a></span>
              </div>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 mb-5">
          <div class="post-entry">
            <a href="#" class="post-thumbnail"
              ><img
                src="@/assets/images/post-3.jpg"
                alt="Image"
                class="img-fluid"
            /></a>
            <div class="post-content-entry">
              <h3><a href="#">Small Space Furniture Apartment Ideas</a></h3>
              <div class="meta">
                <span>by <a href="#">Kristin Watson</a></span>
                <span>on <a href="#">Dec 12, 2021</a></span>
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
