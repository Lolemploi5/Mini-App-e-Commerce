# Documentation Développeur

## 🏗️ Architecture du projet

### Structure des dossiers
```
Mini-App e-Commerce/
├── telegram_bot.py          # Bot Telegram principal
├── .env                     # Configuration (tokens, URLs)
├── requirements.txt         # Dépendances Python
├── vercel.json             # Configuration Vercel
├── web/                    # Application Vue.js
│   ├── src/
│   │   ├── App.vue         # Composant racine
│   │   ├── main.js         # Point d'entrée
│   │   ├── components/     # Composants Vue
│   │   └── assets/         # Styles et ressources
│   ├── dist/               # Build de production
│   └── package.json        # Dépendances Node.js
└── scripts/                # Scripts utilitaires
```

## 🔧 Technologies utilisées

### Backend (Bot Telegram)
- **Python 3.13+**
- **python-telegram-bot** : API Telegram
- **python-dotenv** : Variables d'environnement
- **logging** : Journalisation

### Frontend (Mini App)
- **Vue.js 3** : Framework progressif
- **Vite** : Build tool moderne
- **CSS3** : Styles responsive
- **Telegram Web App API** : Intégration native

### Déploiement
- **Vercel** : Hébergement de la mini app
- **Git** : Contrôle de version

## 📡 Communication Bot ↔ Mini App

### Flux de données
1. **Bot → Mini App** : Lancement via WebAppInfo
2. **Mini App → Bot** : Données via `sendData()`
3. **Bot** : Traitement et confirmation

### Format des données
```javascript
// Données envoyées par la mini app
{
  "items": [
    {
      "id": 1,
      "name": "iPhone 15 Pro",
      "price": 1199,
      "quantity": 1
    }
  ],
  "total": 1199
}
```

## 🛠️ API Telegram Web App

### Méthodes utilisées
- `Telegram.WebApp.ready()` : Initialisation
- `Telegram.WebApp.expand()` : Expansion plein écran
- `Telegram.WebApp.sendData()` : Envoi de données
- `Telegram.WebApp.initDataUnsafe.user` : Infos utilisateur

### Configuration Bot
```python
# Gestionnaire des données Web App
MessageHandler(filters.StatusUpdate.WEB_APP_DATA, handle_web_app_data)
```

## 🎨 Composants Vue.js

### Composants principaux
- **App.vue** : Logique principale et état
- **Header.vue** : En-tête avec informations utilisateur
- **ProductGrid.vue** : Grille des produits
- **Cart.vue** : Gestion du panier
- **BottomNav.vue** : Navigation inférieure

### Gestion d'état
```javascript
// État réactif avec Composition API
const cartItems = ref([])
const currentView = ref('products')
const user = ref(null)
```

## 🔄 Workflow de développement

### 1. Développement local
```bash
# Terminal 1 : Mini App
./dev_miniapp.sh

# Terminal 2 : Bot (optionnel pour tests)
./start_bot.sh
```

### 2. Tests
```bash
# Test complet du setup
./test_setup.sh

# Build de production
cd web && npm run build
```

### 3. Déploiement
```bash
# Déploiement automatique
./deploy_vercel.sh

# Ou manuellement
cd web && vercel --prod
```

## 🐛 Debugging

### Logs Bot Telegram
```python
# Configuration des logs
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
```

### Console Mini App
```javascript
// Debug dans la console du navigateur
console.log('Telegram WebApp:', window.Telegram?.WebApp)
```

### Variables d'environnement
```bash
# Vérification des variables
echo $TELEGRAM_BOT_TOKEN
echo $MINI_APP_URL
```

## 🔐 Sécurité

### Bonnes pratiques
- ✅ Token bot dans `.env` (non versionné)
- ✅ Validation des données côté bot
- ✅ HTTPS obligatoire pour la mini app
- ✅ Sanitisation des inputs utilisateur

### Validation des données
```python
try:
    order_data = json.loads(web_app_data)
    # Validation des champs requis
    if not order_data.get('items'):
        raise ValueError("Items manquants")
except (json.JSONDecodeError, ValueError) as e:
    logger.error(f"Données invalides: {e}")
```

## 📈 Performance

### Optimisations Vue.js
- Build de production minifié
- Lazy loading des composants
- Optimisation des images (emojis)

### Optimisations Bot
- Gestion asynchrone
- Logging approprié
- Gestion d'erreurs robuste

## 🚀 Extensions possibles

### Base de données
```python
# Exemple avec SQLite/PostgreSQL
import sqlite3

def save_order(user_id, order_data):
    # Sauvegarder la commande
    pass
```

### Authentification avancée
```javascript
// Validation signature Telegram
const isValidData = validateTelegramData(initData)
```

### Notifications push
```python
# Notifications via Bot API
await context.bot.send_message(
    chat_id=user_id,
    text="Votre commande est prête! 🎉"
)
```
