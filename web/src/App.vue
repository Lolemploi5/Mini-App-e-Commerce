<template>
  <div id="app" class="app">
    <Header :user="user" />
    
    <main class="main">
      <div v-if="currentView === 'products'" class="container">
        <h2 class="section-title">🛍️ Nos Produits</h2>
        <ProductGrid 
          :products="products" 
          @add-to-cart="addToCart"
        />
      </div>

      <div v-else-if="currentView === 'cart'" class="container">
        <h2 class="section-title">🛒 Panier</h2>
        <Cart 
          :items="cartItems" 
          :total="cartTotal"
          @update-quantity="updateCartQuantity"
          @remove-item="removeFromCart"
          @checkout="processCheckout"
        />
      </div>
    </main>

    <BottomNav 
      :current-view="currentView"
      :cart-count="cartCount"
      @navigate="navigateTo"
    />

    <!-- Notification Toast -->
    <Transition name="toast">
      <div v-if="notification" class="toast">
        {{ notification }}
      </div>
    </Transition>
  </div>
</template>

<script>
import { ref, computed, onMounted } from 'vue'
import Header from './components/Header.vue'
import ProductGrid from './components/ProductGrid.vue'
import Cart from './components/Cart.vue'
import BottomNav from './components/BottomNav.vue'

export default {
  name: 'App',
  components: {
    Header,
    ProductGrid,
    Cart,
    BottomNav
  },
  
  setup() {
    const currentView = ref('products')
    const user = ref(null)
    const notification = ref('')
    
    // Données des produits
    const products = ref([
      {
        id: 1,
        name: 'iPhone 15 Pro',
        price: 1199,
        image: '📱',
        description: 'Le dernier iPhone avec une caméra professionnelle'
      },
      {
        id: 2,
        name: 'MacBook Air M3',
        price: 1299,
        image: '💻',
        description: 'Ultra-portable avec la puce M3'
      },
      {
        id: 3,
        name: 'AirPods Pro',
        price: 249,
        image: '🎧',
        description: 'Réduction de bruit active'
      },
      {
        id: 4,
        name: 'iPad Pro',
        price: 899,
        image: '📝',
        description: 'Pour les créatifs et professionnels'
      },
      {
        id: 5,
        name: 'Apple Watch',
        price: 399,
        image: '⌚',
        description: 'Santé et fitness au quotidien'
      },
      {
        id: 6,
        name: 'AirTag',
        price: 29,
        image: '🏷️',
        description: 'Retrouvez vos objets facilement'
      }
    ])
    
    // Panier
    const cartItems = ref([])
    
    // Computed properties
    const cartCount = computed(() => 
      cartItems.value.reduce((total, item) => total + item.quantity, 0)
    )
    
    const cartTotal = computed(() => 
      cartItems.value.reduce((total, item) => total + (item.price * item.quantity), 0)
    )
    
    // Methods
    const navigateTo = (view) => {
      currentView.value = view
    }
    
    const addToCart = (product) => {
      const existingItem = cartItems.value.find(item => item.id === product.id)
      
      if (existingItem) {
        existingItem.quantity += 1
      } else {
        cartItems.value.push({
          ...product,
          quantity: 1
        })
      }
      
      showNotification(`${product.name} ajouté au panier! 🎉`)
    }
    
    const updateCartQuantity = (productId, quantity) => {
      const item = cartItems.value.find(item => item.id === productId)
      if (item) {
        item.quantity = quantity
      }
    }
    
    const removeFromCart = (productId) => {
      const index = cartItems.value.findIndex(item => item.id === productId)
      if (index > -1) {
        const item = cartItems.value[index]
        cartItems.value.splice(index, 1)
        showNotification(`${item.name} retiré du panier`)
      }
    }
    
    const processCheckout = () => {
      if (cartItems.value.length === 0) {
        showNotification('Votre panier est vide! 🛒')
        return
      }
      
      // Simulation du checkout avec l'API Telegram
      if (window.Telegram?.WebApp) {
        const invoiceData = {
          items: cartItems.value,
          total: cartTotal.value
        }
        
        // Envoyer les données à Telegram
        window.Telegram.WebApp.sendData(JSON.stringify(invoiceData))
        
        showNotification('Commande envoyée! 🚀')
        cartItems.value = []
        navigateTo('products')
      } else {
        showNotification('Commande simulée: ' + cartTotal.value + '€')
        cartItems.value = []
        navigateTo('products')
      }
    }
    
    const showNotification = (message) => {
      notification.value = message
      setTimeout(() => {
        notification.value = ''
      }, 3000)
    }
    
    // Lifecycle
    onMounted(() => {
      // Récupérer les informations utilisateur de Telegram
      if (window.Telegram?.WebApp?.initDataUnsafe?.user) {
        user.value = window.Telegram.WebApp.initDataUnsafe.user
      }
    })
    
    return {
      currentView,
      user,
      notification,
      products,
      cartItems,
      cartCount,
      cartTotal,
      navigateTo,
      addToCart,
      updateCartQuantity,
      removeFromCart,
      processCheckout
    }
  }
}
</script>
