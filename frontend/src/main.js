import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from './router'; // Import your router instance

// Create the Vue app instance
const app = createApp(App);

// Use the router instance in your Vue app
app.use(router);

// Mount the app to the DOM
app.mount('#app');