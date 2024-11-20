<style>

</style>
<script>
import RolController from '@/controllers/RolController';
import TipoRol from '@/models/TipoRol';
import Sesion from '@/services/Sesion';

export default {
    page: {},
    components: { },
    data() {
        return {
            appName: this.$APP_NAME,
            visible: false
        };
    },
    methods: {
        
    },
    mounted() {
      let user = Sesion.getUsuario();
      const control = new RolController(this.$_SERVER_NAME);
      control.setControllerListener(reponse => {
        this.visible = TipoRol.isGerente(reponse);
      });
      control.buscarRol(user.getId());
    }
}
</script>
<template>
    <!-- Sidebar Start -->
    <aside class="left-sidebar">
      <!-- Sidebar scroll-->
      <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
          <router-link to="/admin/" class="text-nowrap logo-img" replace>
            <img src="@/assets/logo.svg" alt="" width="80px" />
          </router-link>
          <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
          </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
          <ul id="sidebarnav">
            <li class="nav-small-cap">
              <iconify-icon icon="solar:menu-dots-linear" class="nav-small-cap-icon fs-4"></iconify-icon>
              <span class="hide-menu">Inicio</span>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/" aria-expanded="false">
                <iconify-icon icon="solar:widget-add-line-duotone"></iconify-icon>
                <span class="hide-menu">Dashboard</span>
              </RouterLink>
            </li>
            <li>
              <span class="sidebar-divider lg"></span>
            </li>
            <li class="nav-small-cap">
              <iconify-icon icon="solar:menu-dots-linear" class="nav-small-cap-icon fs-4"></iconify-icon>
              <span class="hide-menu">Control</span>
            </li>
            <li v-if="visible" class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/button" aria-expanded="false">
                <iconify-icon icon="solar:layers-minimalistic-bold-duotone"></iconify-icon>
                <span class="hide-menu">Reportes</span>
              </RouterLink>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/administrar-productos" aria-expanded="false">
                <iconify-icon icon="solar:planet-3-line-duotone"></iconify-icon>
                <span class="hide-menu">Productos</span>
              </RouterLink>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/inventario" aria-expanded="false">
                <iconify-icon icon="solar:planet-3-line-duotone"></iconify-icon>
                <span class="hide-menu">Inventario</span>
              </RouterLink>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/card" aria-expanded="false">
                <iconify-icon icon="solar:bookmark-square-minimalistic-line-duotone"></iconify-icon>
                <span class="hide-menu">Nueva Compra</span>
              </RouterLink>
            </li>
            <li  class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/compras" aria-expanded="false">
                <iconify-icon icon="solar:bookmark-square-minimalistic-line-duotone"></iconify-icon>
                <span class="hide-menu">Administrar Pedidos</span>
              </RouterLink>
            </li>
            <li>
              <span class="sidebar-divider lg"></span>
            </li>
            <li class="nav-small-cap">
              <iconify-icon icon="solar:menu-dots-linear" class="nav-small-cap-icon fs-4"></iconify-icon>
              <span class="hide-menu">Sistema</span>
            </li>
            <li v-if="visible"  class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/permisos" aria-expanded="false">
                <iconify-icon icon="solar:user-plus-rounded-line-duotone"></iconify-icon>
                <span class="hide-menu">Usuarios</span>
              </RouterLink>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/logout" aria-expanded="false">
                <iconify-icon icon="solar:login-3-line-duotone"></iconify-icon>
                <span class="hide-menu">Salir</span>
              </RouterLink>
            </li>
            <li>
              <span class="sidebar-divider lg"></span>
            </li>
            <!-- <li class="nav-small-cap">
              <iconify-icon icon="solar:menu-dots-linear" class="nav-small-cap-icon fs-4"></iconify-icon>
              <span class="hide-menu">EXTRA</span>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/icon-tabler" aria-expanded="false">
                <iconify-icon icon="solar:sticker-smile-circle-2-line-duotone"></iconify-icon>
                <span class="hide-menu">Icons</span>
              </RouterLink>
            </li> -->
          </ul>

        </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
</template>