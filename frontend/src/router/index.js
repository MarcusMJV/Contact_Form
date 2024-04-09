import { createRouter, createWebHistory } from 'vue-router'
import SavedListings from '../components/SavedListings.vue'
import ContactForm from '../components/ContactForm.vue'


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/entries',
      name: 'entries',
      component: SavedListings
    },
    {
      path: '/',
      name: 'home',
      component: ContactForm
    },
    
  ]
})

export default router
