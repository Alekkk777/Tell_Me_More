# 🎙️ Tells me More - Website

Sito web promozionale per Tells me More - Trascrizione Audio AI.

## 🚀 Quick Start

**Vuoi mettere online il sito velocemente?** Leggi [QUICK_START.md](QUICK_START.md) - tutto in 3 passi, 10-15 minuti.

**Vuoi istruzioni dettagliate?** Leggi [DEPLOY_GUIDE.md](DEPLOY_GUIDE.md) - guida completa passo-passo.

## 📁 Struttura File

```
tells-me-more-website/
├── index.html           # Pagina principale
├── style.css            # Stili completi
├── script.js            # Interattività JavaScript
├── vercel.json          # Configurazione Vercel
├── config.example.js    # Template configurazione
├── .gitignore           # Git ignore file
│
├── README.md            # Questa guida
├── QUICK_START.md       # 🚀 Quick start in 3 passi
├── DEPLOY_GUIDE.md      # 📖 Guida completa deploy
│
├── prepare-dmgs.sh      # 🔧 Script: prepara DMG
├── update-links.sh      # 🔧 Script: aggiorna link
└── deploy-vercel.sh     # 🔧 Script: deploy Vercel
```

## 🛠️ Script Helper

Usa questi script per semplificare il processo:

### 1. Preparare i DMG

```bash
./prepare-dmgs.sh
```

Questo script:
- Verifica che i DMG esistano
- Li copia sul Desktop con nomi chiari
- Mostra le istruzioni per GitHub Releases

### 2. Aggiornare i Link Download

```bash
./update-links.sh
```

Questo script:
- Chiede il tuo username GitHub
- Aggiorna automaticamente i link in `script.js`
- Crea un backup del file originale

### 3. Deploy su Vercel

```bash
./deploy-vercel.sh
```

Questo script:
- Installa Vercel CLI se necessario
- Verifica Git repository
- Fa il deploy automaticamente

## 🚀 Come Usare

### 1. Visualizzare il Sito Localmente

Puoi aprire direttamente `index.html` nel browser, oppure usare un server locale:

**Opzione A - Apertura Diretta:**
```bash
open index.html
```

**Opzione B - Server Python (consigliato):**
```bash
# Python 3
python3 -m http.server 8000

# Apri http://localhost:8000 nel browser
```

**Opzione C - Server Node.js:**
```bash
# Installa http-server globalmente
npm install -g http-server

# Avvia il server
http-server -p 8000
```

### 2. Configurare i Link di Download

Apri `script.js` e modifica l'oggetto `DOWNLOAD_LINKS` con i tuoi URL reali:

```javascript
const DOWNLOAD_LINKS = {
    appleSilicon: 'https://tuo-server.com/Tells_me_More_2.0.0_aarch64.dmg',
    intel: 'https://tuo-server.com/Tells_me_More_2.0.0_x86_64.dmg'
};
```

Poi decommentare le righe di download nei listener:

```javascript
downloadMBtn.addEventListener('click', (e) => {
    e.preventDefault();
    window.location.href = DOWNLOAD_LINKS.appleSilicon;  // ← Decommenta questa
});
```

### 3. Configurare il Link al Sondaggio

Apri `script.js` e modifica la costante `SURVEY_URL`:

```javascript
const SURVEY_URL = 'https://forms.google.com/TUO-SONDAGGIO';
```

Poi decommenta la riga nel listener:

```javascript
surveyBtn.addEventListener('click', (e) => {
    e.preventDefault();
    window.open(SURVEY_URL, '_blank');  // ← Decommenta questa
});
```

## 🎨 Personalizzazione Colori

I colori sono definiti nelle CSS custom properties in `style.css`:

```css
:root {
    --primary: #6366f1;        /* Colore principale (indigo) */
    --primary-dark: #4f46e5;   /* Indigo scuro */
    --secondary: #8b5cf6;      /* Viola */
    --accent: #f59e0b;         /* Arancione */
    --success: #10b981;        /* Verde */
    /* ... */
}
```

## 📦 Hosting e Distribuzione

### Opzione 1: GitHub Pages (Gratuito)

