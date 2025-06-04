#!/usr/bin/env python3
"""
Bot Telegram avec Mini App
Ce bot permet de lancer une mini app Telegram via un bouton.
"""

import os
import logging
import json
from datetime import datetime
from dotenv import load_dotenv
from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup, WebAppInfo
from telegram.ext import Application, CommandHandler, ContextTypes, MessageHandler, filters

# Charger les variables d'environnement
load_dotenv()

# Configuration du logging
logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    level=logging.INFO
)
logger = logging.getLogger(__name__)

# Token du bot et URL de la mini app
BOT_TOKEN = os.getenv('TELEGRAM_BOT_TOKEN')
MINI_APP_URL = os.getenv('MINI_APP_URL')

if not BOT_TOKEN:
    raise ValueError("TELEGRAM_BOT_TOKEN n'est pas défini dans le fichier .env")

if not MINI_APP_URL:
    raise ValueError("MINI_APP_URL n'est pas défini dans le fichier .env")


async def start(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """Commande /start - Affiche le message de bienvenue avec le bouton Mini App"""
    user = update.effective_user
    
    # Créer le bouton pour lancer la mini app
    keyboard = [
        [InlineKeyboardButton(
            "🚀 Lancer la Mini App", 
            web_app=WebAppInfo(url=MINI_APP_URL)
        )]
    ]
    reply_markup = InlineKeyboardMarkup(keyboard)
    
    welcome_message = f"""
🎉 Bienvenue {user.first_name} !

Cliquez sur le bouton ci-dessous pour lancer notre mini app e-commerce :
    """
    
    await update.message.reply_text(
        welcome_message,
        reply_markup=reply_markup
    )


async def help_command(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """Commande /help - Affiche l'aide"""
    help_text = """
🤖 Commandes disponibles :

/start - Lancer le bot et accéder à la mini app
/help - Afficher cette aide
/miniapp - Lancer directement la mini app

Pour utiliser la mini app, cliquez simplement sur le bouton "🚀 Lancer la Mini App" !
    """
    
    await update.message.reply_text(help_text)


async def miniapp_command(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """Commande /miniapp - Lance directement la mini app"""
    keyboard = [
        [InlineKeyboardButton(
            "🛒 Ouvrir l'e-Commerce", 
            web_app=WebAppInfo(url=MINI_APP_URL)
        )]
    ]
    reply_markup = InlineKeyboardMarkup(keyboard)
    
    await update.message.reply_text(
        "🛍️ Cliquez pour accéder à notre boutique en ligne :",
        reply_markup=reply_markup
    )


async def handle_web_app_data(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    """Gestionnaire pour les données reçues de la mini app"""
    try:
        # Récupérer les données de la mini app
        web_app_data = update.message.web_app_data.data
        user = update.effective_user
        
        # Parser les données JSON
        order_data = json.loads(web_app_data)
        
        # Traiter la commande
        items = order_data.get('items', [])
        total = order_data.get('total', 0)
        
        if not items:
            await update.message.reply_text("❌ Commande vide reçue.")
            return
        
        # Créer le message de confirmation
        order_summary = f"🎉 Commande reçue de {user.first_name}!\n\n"
        order_summary += "📦 Articles commandés :\n"
        
        for item in items:
            order_summary += f"• {item['name']} x{item['quantity']} - {item['price']}€\n"
        
        order_summary += f"\n💰 Total : {total}€"
        order_summary += f"\n📅 Date : {datetime.now().strftime('%d/%m/%Y %H:%M')}"
        order_summary += f"\n👤 Client : {user.first_name} ({user.id})"
        
        # Envoyer la confirmation
        await update.message.reply_text(order_summary)
        
        # Log pour le développement
        logger.info(f"Commande reçue de {user.first_name} ({user.id}): {total}€")
        
    except json.JSONDecodeError:
        await update.message.reply_text("❌ Erreur dans les données de commande.")
        logger.error("Erreur de parsing JSON des données web app")
    except Exception as e:
        await update.message.reply_text("❌ Erreur lors du traitement de la commande.")
        logger.error(f"Erreur dans handle_web_app_data: {e}")


def main() -> None:
    """Fonction principale pour démarrer le bot"""
    # Créer l'application
    application = Application.builder().token(BOT_TOKEN).build()
    
    # Ajouter les gestionnaires de commandes
    application.add_handler(CommandHandler("start", start))
    application.add_handler(CommandHandler("help", help_command))
    application.add_handler(CommandHandler("miniapp", miniapp_command))
    
    # Ajouter le gestionnaire pour les données de la mini app
    application.add_handler(MessageHandler(filters.StatusUpdate.WEB_APP_DATA, handle_web_app_data))
    
    # Démarrer le bot
    logger.info("Démarrage du bot...")
    application.run_polling(allowed_updates=Update.ALL_TYPES)


if __name__ == '__main__':
    main()
