import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
    //===-----------------------------------------------------===
    //===                   USER - PATHS
    //===-----------------------------------------------------===
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/shop',
      name: 'shop',
      component: () => import('../views/ShopView.vue')
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/services',
      name: 'services',
      component: () => import('../views/ServicesView.vue')
    },
    {
      path: '/blog',
      name: 'blog',
      component: () => import('../views/BlogView.vue')
    },
    {
      path: '/contact',
      name: 'contact',
      component: () => import('../views/ContactView.vue')
    },
    {
      path: '/cart',
      name: 'cart',
      component: () => import('../views/CartView.vue')
    },
    {
      path: '/checkout',
      name: 'checkout',
      component: () => import('../views/CheckoutView.vue')
    },
    {
      path: '/thankyou',
      name: 'thankyou',
      component: () => import('../views/ThankyouView.vue')
    },

    //===-----------------------------------------------------===
    //===                   ADMIN - PATHS
    //===-----------------------------------------------------===
    {
      path: '/admin/',
      name: 'index',
      component: () => import('../views/admin/index.vue')
    },
    {
      path: '/admin/button',
      name: 'button',
      component: () => import('../views/admin/button.vue')
    },
    {
      path: '/admin/alerts',
      name: 'alerts',
      component: () => import('../views/admin/alerts.vue')
    },
    {
      path: '/admin/form',
      name: 'form',
      component: () => import('../views/admin/form.vue')
    },
    {
      path: '/admin/signin',
      name: 'signin',
      component: () => import('../views/admin/signin.vue')
    },
    {
      path: '/admin/signup',
      name: 'signup',
      component: () => import('../views/admin/signup.vue')
    },
    {
      path: '/admin/icon-tabler',
      name: 'icon-tabler',
      component: () => import('../views/admin/icon-tabler.vue')
    },
    {
      path: '/admin/card',
      name: 'card',
      component: () => import('../views/admin/card.vue')
    },
    {
      path: '/admin/compras',
      name: 'compras',
      component: () => import('../views/admin/compras.vue')
    },
    {
      path: '/admin/sample-page',
      name: 'sample-page',
      component: () => import('../views/admin/sample-page.vue')
    },
    {
      path: '/admin/typography',
      name: 'typography',
      component: () => import('../views/admin/typography.vue')
    },
    {
      path: '/admin/logout',
      name: 'logout',
      component: () => import('../views/admin/logout.vue')
    },
    
    {
      path: '/:pathMatch(.*)*',
      component: () => import('../components/admin/404.vue')
    },
    {
      path: '/admin/administrar-productos',
      name: 'administrar-productos',
      component: () => import('../views/admin/productos.vue')
    },
    {
      path: '/admin/inventario',
      name: 'inventario',
      component: () => import('../views/admin/traslados.vue')
    },
    
  ]
})

export default router
