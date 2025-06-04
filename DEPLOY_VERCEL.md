# Déploiement sur Vercel

## 🚀 Déploiement automatique

### Prérequis
1. Créer un compte sur [Vercel](https://vercel.com)
2. Installer Vercel CLI : `npm install -g vercel`

### Méthode 1 : Script automatique
```bash
./deploy_vercel.sh
```

### Méthode 2 : Déploiement manuel
```bash
# Depuis la racine du projet
npm run build
vercel --prod
```

### Méthode 3 : Déploiement via Git (Recommandé)
1. Connectez votre repository GitHub à Vercel
2. Vercel détectera automatiquement votre projet Vue.js
3. Configuration automatique grâce au fichier `vercel.json`

## ⚙️ Configuration

Le fichier `vercel.json` configure automatiquement :
- **Build Command** : `npm run build` (exécute `cd web && npm run build`)
- **Install Command** : `npm run install-web` (exécute `cd web && npm install`)
- **Output Directory** : `web/dist`

## 🔧 Variables d'environnement

Sur Vercel, vous pouvez configurer des variables d'environnement :
1. Allez dans votre projet sur Vercel
2. Settings > Environment Variables
3. Ajoutez vos variables si nécessaire

## 📱 Configuration du Bot Telegram

Une fois déployé sur Vercel :

1. **Récupérez l'URL** de votre application déployée
2. **Mettez à jour le fichier `.env`** :
   ```
   MINI_APP_URL=https://votre-app.vercel.app
   ```
3. **Configurez @BotFather** :
   - `/mybots` → Votre bot → Bot Settings → Menu Button
   - Définissez l'URL de votre mini app

## 🌐 Domaines personnalisés

Vous pouvez configurer un domaine personnalisé sur Vercel :
1. Settings > Domains
2. Ajoutez votre domaine
3. Mettez à jour l'URL dans votre bot

## 🔄 Mises à jour automatiques

Avec Git connected :
- Chaque push sur `main` redéploie automatiquement
- Preview deployments pour les branches de développement
- Rollback facile depuis l'interface Vercel
