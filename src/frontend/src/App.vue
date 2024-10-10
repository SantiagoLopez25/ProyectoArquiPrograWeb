<script setup>
import { RouterLink, RouterView } from 'vue-router'
import HomeView from './views/HomeView.vue'
import Footer from './components/Footer.vue'
import Header from './components/Header.vue'
</script>

<template>
  <Header></Header>  
  <RouterView />
  <Footer></Footer> 
</template>

<style scoped>

</style>