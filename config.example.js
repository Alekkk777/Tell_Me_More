// ====================================
// Configurazione Sito Web
// ====================================
//
// ISTRUZIONI:
// 1. Copia questo file come "config.js"
// 2. Modifica i valori qui sotto
// 3. Includi config.js in index.html prima di script.js
// 4. I valori qui sovrascriveranno quelli in script.js
//
// Nota: Aggiungi config.js a .gitignore se contiene info sensibili

const SITE_CONFIG = {
    // Link ai DMG
    downloads: {
        appleSilicon: 'https://tuo-server.com/Tells_me_More_2.0.0_aarch64.dmg',
        intel: 'https://tuo-server.com/Tells_me_More_2.0.0_x86_64.dmg',
        // File size (mostrato nel sito)
        appleSiliconSize: '3.9 MB',
        intelSize: '4.0 MB'
    },

    // Link al sondaggio
    survey: {
        url: 'https://forms.google.com/TUO-SONDAGGIO',
        // Apri in nuova finestra?
        openInNewTab: true
    },

    // Google Analytics (opzionale)
    analytics: {
        enabled: false,
        trackingId: 'G-XXXXXXXXXX'
    },

    // Informazioni app
    app: {
        version: '2.0.0',
        expirationDate: '30/12/2025',
        // Link alla documentazione (se disponibile)
        docsUrl: null,
        // Link al supporto
        supportEmail: 'support@example.com'
    },

    // Personalizzazione UI
    ui: {
        // Abilita animazioni (false per disabilitarle)
        animations: true,
        // Abilita parallax effect
        parallax: true,
        // Smooth scroll
        smoothScroll: true
    }
};

// Esporta la configurazione
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SITE_CONFIG;
}
