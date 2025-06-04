#!/bin/bash

# Script pour démarrer le bot Telegram avec l'environnement virtuel

echo "🔄 Activation de l'environnement virtuel..."
source venv/bin/activate

echo "✅ Environnement virtuel activé"
echo "🚀 Démarrage du bot Telegram..."

python telegram_bot.py
