#!/bin/bash

echo "🧪 Script de test complet pour la Mini App Telegram"
echo "=================================================="

# Couleurs pour les messages
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fonction pour les tests
test_step() {
    echo -e "${YELLOW}🔍 Test: $1${NC}"
}

success() {
    echo -e "${GREEN}✅ $1${NC}"
}

error() {
    echo -e "${RED}❌ $1${NC}"
}

# Test 1: Vérification de l'environnement Python
test_step "Environnement virtuel Python"
if [ -d "venv" ]; then
    success "Environnement virtuel trouvé"
else
    error "Environnement virtuel manquant"
    echo "Exécutez: python3 -m venv venv"
fi

# Test 2: Vérification des dépendances Python
test_step "Dépendances Python"
source venv/bin/activate
if pip list | grep -q "python-telegram-bot"; then
    success "python-telegram-bot installé"
else
    error "python-telegram-bot manquant"
fi

if pip list | grep -q "python-dotenv"; then
    success "python-dotenv installé"
else
    error "python-dotenv manquant"
fi

# Test 3: Vérification du fichier .env
test_step "Configuration .env"
if [ -f ".env" ]; then
    success "Fichier .env trouvé"
    if grep -q "TELEGRAM_BOT_TOKEN=votre_token_ici" .env; then
        error "Token Telegram non configuré"
        echo "Configurez votre token dans .env"
    else
        success "Token Telegram configuré"
    fi
    
    if grep -q "MINI_APP_URL=https://votre-mini-app.com" .env; then
        error "URL Mini App non configurée"
        echo "Configurez l'URL Vercel dans .env"
    else
        success "URL Mini App configurée"
    fi
else
    error "Fichier .env manquant"
fi

# Test 4: Vérification de Node.js et npm
test_step "Environnement Node.js"
cd web
if [ -d "node_modules" ]; then
    success "Dépendances Node.js installées"
else
    error "Dépendances Node.js manquantes"
    echo "Exécutez: npm install"
fi

# Test 5: Test de build Vue.js
test_step "Build Vue.js"
if npm run build > /dev/null 2>&1; then
    success "Build Vue.js réussi"
else
    error "Erreur de build Vue.js"
fi

# Test 6: Vérification des fichiers critiques
cd ..
test_step "Fichiers critiques"
critical_files=("telegram_bot.py" "web/src/App.vue" "web/index.html" "vercel.json")

for file in "${critical_files[@]}"; do
    if [ -f "$file" ]; then
        success "$file présent"
    else
        error "$file manquant"
    fi
done

# Test 7: Syntaxe Python
test_step "Syntaxe Python"
if python -m py_compile telegram_bot.py; then
    success "Syntaxe Python correcte"
else
    error "Erreur de syntaxe Python"
fi

echo
echo "=================================================="
echo -e "${YELLOW}🎯 Résumé des tests terminé${NC}"
echo
echo "📋 Prochaines étapes :"
echo "1. Configurez votre token dans .env"
echo "2. Déployez sur Vercel avec ./deploy_vercel.sh"
echo "3. Mettez à jour l'URL dans .env"
echo "4. Lancez le bot avec ./start_bot.sh"
echo "5. Testez avec @BotFather sur Telegram"
