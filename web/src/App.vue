<template>
  <div id="app" class="app">
    <div class="welcome-container">
      <div class="welcome-card">
        <h1 class="greeting">👋 Bonjour!</h1>
        <div v-if="user" class="user-info">
          <h2 class="user-name">{{ user.first_name }} {{ user.last_name || '' }}</h2>
          <p class="user-details">@{{ user.username || 'Utilisateur' }}</p>
        </div>
        <div v-else class="loading">
          <p>Chargement des informations utilisateur...</p>
        </div>
        <div class="app-info">
          <p>🚀 Bienvenue dans notre Mini App Telegram!</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue'

export default {
  name: 'App',
  
  setup() {
    const user = ref(null)
    
    // Lifecycle
    onMounted(() => {
      // Initialiser l'app Telegram
      if (window.Telegram?.WebApp) {
        window.Telegram.WebApp.ready()
        window.Telegram.WebApp.expand()
        
        // Récupérer les informations utilisateur de Telegram
        if (window.Telegram.WebApp.initDataUnsafe?.user) {
          user.value = window.Telegram.WebApp.initDataUnsafe.user
        }
      } else {
        // Mode développement - utilisateur factice
        user.value = {
          first_name: 'Développeur',
          last_name: 'Test',
          username: 'dev_user'
        }
      }
    })
    
    return {
      user
    }
  }
}
</script>

<style scoped>
.app {
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

.welcome-container {
  width: 100%;
  max-width: 400px;
}

.welcome-card {
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  border-radius: 20px;
  padding: 30px;
  text-align: center;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.greeting {
  color: #2c3e50;
  font-size: 2.5rem;
  margin-bottom: 20px;
  font-weight: 700;
}

.user-info {
  margin: 25px 0;
}

.user-name {
  color: #34495e;
  font-size: 1.8rem;
  font-weight: 600;
  margin-bottom: 8px;
}

.user-details {
  color: #7f8c8d;
  font-size: 1.1rem;
  margin-bottom: 0;
}

.loading {
  color: #7f8c8d;
  font-style: italic;
  margin: 25px 0;
}

.app-info {
  margin-top: 25px;
  padding-top: 20px;
  border-top: 1px solid rgba(149, 165, 166, 0.2);
}

.app-info p {
  color: #5a6c7d;
  font-size: 1rem;
  margin: 0;
  line-height: 1.5;
}

/* Animation de fade-in */
.welcome-card {
  animation: fadeInUp 0.6s ease-out;
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Responsive design */
@media (max-width: 480px) {
  .app {
    padding: 10px;
  }
  
  .welcome-card {
    padding: 20px;
  }
  
  .greeting {
    font-size: 2rem;
  }
  
  .user-name {
    font-size: 1.5rem;
  }
}
</style>
