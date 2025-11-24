#!/bin/bash

# ====================================
# Script per Preparare i DMG
# ====================================
#
# Questo script:
# 1. Verifica che i DMG esistano
# 2. Li copia sul Desktop con nomi chiari
# 3. Mostra i link che otterrai su GitHub Releases
#

set -e  # Exit on error

echo "🎙️  Tells me More - Preparazione DMG per GitHub Releases"
echo "============================================================"
echo ""

# Percorsi
APPLE_SILICON_DMG="/Users/alessandrosaladino/Developer/whisper-student/src-tauri/target/release/bundle/dmg/Tells me More_1.0.0_aarch64.dmg"
INTEL_DMG="/Users/alessandrosaladino/Developer/whisper-student-intel/src-tauri/target/release/bundle/dmg/Tells me More_1.0.0_x86_64.dmg"

DESKTOP="$HOME/Desktop"
OUTPUT_APPLE_SILICON="$DESKTOP/Tells_me_More_2.0.0_Apple_Silicon.dmg"
OUTPUT_INTEL="$DESKTOP/Tells_me_More_2.0.0_Intel.dmg"

# ====================================
# Verifica DMG Apple Silicon
# ====================================
echo "📦 Controllo DMG Apple Silicon..."
if [ -f "$APPLE_SILICON_DMG" ]; then
    SIZE=$(du -h "$APPLE_SILICON_DMG" | cut -f1)
    echo "   ✅ Trovato! ($SIZE)"

    # Copia sul Desktop
    echo "   📋 Copiando sul Desktop..."
    cp "$APPLE_SILICON_DMG" "$OUTPUT_APPLE_SILICON"
    echo "   ✅ Copiato: $OUTPUT_APPLE_SILICON"
else
    echo "   ❌ NON TROVATO!"
    echo "   📍 Percorso atteso: $APPLE_SILICON_DMG"
    echo ""
    echo "   💡 Per costruirlo:"
    echo "      cd /Users/alessandrosaladino/Developer/whisper-student"
    echo "      pnpm tauri build"
    echo ""
fi

echo ""

# ====================================
# Verifica DMG Intel
# ====================================
echo "📦 Controllo DMG Intel..."
if [ -f "$INTEL_DMG" ]; then
    SIZE=$(du -h "$INTEL_DMG" | cut -f1)
    echo "   ✅ Trovato! ($SIZE)"

    # Copia sul Desktop
    echo "   📋 Copiando sul Desktop..."
    cp "$INTEL_DMG" "$OUTPUT_INTEL"
    echo "   ✅ Copiato: $OUTPUT_INTEL"
else
    echo "   ⚠️  NON TROVATO!"
    echo "   📍 Percorso atteso: $INTEL_DMG"
    echo ""
    echo "   💡 Per costruirlo:"
    echo "      cd /Users/alessandrosaladino/Developer/whisper-student-intel"
    echo "      pnpm tauri build"
    echo ""
    echo "   ⏱️  Tempo stimato: ~5-10 minuti"
fi

echo ""
echo "============================================================"
echo ""

# ====================================
# Riepilogo
# ====================================
echo "📋 Riepilogo File sul Desktop:"
echo ""

if [ -f "$OUTPUT_APPLE_SILICON" ]; then
    SIZE=$(du -h "$OUTPUT_APPLE_SILICON" | cut -f1)
    echo "   ✅ Tells_me_More_2.0.0_Apple_Silicon.dmg ($SIZE)"
else
    echo "   ⬜ Tells_me_More_2.0.0_Apple_Silicon.dmg (mancante)"
fi

if [ -f "$OUTPUT_INTEL" ]; then
    SIZE=$(du -h "$OUTPUT_INTEL" | cut -f1)
    echo "   ✅ Tells_me_More_2.0.0_Intel.dmg ($SIZE)"
else
    echo "   ⬜ Tells_me_More_2.0.0_Intel.dmg (mancante)"
fi

echo ""

# ====================================
# Istruzioni GitHub Releases
# ====================================
echo "============================================================"
echo "📤 Prossimi Passi - GitHub Releases"
echo "============================================================"
echo ""
echo "1. Vai su: https://github.com/TUO-USERNAME/tells-me-more/releases/new"
echo ""
echo "2. Compila:"
echo "   - Tag: v2.0.0"
echo "   - Title: Tells me More v2.0.0 - Trial Version"
echo ""
echo "3. Trascina i DMG dal Desktop nella sezione 'Attach binaries'"
echo ""
echo "4. Pubblica il Release"
echo ""
echo "5. I link saranno:"
echo ""
echo "   Apple Silicon:"
echo "   https://github.com/TUO-USERNAME/tells-me-more/releases/download/v2.0.0/Tells_me_More_2.0.0_Apple_Silicon.dmg"
echo ""
echo "   Intel:"
echo "   https://github.com/TUO-USERNAME/tells-me-more/releases/download/v2.0.0/Tells_me_More_2.0.0_Intel.dmg"
echo ""
echo "============================================================"
echo ""

# ====================================
# Apri Desktop (opzionale)
# ====================================
read -p "Vuoi aprire il Desktop nel Finder? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    open "$DESKTOP"
    echo "✅ Desktop aperto!"
fi

echo ""
echo "🎉 Fatto! Segui le istruzioni in DEPLOY_GUIDE.md per completare il deploy."
