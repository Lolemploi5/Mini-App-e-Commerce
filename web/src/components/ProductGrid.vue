<template>
  <div class="product-grid">
    <div 
      v-for="product in products" 
      :key="product.id"
      class="product-card"
    >
      <div class="product-image">{{ product.image }}</div>
      <div class="product-info">
        <h3 class="product-name">{{ product.name }}</h3>
        <p class="product-description">{{ product.description }}</p>
        <div class="product-footer">
          <span class="product-price">{{ product.price }}€</span>
          <button 
            @click="$emit('add-to-cart', product)"
            class="add-btn"
          >
            Ajouter +
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ProductGrid',
  props: {
    products: {
      type: Array,
      required: true
    }
  },
  emits: ['add-to-cart']
}
</script>

<style scoped>
.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
  padding: 1rem 0;
}

.product-card {
  background: white;
  border-radius: 16px;
  padding: 1.5rem;
  box-shadow: 0 4px 20px rgba(0,0,0,0.08);
  transition: all 0.3s ease;
  border: 1px solid #f0f0f0;
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 30px rgba(0,0,0,0.12);
}

.product-image {
  font-size: 3rem;
  text-align: center;
  margin-bottom: 1rem;
}

.product-info {
  text-align: center;
}

.product-name {
  font-size: 1.2rem;
  font-weight: 600;
  margin: 0 0 0.5rem 0;
  color: #333;
}

.product-description {
  color: #666;
  font-size: 0.9rem;
  margin: 0 0 1rem 0;
  line-height: 1.4;
}

.product-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.product-price {
  font-size: 1.3rem;
  font-weight: bold;
  color: #667eea;
}

.add-btn {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border: none;
  padding: 0.7rem 1.2rem;
  border-radius: 25px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 0.9rem;
}

.add-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
}

.add-btn:active {
  transform: translateY(0);
}
</style>
