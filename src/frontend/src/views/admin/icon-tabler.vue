<style>
@import '../../assets/css/styles.min.css';
</style>
<script>
import { loadScript, unloadScript } from "vue-plugin-load-script";

import Sidebar from '@/components/admin/Sidebar.vue';
import Navbar from '@/components/admin/Navbar.vue';

export default {
    page: {},
    components: { Sidebar, Navbar },
    data() {
        return {
            scripts: [
                '/libs/jquery/dist/jquery.min.js',
                '/libs/bootstrap/dist/js/bootstrap.bundle.min.js',
                '/js/sidebarmenu.js',
                '/js/app.min.js',
                '/libs/simplebar/dist/simplebar.js',

                /* solar icons */
                'https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js'
            ]
        }
    },
    methods: {
        
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
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <Sidebar></Sidebar>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper">
      <!--  Header Start -->
     <Navbar></Navbar>
      <!--  Header End -->
      <div class="body-wrapper-inner">
        <div class="container-fluid">
          <div class="card w-100 h-100 position-relative overflow-hidden">
            <div class="card-body">
              <h5 class="card-title fw-semibold mb-4">Icons</h5>
              <iframe src="https://tabler-icons.io/" frameborder="0" style="height: calc(100vh - 250px); width: 100%;"
                data-simplebar=""></iframe>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>