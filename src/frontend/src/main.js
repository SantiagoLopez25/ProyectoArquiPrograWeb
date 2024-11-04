import './assets/main.css'

import { createApp } from 'vue'
import LoadScript from "vue-plugin-load-script";

import App from './App.vue'
import router from './router'

const app = createApp(App)
app.use(LoadScript);
//===-------------------------------------------------------------
//==                    VARIABLES GLOBALES
//===-------------------------------------------------------------
app.config.globalProperties.$_SERVER_NAME = 'http://localhost:8000'  // Servidor -> Laravel
app.config.globalProperties.$APP_NAME = 'WAM technology'             // Nombre de la empresa
app.config.globalProperties.$DEBUG = true

//===-------------------------------------------------------------
//== configuraciones de vue: route y el componente principal
//===-------------------------------------------------------------
app.use(router)
app.mount('#app')
