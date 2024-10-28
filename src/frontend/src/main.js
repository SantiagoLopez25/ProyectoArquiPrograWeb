import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

const app = createApp(App)
//===-------------------------------------------------------------
//==                    VARIABLES GLOBALES
//===-------------------------------------------------------------
app.config.globalProperties.$_SERVER_NAME = 'http://localhost:8000'  // Servidor -> Laravel
app.config.globalProperties.$APP_NAME = 'WAM technology'              // Nombre de la empresa

//===-------------------------------------------------------------
//== configuraciones de vue: route y el componente principal
//===-------------------------------------------------------------
app.use(router)
app.mount('#app')
