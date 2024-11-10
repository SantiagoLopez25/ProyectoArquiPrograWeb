<script>
import { loadScript, unloadScript } from "vue-plugin-load-script";

export default {
    page: {},
    components: { },
    data() {
        return {
            scripts: [
                '/js/bootstrap.bundle.min.js',
                '/js/tiny-slider.js',
                '/js/custom.js'
            ]
        };
    },
    methods: {
        initialize() {
            // marcar en el header la pestaña correspondiente
            this.$refs.vwHeader.selectItem('blog')
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
    <!-- Start Footer Section -->
    <footer class="footer-section">
        <div class="container relative">

            <div class="sofa-img">
                <img src="@/assets/images/camara.png" alt="Image" class="img-fluid">
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <div class="subscription-form">
                        <h3 class="d-flex align-items-center"><span class="me-1"><img
                                    src="@/assets/images/envelope-outline.svg" alt="Image"
                                    class="img-fluid"></span><span>¡Suscríbete a nuestro Newsletter!</span></h3>

                        <form action="#" class="row g-3">
                            <div class="col-auto">
                                <input type="text" class="form-control" placeholder="Ingresa tu nombre">
                            </div>
                            <div class="col-auto">
                                <input type="email" class="form-control" placeholder="Ingresa tu email">
                            </div>
                            <div class="col-auto">
                                <button class="btn btn-primary">
                                    <span class="fa fa-paper-plane"></span>
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

            <div class="row g-5 mb-5">
                <div class="col-lg-4">
                    <div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">{{ this.$APP_NAME }}<span></span></a></div>
                    <p class="mb-4">¿Cómo ha sido tu experiencia con el sitio?
                        Danos tu opinión acerca de nuestro sitio web</p>

                    <ul class="list-unstyled custom-social">
                        <li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
                        <li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
                        <li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
                        <li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
                    </ul>
                </div>

                <div class="col-lg-8">
                    <div class="row links-wrap">
                        <div class="col-6 col-sm-6 col-md-3">
                            <ul class="list-unstyled">
                                <li><b>Nuestra Tineda</b></li>
                                <li><RouterLink  to="/about">Sobre nosotros</RouterLink></li>
                                <li><RouterLink to="/services">Servicios</RouterLink ></li>
                                
                            </ul>
                        </div>

                       
                        <div class="col-6 col-sm-6 col-md-3">
                            <ul class="list-unstyled">
                                
                                <li><b>Soporte</b></li>
                                <li><a href="#">Sucursales</a></li>
                                <li><a href="#">Redes sociales</a></li>
                            </ul>
                        </div>

                        <div class="col-6 col-sm-6 col-md-3">
                            <ul class="list-unstyled">
                                <li><b>Catálogos</b></li>
                                <li><RouterLink  to="/shop">Comprar</RouterLink></li>
                                <li><RouterLink to="/blog">Blog</RouterLink></li>
                            </ul>
                        </div>

                        <!--
                        <div class="col-6 col-sm-6 col-md-3">
                            <ul class="list-unstyled">
                                <li><a href="#">Nordic Chair</a></li>
                                <li><a href="#">Kruzo Aero</a></li>
                                <li><a href="#">Ergonomic Chair</a></li>
                            </ul>
                        </div>-->
                    </div>
                </div>

            </div>
            <!--            <div class="border-top copyright">
                <div class="row pt-4">
                    <div class="col-lg-6 text-center text-lg-end">
                        <ul class="list-unstyled d-inline-flex ms-auto">
                            <li class="me-4"><a href="#">Términos &amp; Condiciones</a></li>
                            <li><a href="#">Política de privacidad</a></li>
                        </ul>
                    </div>

                </div>
            </div>
            -->
        </div>
    </footer>
    <!-- End Footer Section -->
</template>