```bash
# 1. Crea un repository su GitHub
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/TUO-USERNAME/tells-me-more-website.git
git push -u origin main

# 2. Vai su Settings > Pages
# 3. Scegli branch: main, folder: / (root)
# 4. Il sito sarà disponibile su: https://TUO-USERNAME.github.io/tells-me-more-website/
```

### Opzione 2: Netlify (Gratuito)

1. Vai su [netlify.com](https://netlify.com)
2. Trascina la cartella `tells-me-more-website` nell'area di drop
3. Il sito sarà online in pochi secondi

### Opzione 3: Vercel (Gratuito)

```bash
# Installa Vercel CLI
npm install -g vercel

# Deploy
cd tells-me-more-website
vercel
```

### Opzione 4: Server Personalizzato

Copia tutti i file su un server web (Apache, Nginx, etc.):

```bash
# Via SCP
scp -r tells-me-more-website/* user@server:/var/www/html/

# Via SFTP o FTP con FileZilla, Cyberduck, etc.
```

## 🔧 Modifiche Comuni

### Cambiare il Titolo

Apri `index.html` e modifica:

```html
<title>Tells me More - Trascrizione Audio AI Ultra-Veloce</title>
```

### Aggiungere Google Analytics

Aggiungi prima della chiusura `</head>` in `index.html`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

### Aggiungere Meta Tags per Social Media

Aggiungi nella sezione `<head>` di `index.html`:

```html
<!-- Open Graph / Facebook -->
<meta property="og:type" content="website">
<meta property="og:url" content="https://tuo-sito.com/">
<meta property="og:title" content="Tells me More - Trascrizione Audio AI">
<meta property="og:description" content="Trasforma ore di audio in testo in pochi minuti">
<meta property="og:image" content="https://tuo-sito.com/preview.jpg">

<!-- Twitter -->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:url" content="https://tuo-sito.com/">
<meta property="twitter:title" content="Tells me More - Trascrizione Audio AI">
<meta property="twitter:description" content="Trasforma ore di audio in testo in pochi minuti">
<meta property="twitter:image" content="https://tuo-sito.com/preview.jpg">
```

## ✨ Funzionalità Implementate

- ✅ Design responsive (desktop, tablet, mobile)
- ✅ Animazioni smooth al caricamento
- ✅ Scroll parallax nell'hero
- ✅ Animazioni al scroll (Intersection Observer)
- ✅ Smooth scroll per i link interni
- ✅ Header con effetto al scroll
- ✅ Grafici animati delle prestazioni
- ✅ Sezione download con 2 versioni Mac + Windows coming soon
- ✅ Sezione sondaggio con CTA
- ✅ Footer completo

## 🎯 SEO

Il sito include:
- Meta description
- Struttura semantica HTML5
- Heading hierarchy (H1-H4)
- Alt text (da aggiungere se usi immagini)
- Performance ottimizzate (CSS/JS minimali)

Per migliorare ulteriormente:
1. Aggiungi un file `robots.txt`
2. Crea una `sitemap.xml`
3. Ottimizza le immagini (se ne aggiungi)
4. Usa un CDN per i font

## 📱 Responsive Breakpoints

- Desktop: > 1024px
- Tablet: 768px - 1024px
- Mobile: < 768px
- Small mobile: < 480px

## 🎨 Font

Il sito usa **Inter** da Google Fonts. Se vuoi cambiarlo:

1. Vai su [Google Fonts](https://fonts.google.com)
2. Scegli un font
3. Sostituisci il link nel `<head>` di `index.html`
4. Aggiorna `font-family` in `style.css`

## 📊 Performance

Il sito è ottimizzato per il caricamento veloce:
- Nessuna dipendenza esterna (tranne Google Fonts)
- CSS e JS minimali
- Animazioni hardware-accelerated
- Lazy loading per le animazioni

## 🐛 Troubleshooting

**Le animazioni non funzionano:**
- Verifica che `script.js` sia caricato correttamente
- Controlla la console del browser per errori

**I bottoni di download non funzionano:**
- Assicurati di aver configurato i link in `script.js`
- Controlla che gli ID dei bottoni corrispondano

**Il sito non è responsive:**
- Verifica che il viewport meta tag sia presente in `index.html`
- Controlla che `style.css` sia caricato correttamente

## 📄 Licenza

Questo sito web è parte del progetto Tells me More.

---

**Fatto con ❤️ da Alessandro Saladino**
