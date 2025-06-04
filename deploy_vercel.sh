#!/bin/bash

echo "🚀 Déploiement de la Mini App sur Vercel..."

# Aller dans le dossier web
cd web

# Build de l'application
echo "📦 Construction de l'application..."
npm run build

# Déploiement sur Vercel
echo "🌐 Déploiement sur Vercel..."
vercel --prod

echo "✅ Déploiement terminé!"
echo "💡 N'oubliez pas de mettre à jour l'URL dans le fichier .env"
