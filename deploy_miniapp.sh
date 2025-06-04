#!/bin/bash

# Script pour déployer la mini app sur GitHub Pages

echo "🔄 Construction de la mini app pour la production..."
cd "/Users/lolemploi/Projects/Mini-App e-Commerce/web"

# Build de production
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build réussi!"
    echo "📁 Les fichiers sont dans le dossier web/dist/"
    echo ""
    echo "🚀 Pour déployer sur GitHub Pages:"
    echo "1. Copiez tout le contenu du dossier 'web/dist/' vers votre repository GitHub Pages"
    echo "2. Ou utilisez GitHub Actions pour automatiser le déploiement"
    echo ""
    echo "📋 Commandes Git suggérées:"
    echo "   git add web/dist/"
    echo "   git commit -m 'Deploy mini app'"
    echo "   git push origin main"
    echo ""
    echo "🌐 Votre mini app sera disponible à:"
    echo "   https://votre-username.github.io/votre-repo/"
else
    echo "❌ Erreur lors du build"
fi
