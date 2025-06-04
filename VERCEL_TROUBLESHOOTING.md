# 🔧 Guide de Dépannage Vercel

## ✅ Problème résolu : ENOENT package.json

### ❌ Erreur précédente
```
npm error path /vercel/path0/package.json
npm error errno -2
npm error enoent Could not read package.json
```

### ✅ Solution appliquée
1. **Ajout d'un `package.json` racine** pour Vercel
2. **Configuration `vercel.json` mise à jour** :
   ```json
   {
     "buildCommand": "npm run build",
     "outputDirectory": "web/dist", 
     "installCommand": "npm run install-web"
   }
   ```
3. **Scripts npm configurés** pour gérer le sous-dossier `web/`

## 🛠️ Structure finale
```
Mini-App e-Commerce/
├── package.json          # ← Nouveau : Configuration racine pour Vercel
├── vercel.json           # ← Mis à jour : Scripts corrects
├── .vercelignore         # ← Nouveau : Optimisation déploiement
└── web/
    ├── package.json      # Configuration Vue.js
    ├── src/              # Code source Vue.js
    └── dist/             # Build de production
```

## ✅ Validation

### Test en local
```bash
# Test des scripts depuis la racine
npm run install-web  # ✅ Installe les dépendances web
npm run build        # ✅ Build l'application Vue.js
npm run dev          # ✅ Lance le serveur de développement
```

### Déploiement
```bash
# Option 1: Script automatique
./deploy_vercel.sh

# Option 2: Manuel
npm run build
vercel --prod
```

## 🎯 Bonnes pratiques

### 1. Structure monorepo
- `package.json` racine pour Vercel
- `web/package.json` pour Vue.js
- Scripts qui naviguent dans les bons dossiers

### 2. Optimisation Vercel
- `.vercelignore` exclut les fichiers Python
- Seuls les fichiers web sont déployés
- Build optimisé pour la production

### 3. Debugging
```bash
# Vérifier la structure
ls -la
ls -la web/

# Tester le build
npm run build
ls -la web/dist/

# Vérifier la configuration Vercel
cat vercel.json
```

## 🚀 Résultat

✅ **Vercel peut maintenant** :
- Trouver le `package.json` racine
- Exécuter `npm run install-web` 
- Exécuter `npm run build`
- Déployer depuis `web/dist/`

Le déploiement devrait maintenant fonctionner parfaitement ! 🎉
