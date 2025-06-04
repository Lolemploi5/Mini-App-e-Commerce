<template>
  <header class="header">
    <div class="header-content">
      <h1 class="logo">🛍️ Shop</h1>
      <div v-if="user" class="user-info">
        <span class="user-name">Salut {{ user.first_name }}! 👋</span>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: 'Header',
  props: {
    user: {
      type: Object,
      default: null
    }
  }
}
</script>

<style scoped>
.header {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 1rem 0;
  position: sticky;
  top: 0;
  z-index: 100;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.header-content {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-size: 1.5rem;
  font-weight: bold;
  margin: 0;
}

.user-name {
  font-size: 0.9rem;
  opacity: 0.9;
}
</style>
