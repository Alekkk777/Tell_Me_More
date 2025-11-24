#!/bin/bash

# ====================================
# Script per Deploy su Vercel
# ====================================
#
# Questo script:
# 1. Verifica se Vercel CLI è installata
# 2. La installa se necessario
# 3. Fa il deploy del sito
#

set -e

echo "🚀 Deploy Tells me More su Vercel"
echo "============================================================"
echo ""

# ====================================
# Verifica Vercel CLI
# ====================================
echo "🔍 Verifico installazione Vercel CLI..."

if command -v vercel &> /dev/null; then
    echo "   ✅ Vercel CLI già installata!"
    VERCEL_VERSION=$(vercel --version)
    echo "   📦 Versione: $VERCEL_VERSION"
else
    echo "   ⚠️  Vercel CLI non trovata"
    echo ""
    read -p "Vuoi installarla ora? (y/n) " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "📦 Installando Vercel CLI..."
        npm install -g vercel
        echo "   ✅ Installazione completata!"
    else
        echo "❌ Vercel CLI è necessaria per il deploy"
        echo ""
        echo "Per installarla manualmente:"
        echo "   npm install -g vercel"
        exit 1
    fi
fi

echo ""

# ====================================
# Verifica Git Repository
# ====================================
echo "🔍 Verifico Git repository..."

if [ -d ".git" ]; then
    echo "   ✅ Repository Git trovato"

    # Verifica se ci sono modifiche non committate
    if [[ -n $(git status -s) ]]; then
        echo "   ⚠️  Ci sono modifiche non committate"
        echo ""
        git status -s
        echo ""
        read -p "Vuoi committare le modifiche prima del deploy? (y/n) " -n 1 -r
        echo

        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "📝 Inserisci il messaggio di commit:"
            read COMMIT_MSG
            git add .
            git commit -m "$COMMIT_MSG"
            echo "   ✅ Commit creato!"

            # Push se c'è un remote
            if git remote | grep -q "origin"; then
                echo "📤 Pushing su GitHub..."
                git push
                echo "   ✅ Push completato!"
            fi
        fi
    else
        echo "   ✅ Nessuna modifica da committare"
    fi
else
    echo "   ⚠️  Nessun repository Git trovato"
    echo ""
    read -p "Vuoi inizializzare un repository Git? (y/n) " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git init
        git add .
        git commit -m "Initial commit: Tells me More website"
        echo "   ✅ Repository Git inizializzato!"
    fi
fi

echo ""

# ====================================
# Deploy
# ====================================
echo "============================================================"
echo "🚀 Inizio Deploy su Vercel"
echo "============================================================"
echo ""

# Chiedi se è il primo deploy o un aggiornamento
read -p "È il primo deploy? (y/n) " -n 1 -r
echo
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "📦 Primo deploy - Seguirai il wizard di configurazione..."
    echo ""
    echo "Durante la configurazione:"
    echo "  - Set up and deploy? → Y"
    echo "  - Which scope? → Scegli il tuo account"
    echo "  - Link to existing project? → N"
    echo "  - Project name? → tells-me-more (o quello che preferisci)"
    echo "  - In which directory? → ./"
    echo "  - Want to override settings? → N"
    echo ""
    read -p "Premi Invio per continuare..."
    echo ""

    # Primo deploy
    vercel

else
    echo "📦 Deploy in produzione..."
    echo ""

    # Deploy in produzione
    vercel --prod
fi

echo ""
echo "============================================================"
echo "✅ Deploy Completato!"
echo "============================================================"
echo ""
echo "🌐 Il tuo sito è online!"
echo ""
echo "📋 Prossimi passi:"
echo ""
echo "1. Apri il link fornito da Vercel per vedere il sito"
echo "2. Testa i download dei DMG"
echo "3. Testa il link al sondaggio"
echo "4. (Opzionale) Configura un custom domain su Vercel Dashboard"
echo ""
echo "============================================================"
echo ""
echo "💡 Comandi utili:"
echo ""
echo "  vercel                  # Deploy in preview"
echo "  vercel --prod           # Deploy in produzione"
echo "  vercel ls               # Lista deploy"
echo "  vercel domains          # Gestisci domini"
echo "  vercel inspect [url]    # Ispeziona un deploy"
echo ""
echo "🎉 Buon lavoro!"
