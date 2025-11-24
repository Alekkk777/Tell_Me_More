#!/bin/bash

# ====================================
# Script per Aggiornare i Link Download
# ====================================
#
# Questo script aggiorna automaticamente i link
# in script.js con i tuoi link GitHub Releases
#

set -e

echo "🔗 Aggiorna Link Download - Tells me More"
echo "============================================================"
echo ""

# Chiedi username GitHub
echo "📝 Inserisci il tuo username GitHub:"
read -p "Username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ Errore: Username vuoto"
    exit 1
fi

# Chiedi nome repository
echo ""
echo "📝 Inserisci il nome del repository (default: tells-me-more):"
read -p "Repository: " GITHUB_REPO
GITHUB_REPO=${GITHUB_REPO:-tells-me-more}

# Costruisci i link
APPLE_SILICON_LINK="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPO}/releases/download/v2.0.0/Tells_me_More_2.0.0_Apple_Silicon.dmg"
INTEL_LINK="https://github.com/${GITHUB_USERNAME}/${GITHUB_REPO}/releases/download/v2.0.0/Tells_me_More_2.0.0_Intel.dmg"

echo ""
echo "============================================================"
echo "📦 Link Generati:"
echo "============================================================"
echo ""
echo "Apple Silicon:"
echo "$APPLE_SILICON_LINK"
echo ""
echo "Intel:"
echo "$INTEL_LINK"
echo ""
echo "============================================================"
echo ""

# Chiedi conferma
read -p "Vuoi aggiornare script.js con questi link? (y/n) " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Operazione annullata"
    exit 0
fi

# Backup del file originale
echo "💾 Creando backup..."
cp script.js script.js.backup
echo "✅ Backup creato: script.js.backup"

# Aggiorna i link in script.js
echo ""
echo "✏️  Aggiornando script.js..."

# Usa sed per sostituire i link (compatibile macOS)
sed -i '' "s|appleSilicon: '.*'|appleSilicon: '$APPLE_SILICON_LINK'|g" script.js
sed -i '' "s|intel: '.*'|intel: '$INTEL_LINK'|g" script.js

# Decommenta le righe di window.location.href
# Cerca la riga con "window.location.href = DOWNLOAD_LINKS.appleSilicon"
# e rimuovi il commento "//" se presente

echo "✅ Link aggiornati!"
echo ""

# Mostra le modifiche
echo "============================================================"
echo "📝 Modifiche Applicate:"
echo "============================================================"
echo ""
echo "DOWNLOAD_LINKS = {"
echo "  appleSilicon: '$APPLE_SILICON_LINK',"
echo "  intel: '$INTEL_LINK'"
echo "}"
echo ""
echo "============================================================"
echo ""
echo "⚠️  IMPORTANTE: Ora devi decommentare manualmente le righe"
echo "   in script.js che contengono:"
echo ""
echo "   window.location.href = DOWNLOAD_LINKS.appleSilicon;"
echo "   window.location.href = DOWNLOAD_LINKS.intel;"
echo ""
echo "   e commentare/rimuovere gli alert()."
echo ""
echo "============================================================"
echo ""
echo "✅ Fatto! Controlla script.js e poi esegui:"
echo "   git add script.js"
echo "   git commit -m 'Update download links'"
echo "   git push"
