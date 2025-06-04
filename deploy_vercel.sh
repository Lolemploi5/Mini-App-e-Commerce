#!/bin/bash

echo "🚀 Déploiement de la Mini App sur Vercel..."

# Build de l'application depuis la racine
echo "📦 Construction de l'application..."
npm run build

# Déploiement sur Vercel
echo "🌐 Déploiement sur Vercel..."
vercel --prod

echo "✅ Déploiement terminé!"
echo "💡 N'oubliez pas de mettre à jour l'URL dans le fichier .env"
