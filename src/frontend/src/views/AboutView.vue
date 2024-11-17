<script>
import { RouterLink } from 'vue-router'
import Footer from '@/components/Footer.vue';
import Header from '@/components/Header.vue';
import Testimonials from '@/components/Testimonials.vue';

export default {
  page: { },
  components: {Header, Footer, Testimonials },
  data() {
    return {
      
    }
  },
  methods: {
        initialize() {
            // marcar en el header la pestaña correspondiente
            this.$refs.vwHeader.selectItem('about')
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
            <h1>Sobre Nosotros -  WAM</h1>
            <p class="mb-4">Somos una empresa que ofrece cualquier tecnología para uso general o empresarial.</p>
            <p><RouterLink  to="/shop" class="btn btn-secondary me-2">Comprar Ahora</RouterLink></p>
          </div>
        </div>
        <div class="col-lg-7">
          <div class="hero-img-wrap">
            <img src="@/assets/images/image01.png" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Hero Section -->



  <!-- Start Why Choose Us Section -->
  <div class="why-choose-section">
    <div class="container">
      <div class="row justify-content-between align-items-center">
        <div class="col-lg-6">
          <h2 class="section-title">¿Por qué elegirnos?</h2>
          <p>{{  this.$APP_NAME }} tiene un equipo capacitado para brindarle soporte profesional para ayudarle 
            con sus equipo, estamos comprometidos a ofrecerle el mejor servicio. .</p>

            
        </div>

        <div class="col-lg-5">
          <div class="img-wrap">
            <img src="https://t4.ftcdn.net/jpg/05/59/14/65/360_F_559146542_6U4XiJlJZ8iui6ye1D9H8Cctfd3Z3vGa.jpg" alt="Image" class="img-fluid">
          </div>
        </div>

      </div>
    </div>
  </div>
  <!-- End Why Choose Us Section -->

  <!-- Start Team Section -->
  <!-- <div class="untree_co-section">
    <div class="container">

      <div class="row mb-5">
        <div class="col-lg-5 mx-auto text-center">
          <h2 class="section-title">Our Team</h2>
        </div>
      </div>

      <div class="row">

        <!-- Start Column 1 --
        <div class="col-12 col-md-6 col-lg-3 mb-5 mb-md-0">
          <img src="@/assets/images/person_1.jpg" class="img-fluid mb-5">
          <h3 clas><a href="#"><span class="">Lawson</span> Arnold</a></h3>
          <span class="d-block position mb-4">CEO, Founder, Atty.</span>
          <p>Separated they live in.
            Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          <p class="mb-0"><a href="#" class="more dark">Learn More <span class="icon-arrow_forward"></span></a></p>
        </div>
        <!-- End Column 1 --

        <!-- Start Column 2 --
        <div class="col-12 col-md-6 col-lg-3 mb-5 mb-md-0">
          <img src="@/assets/images/person_2.jpg" class="img-fluid mb-5">

          <h3 clas><a href="#"><span class="">Jeremy</span> Walker</a></h3>
          <span class="d-block position mb-4">CEO, Founder, Atty.</span>
          <p>Separated they live in.
            Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          <p class="mb-0"><a href="#" class="more dark">Learn More <span class="icon-arrow_forward"></span></a></p>

        </div>
        <!-- End Column 2 --

        <!-- Start Column 3 --
        <div class="col-12 col-md-6 col-lg-3 mb-5 mb-md-0">
          <img src="@/assets/images/person_3.jpg" class="img-fluid mb-5">
          <h3 clas><a href="#"><span class="">Patrik</span> White</a></h3>
          <span class="d-block position mb-4">CEO, Founder, Atty.</span>
          <p>Separated they live in.
            Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          <p class="mb-0"><a href="#" class="more dark">Learn More <span class="icon-arrow_forward"></span></a></p>
        </div>
        <!-- End Column 3 --

        <!-- Start Column 4 --
        <div class="col-12 col-md-6 col-lg-3 mb-5 mb-md-0">
          <img src="@/assets/images/person_4.jpg" class="img-fluid mb-5">

          <h3 clas><a href="#"><span class="">Kathryn</span> Ryan</a></h3>
          <span class="d-block position mb-4">CEO, Founder, Atty.</span>
          <p>Separated they live in.
            Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          <p class="mb-0"><a href="#" class="more dark">Learn More <span class="icon-arrow_forward"></span></a></p>


        </div>
        <!-- End Column 4 --



      </div>
    </div>
  </div> -->
  <!-- End Team Section -->



  <!-- Start Testimonial Slider -->
  <Testimonials></Testimonials>
  <!-- End Testimonial Slider -->

   <Footer></Footer>
</template>
