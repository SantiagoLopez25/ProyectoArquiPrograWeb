<script>
import { RouterLink } from 'vue-router'
import Footer from '@/components/Footer.vue';
import Header from '@/components/Header.vue';
import Soporte from '@/components/Soporte.vue';
import VistaPrevia from '@/components/VistaPrevia.vue';
import Testimonials from '@/components/Testimonials.vue';

export default {
    page: {},
    components: { Header, Footer, Soporte, VistaPrevia, Testimonials },
    data() {
        return {

        }
    },
    methods: {
        initialize() {
            // marcar en el header la pestaña correspondiente
            this.$refs.vwHeader.selectItem('services')
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
                        <h1>Nuestros servicios WAM</h1>
                        <p class="mb-4">Contamos con soporte tecnico para cualquier dispositico general e instalaciones
                            de software.</p>
                        <p>
                            <RouterLink to="/shop" class="btn btn-secondary me-2">Comprar Ahora</RouterLink>
                        </p>
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


            <Soporte></Soporte>

        </div>
    </div>
    <!-- End Why Choose Us Section -->

    <!-- Start Product Section -->
    <VistaPrevia></VistaPrevia>
    <!-- End Product Section -->



    <!-- Start Testimonial Slider -->
    <Testimonials></Testimonials>
    <!-- End Testimonial Slider -->

    <Footer></Footer>
</template>