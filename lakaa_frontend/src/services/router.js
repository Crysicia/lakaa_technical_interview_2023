import { createRouter, createWebHistory } from 'vue-router';

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      name: 'Home',
      component: () => import('../views/Home.vue')
    },
    {
      path: '/store',
      name: 'Store',
      component: () => import('../views/Store.vue')
    },
    {
      path: '/CSR',
      name: 'CSR',
      component: () => import('../views/CSR.vue')
    },
  ]
});

export default router;
