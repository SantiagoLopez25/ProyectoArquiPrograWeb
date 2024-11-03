<script>
export default {
    expose: ['selectItem'],
    page: {},
    components: {},
    data() {
        return {
            nombreHost: this.$APP_NAME,
            itemClass:
                [{
                    nombre: 'home',
                    estado: 'active'
                },
                {
                    nombre: 'shop',
                    estado: ''
                },
                {
                    nombre: 'about',
                    estado: ''
                },
                {
                    nombre: 'services',
                    estado: ''
                },
                {
                    nombre: 'blog',
                    estado: ''
                },
                {
                    nombre: 'contact',
                    estado: ''
                }]
        };
    },
    methods: {
        selectItem(id) {
            for (var i = 0; i < this.itemClass.length; i++) {
                var myClass = this.itemClass[i];
                if (myClass.nombre === id) {
                    myClass.estado = 'active';
                } else {
                    myClass.estado = '';
                }
            }
        },
        html(idName) {
            return document.getElementById(idName);
        }
    }
};
</script>
<template>
    <!-- Start Header/Navigation -->
    <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

        <div class="container">
            <a class="navbar-brand" href="/">{{ nombreHost }}<span>.</span></a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
                aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsFurni">
                <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                    <li class="nav-item" :class="itemClass[0].estado" id="home">
                        <RouterLink class="nav-link" to="/" @click="selectItem('home')">Inicio</RouterLink>
                    </li>
                    <li id="shop" :class="itemClass[1].estado">
                        <RouterLink class="nav-link" to="/shop" @click="selectItem('shop')">Comprar</RouterLink>
                    </li>
                    <li id="about" :class="itemClass[2].estado">
                        <RouterLink class="nav-link" to="/about" @click="selectItem('about')">Sobre nosotros
                        </RouterLink>
                    </li>
                    <li id="services" :class="itemClass[3].estado">
                        <RouterLink class="nav-link" to="/services" @click="selectItem('services')">Servicios
                        </RouterLink>
                    </li>
                    <li id="blog" :class="itemClass[4].estado">
                        <RouterLink class="nav-link" to="/blog" @click="selectItem('blog')">Blog</RouterLink>
                    </li>
                    <li id="contact" :class="itemClass[5].estado">
                        <RouterLink class="nav-link" to="/contact" @click="selectItem('contact')">Registrarse
                        </RouterLink>
                    </li>
                </ul>

                <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                    <li><a class="nav-link" href="#"><img src="@/assets/images/user.svg"></a></li>
                    <li>
                        <RouterLink class="nav-link" to="/cart" @click="selectItem('')"><img
                                src="@/assets/images/cart.svg"></RouterLink>
                    </li>
                </ul>
            </div>
        </div>

    </nav>
    <!-- End Header/Navigation -->
</template>