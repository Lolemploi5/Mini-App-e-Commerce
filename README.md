# 🤖 Bot Telegram avec Mini App Vue.js

Bot Telegram simple avec une mini application Vue.js qui affiche un message de bienvenue personnalisé avec le nom de l'utilisateur.

## 🚀 Démo en ligne

- **Mini App**: https://mini-app-e-commerce-3gz4d4d8a-lolemplois-projects.vercel.app/
- **Bot Telegram**: Recherchez votre bot dans Telegram et envoyez `/start`

## ✨ Fonctionnalités

- 🤖 Bot Telegram avec commande `/start`
- 📱 Mini App Vue.js moderne et responsive
- 👤 Affichage personnalisé du nom d'utilisateur Telegram
- 🎨 Interface élégante avec animations
- ☁️ Déployé automatiquement sur Vercel

## 🛠️ Installation

### 1. Cloner le projet
```bash
git clone <votre-repo>
cd Mini-App-e-Commerce
```

### 2. Installer les dépendances Python
```bash
python -m venv venv
source venv/bin/activate  # Sur Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Installer les dépendances Vue.js
```bash
cd web
npm install
cd ..
```

### 4. Configuration
Créez un fichier `.env` avec vos informations :
```bash
# Token du bot Telegram (obtenez-le depuis @BotFather)
TELEGRAM_BOT_TOKEN=votre_token_ici

# URL de votre mini app
MINI_APP_URL=https://votre-app.vercel.app/
```

## 🚀 Déploiement

### Déployer sur Vercel
```bash
# Installer Vercel CLI
npm install -g vercel

# Se connecter à Vercel
vercel login

# Déployer
vercel --prod
```

### Démarrer le bot
```bash
python telegram_bot.py
```

## 📁 Structure du projet

```
Mini-App e-Commerce/
├── telegram_bot.py          # Bot Telegram principal
├── .env                     # Configuration
├── requirements.txt         # Dépendances Python
├── package.json            # Configuration npm racine
├── vercel.json             # Configuration Vercel
└── web/                    # Application Vue.js
    ├── src/
    │   ├── App.vue         # Interface principale
    │   ├── main.js         # Point d'entrée Vue.js
    │   └── assets/
    ├── package.json        # Dépendances Vue.js
    └── vite.config.js      # Configuration Vite
```

## 🔧 Technologies utilisées

- **Backend**: Python, python-telegram-bot
- **Frontend**: Vue.js 3, Vite
- **Déploiement**: Vercel
- **API**: Telegram Bot API

## 📱 Comment utiliser

1. **Démarrer le bot** : Exécutez `python telegram_bot.py`
2. **Ouvrir Telegram** : Cherchez votre bot
3. **Envoyer `/start`** : Le bot répond avec un bouton "Ouvrir Mini App"
4. **Cliquer sur le bouton** : La mini app s'ouvre dans Telegram
5. **Voir l'interface** : Message de bienvenue avec votre nom

## 🎨 Interface

L'interface affiche :
- 👋 Message de bienvenue
- 👤 Nom et prénom de l'utilisateur Telegram
- 📱 Design moderne et responsive
- ✨ Animations fluides

## 🔧 Développement

### Mode développement
```bash
# Terminal 1: Démarrer le bot
python telegram_bot.py

# Terminal 2: Démarrer l'app Vue.js
cd web
npm run dev
```

### Build de production
```bash
cd web
npm run build
```

## 📝 Configuration Telegram

1. Créez un bot avec [@BotFather](https://t.me/BotFather)
2. Copiez le token dans votre fichier `.env`
3. Configurez l'URL de votre mini app après déploiement

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à ouvrir une issue ou une pull request.

## 📄 Licence

Ce projet est sous licence MIT.
