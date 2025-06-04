<template>
  <div class="cart">
    <div v-if="items.length === 0" class="empty-cart">
      <div class="empty-icon">🛒</div>
      <h3>Votre panier est vide</h3>
      <p>Ajoutez des produits pour commencer vos achats!</p>
    </div>
    
    <div v-else>
      <div class="cart-items">
        <div 
          v-for="item in items" 
          :key="item.id"
          class="cart-item"
        >
          <div class="item-image">{{ item.image }}</div>
          <div class="item-details">
            <h4 class="item-name">{{ item.name }}</h4>
            <p class="item-price">{{ item.price }}€</p>
          </div>
          <div class="item-controls">
            <div class="quantity-controls">
              <button 
                @click="updateQuantity(item.id, item.quantity - 1)"
                :disabled="item.quantity <= 1"
                class="qty-btn"
              >
                -
              </button>
              <span class="quantity">{{ item.quantity }}</span>
              <button 
                @click="updateQuantity(item.id, item.quantity + 1)"
                class="qty-btn"
              >
                +
              </button>
            </div>
            <button 
              @click="$emit('remove-item', item.id)"
              class="remove-btn"
            >
              🗑️
            </button>
          </div>
        </div>
      </div>
      
      <div class="cart-summary">
        <div class="total">
          <span class="total-label">Total:</span>
          <span class="total-amount">{{ total }}€</span>
        </div>
        <button 
          @click="$emit('checkout')"
          class="checkout-btn"
        >
          Commander maintenant 🚀
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Cart',
  props: {
    items: {
      type: Array,
      required: true
    },
    total: {
      type: Number,
      required: true
    }
  },
  emits: ['update-quantity', 'remove-item', 'checkout'],
  
  methods: {
    updateQuantity(id, quantity) {
      if (quantity > 0) {
        this.$emit('update-quantity', id, quantity)
      }
    }
  }
}
</script>

<style scoped>
.cart {
  padding: 1rem 0;
}

.empty-cart {
  text-align: center;
  padding: 3rem 1rem;
  color: #666;
}

.empty-icon {
  font-size: 4rem;
  margin-bottom: 1rem;
}

.empty-cart h3 {
  margin: 0 0 0.5rem 0;
  color: #333;
}

.cart-items {
  margin-bottom: 2rem;
}

.cart-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1rem;
  background: white;
  border-radius: 12px;
  margin-bottom: 1rem;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.item-image {
  font-size: 2rem;
  min-width: 60px;
  text-align: center;
}

.item-details {
  flex: 1;
}

.item-name {
  margin: 0 0 0.25rem 0;
  font-size: 1rem;
  font-weight: 600;
  color: #333;
}

.item-price {
  margin: 0;
  color: #667eea;
  font-weight: 600;
}

.item-controls {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  align-items: center;
}

.quantity-controls {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  background: #f8f9fa;
  border-radius: 20px;
  padding: 0.25rem;
}

.qty-btn {
  width: 30px;
  height: 30px;
  border: none;
  border-radius: 50%;
  background: #667eea;
  color: white;
  cursor: pointer;
  font-weight: bold;
  transition: all 0.2s ease;
}

.qty-btn:hover:not(:disabled) {
  background: #5a6fd8;
  transform: scale(1.1);
}

.qty-btn:disabled {
  background: #ccc;
  cursor: not-allowed;
}

.quantity {
  min-width: 30px;
  text-align: center;
  font-weight: 600;
}

.remove-btn {
  background: none;
  border: none;
  font-size: 1.2rem;
  cursor: pointer;
  padding: 0.25rem;
  border-radius: 4px;
  transition: background 0.2s ease;
}

.remove-btn:hover {
  background: #fee;
}

.cart-summary {
  background: white;
  padding: 1.5rem;
  border-radius: 16px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

.total {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1.5rem;
  font-size: 1.2rem;
}

.total-label {
  font-weight: 600;
  color: #333;
}

.total-amount {
  font-weight: bold;
  font-size: 1.5rem;
  color: #667eea;
}

.checkout-btn {
  width: 100%;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border: none;
  padding: 1rem;
  border-radius: 12px;
  font-size: 1.1rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.checkout-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
}

.checkout-btn:active {
  transform: translateY(0);
}
</style>
