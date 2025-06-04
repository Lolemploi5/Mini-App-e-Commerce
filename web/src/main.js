import { createApp } from 'vue'
import App from './App.vue'
import './assets/style.css'

// Initialiser l'app Telegram
if (window.Telegram?.WebApp) {
  window.Telegram.WebApp.ready()
  window.Telegram.WebApp.expand()
}

createApp(App).mount('#app')
