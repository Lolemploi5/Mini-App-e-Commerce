# Bot Telegram Mini App E-Commerce

Un bot Telegram simple avec une mini app e-commerce intégrée.

## 🚀 Démarrage rapide

1. **Cloner le projet** et naviguer dans le dossier :
```bash
cd "Mini-App e-Commerce"
```

2. **Créer l'environnement virtuel** :
```bash
python3 -m venv venv
source venv/bin/activate  # macOS/Linux
```

3. **Installer les dépendances** :
```bash
pip install -r requirements.txt
```

4. **Développer la mini app** (Vue.js) :
```bash
# Démarrer le serveur de développement
./dev_miniapp.sh
# Ou manuellement : cd web && npm run dev
```

5. **Déployer sur Vercel** :
```bash
# Déploiement automatique
./deploy_vercel.sh
# Voir DEPLOY_VERCEL.md pour plus d'options
```

6. **Configurer le bot** :
   - Créez un bot avec @BotFather sur Telegram
   - Copiez votre token dans le fichier `.env`
   - Mettez à jour l'URL Vercel dans `.env`

7. **Lancer le bot** :
```bash
# Option simple avec le script
./start_bot.sh

# Ou manuellement
source venv/bin/activate
python telegram_bot.py
```

## 📁 Structure du projet

- `telegram_bot.py` - Bot Telegram principal
- `web/` - Mini app Vue.js e-commerce
  - `src/App.vue` - Composant principal
  - `src/components/` - Composants Vue
  - `dist/` - Build de production
- `.env` - Configuration (token, URL)
- `requirements.txt` - Dépendances Python
- `start_bot.sh` - Script de lancement du bot
- `deploy_vercel.sh` - Script de déploiement

## 🔧 Configuration

Voir le fichier `CONFIG.md` pour les instructions détaillées.

## ✨ Fonctionnalités

### Bot Telegram
- Commande `/start` avec bouton Mini App
- Commande `/help` pour l'aide
- Commande `/miniapp` pour lancer directement la mini app

### Mini App Vue.js
- Interface e-commerce moderne et responsive
- Gestion du panier en temps réel
- Integration avec l'API Telegram Web App
- Animations et transitions fluides
- Compatible mobile et desktop
