<template>
  <nav class="bottom-nav">
    <button 
      @click="$emit('navigate', 'products')"
      :class="['nav-btn', { active: currentView === 'products' }]"
    >
      <span class="nav-icon">🛍️</span>
      <span class="nav-label">Produits</span>
    </button>
    
    <button 
      @click="$emit('navigate', 'cart')"
      :class="['nav-btn', { active: currentView === 'cart' }]"
    >
      <span class="nav-icon">
        🛒
        <span v-if="cartCount > 0" class="cart-badge">{{ cartCount }}</span>
      </span>
      <span class="nav-label">Panier</span>
    </button>
  </nav>
</template>

<script>
export default {
  name: 'BottomNav',
  props: {
    currentView: {
      type: String,
      required: true
    },
    cartCount: {
      type: Number,
      default: 0
    }
  },
  emits: ['navigate']
}
</script>

<style scoped>
.bottom-nav {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  background: white;
  border-top: 1px solid #eee;
  display: flex;
  padding: 0.5rem 0;
  z-index: 100;
  box-shadow: 0 -2px 10px rgba(0,0,0,0.1);
}

.nav-btn {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.25rem;
  background: none;
  border: none;
  padding: 0.5rem;
  cursor: pointer;
  transition: all 0.2s ease;
  color: #666;
}

.nav-btn.active {
  color: #667eea;
}

.nav-btn:hover {
  background: #f8f9fa;
}

.nav-icon {
  font-size: 1.5rem;
  position: relative;
}

.nav-label {
  font-size: 0.8rem;
  font-weight: 500;
}

.cart-badge {
  position: absolute;
  top: -8px;
  right: -8px;
  background: #ff4757;
  color: white;
  border-radius: 50%;
  width: 20px;
  height: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 0.7rem;
  font-weight: bold;
}
</style>
