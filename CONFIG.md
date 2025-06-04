# Configuration du Bot Telegram Mini App

## Prérequis

1. **Créer un bot Telegram** :
   - Contactez @BotFather sur Telegram
   - Utilisez `/newbot` pour créer un nouveau bot
   - Notez le token que vous recevez

2. **Héberger la mini app** :
   - Hébergez le fichier `mini_app.html` sur un serveur HTTPS
   - Ou utilisez des services comme GitHub Pages, Netlify, Vercel

## Installation

1. **Créer et activer l'environnement virtuel** :
```bash
# Créer l'environnement virtuel
python3 -m venv venv

# Activer l'environnement virtuel
source venv/bin/activate  # Sur macOS/Linux
# ou sur Windows : venv\Scripts\activate
```

2. **Installer les dépendances Python** :
```bash
pip install -r requirements.txt
```

2. Configurez le fichier `.env` :
   - Remplacez `votre_token_ici` par votre token de bot Telegram
   - Remplacez l'URL de la mini app par l'URL réelle où vous hébergez `mini_app.html`

## Configuration du Bot

1. **Activer les Mini Apps** :
   - Contactez @BotFather sur Telegram
   - Utilisez `/mybots`
   - Sélectionnez votre bot
   - Allez dans "Bot Settings" > "Menu Button"
   - Configurez l'URL de votre mini app

2. **Domaines autorisés** :
   - Utilisez `/setdomain` avec @BotFather
   - Ajoutez le domaine où votre mini app est hébergée

## Lancement

### Option 1 : Avec le script automatique
```bash
# Le script active automatiquement l'environnement virtuel et lance le bot
./start_bot.sh
```

### Option 2 : Manuellement
```bash
# Activer l'environnement virtuel
source venv/bin/activate

# Lancer le bot
python telegram_bot.py
```

## Fonctionnalités

- **Commande /start** : Affiche le message de bienvenue avec le bouton Mini App
- **Commande /help** : Affiche l'aide
- **Commande /miniapp** : Lance directement la mini app
- **Bouton Mini App** : Ouvre la mini app dans Telegram

## Structure des fichiers

- `telegram_bot.py` : Code principal du bot
- `mini_app.html` : Interface de la mini app (à héberger)
- `.env` : Variables d'environnement (token, URLs)
- `requirements.txt` : Dépendances Python
