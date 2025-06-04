#!/bin/bash

# Script pour développer et tester la mini app Vue.js

echo "🔄 Navigation vers le dossier web..."
cd "/Users/lolemploi/Projects/Mini-App e-Commerce/web"

# Installer les dépendances si nécessaire
if [ ! -d "node_modules" ]; then
    echo "📦 Installation des dépendances..."
    npm install
fi

echo "✅ Démarrage du serveur de développement Vue.js..."
echo "📱 Ouvrez http://localhost:5173 pour tester la mini app"
echo "🛑 Appuyez sur Ctrl+C pour arrêter le serveur"

npm run dev
