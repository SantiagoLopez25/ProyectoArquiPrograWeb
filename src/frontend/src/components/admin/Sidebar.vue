<style>

</style>
<script>
export default {
    page: {},
    components: { },
    data() {
        return {
            appName: this.$APP_NAME,
            
        };
    },
    methods: {
        
    },
    beforeMount() {
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
              <span class="hide-menu">Home</span>
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
              <span class="hide-menu">UI COMPONENTS</span>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/button" aria-expanded="false">
                <iconify-icon icon="solar:layers-minimalistic-bold-duotone"></iconify-icon>
                <span class="hide-menu">Buttons</span>
              </RouterLink>
            </li>
            <li class="sidebar-item">
              <RouterLink  class="sidebar-link" to="/admin/alerts" aria-expanded="false">
                <iconify-icon icon="solar:danger-circle-line-duotone"></iconify-icon>
                <span class="hide-menu">Alerts</span>
              </RouterLink>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/card" aria-expanded="false">
                <iconify-icon icon="solar:bookmark-square-minimalistic-line-duotone"></iconify-icon>
                <span class="hide-menu">Card</span>
              </RouterLink>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/form" aria-expanded="false">
                <iconify-icon icon="solar:file-text-line-duotone"></iconify-icon>
                <span class="hide-menu">Forms</span>
              </RouterLink>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/typography" aria-expanded="false">
                <iconify-icon icon="solar:text-field-focus-line-duotone"></iconify-icon>
                <span class="hide-menu">Typography</span>
              </RouterLink>
            </li>
            <li>
              <span class="sidebar-divider lg"></span>
            </li>
            <li class="nav-small-cap">
              <iconify-icon icon="solar:menu-dots-linear" class="nav-small-cap-icon fs-4"></iconify-icon>
              <span class="hide-menu">AUTH</span>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/signin" aria-expanded="false">
                <iconify-icon icon="solar:login-3-line-duotone"></iconify-icon>
                <span class="hide-menu">Login</span>
              </RouterLink>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/signup" aria-expanded="false">
                <iconify-icon icon="solar:user-plus-rounded-line-duotone"></iconify-icon>
                <span class="hide-menu">Register</span>
              </RouterLink>
            </li>
            <li>
              <span class="sidebar-divider lg"></span>
            </li>
            <li class="nav-small-cap">
              <iconify-icon icon="solar:menu-dots-linear" class="nav-small-cap-icon fs-4"></iconify-icon>
              <span class="hide-menu">EXTRA</span>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/icon-tabler" aria-expanded="false">
                <iconify-icon icon="solar:sticker-smile-circle-2-line-duotone"></iconify-icon>
                <span class="hide-menu">Icons</span>
              </RouterLink>
            </li>
            <li class="sidebar-item">
              <RouterLink class="sidebar-link" to="/admin/sample-page" aria-expanded="false">
                <iconify-icon icon="solar:planet-3-line-duotone"></iconify-icon>
                <span class="hide-menu">Sample Page</span>
              </RouterLink>
            </li>
          </ul>
          <div
            class="unlimited-access d-flex align-items-center hide-menu bg-primary-subtle position-relative mb-7 mt-4 p-3 rounded">
            <div class="me-2 flex-shrink-0">
              <h6 class="fw-semibold fs-4 mb-6 text-dark w-75">Upgrade to pro</h6>
              <a href="https://www.wrappixel.com/templates/materialm-admin-dashboard-template/?ref=33" target="_blank"
                class="btn btn-primary fs-2 fw-semibold lh-sm">Buy Pro</a>
            </div>
            <div class="unlimited-access-img">
              <img src="@/assets/images/backgrounds/rupee.png" alt="" class="img-fluid">
            </div>
          </div>
        </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
</template>