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
          <div class="card">
            <div class="card-body">
              <h5 class="card-title fw-semibold mb-4">Headings</h5>
              <div class="card">
                <div class="card-body p-4">
                  <h1>h1. Bootstrap heading</h1>
                  <h2>h2. Bootstrap heading</h2>
                  <h3>h3. Bootstrap heading</h3>
                  <h4>h4. Bootstrap heading</h4>
                  <h5>h5. Bootstrap heading</h5>
                  <h6>h6. Bootstrap heading</h6>
                </div>
              </div>
              <h5 class="card-title fw-semibold mb-4">Inline text elements</h5>
              <div class="card mb-0">
                <div class="card-body p-4">
                  <p>You can use the mark tag to <mark>highlight</mark> text.</p>
                  <p><del>This line of text is meant to be treated as deleted text.</del></p>
                  <p><s>This line of text is meant to be treated as no longer accurate.</s></p>
                  <p><ins>This line of text is meant to be treated as an addition to the document.</ins></p>
                  <p><u>This line of text will render as underlined.</u></p>
                  <p><small>This line of text is meant to be treated as fine print.</small></p>
                  <p><strong>This line rendered as bold text.</strong></p>
                  <p class="mb-0"><em>This line rendered as italicized text.</em></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>