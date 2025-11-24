# 🚀 Guida Completa: Carica DMG e Deploy su Vercel

## Parte 1: Caricare i DMG su GitHub Releases

### Perché GitHub Releases?
- ✅ **Gratuito** e affidabile
- ✅ **Fatto apposta** per distribuire software
- ✅ **Link diretti** ai file
- ✅ **Versioning** automatico
- ✅ **Bandwidth illimitata**

### Step 1: Crea un Repository GitHub

```bash
# Vai nella cartella del sito
cd /Users/alessandrosaladino/Developer/tells-me-more-website

# Inizializza Git (se non l'hai già fatto)
git init

# Aggiungi tutti i file
git add .

# Primo commit
git commit -m "Initial commit: Tells me More website"
```

**Poi su GitHub.com:**
1. Vai su https://github.com/new
2. Nome repository: `tells-me-more` (o quello che preferisci)
3. Descrizione: "Tells me More - AI Audio Transcription"
4. **Pubblico** (necessario per Releases gratuite) o Privato (se hai GitHub Pro)
5. Click "Create repository"

```bash
# Collega il repository locale a GitHub
git remote add origin https://github.com/TUO-USERNAME/tells-me-more.git
git branch -M main
git push -u origin main
```

### Step 2: Prepara i DMG

Prima dobbiamo costruire il DMG Intel (quello Apple Silicon esiste già):

```bash
# Vai nella cartella Intel
cd /Users/alessandrosaladino/Developer/whisper-student-intel

# Assicurati che tutto sia compilato
pnpm tauri build

# Il DMG sarà in: src-tauri/target/release/bundle/dmg/
```

**Rinomina i DMG per chiarezza:**

```bash
# Copia e rinomina Apple Silicon
cp /Users/alessandrosaladino/Developer/whisper-student/src-tauri/target/release/bundle/dmg/Tells\ me\ More_1.0.0_aarch64.dmg \
   ~/Desktop/Tells_me_More_2.0.0_Apple_Silicon.dmg

# Copia e rinomina Intel (dopo averlo costruito)
cp /Users/alessandrosaladino/Developer/whisper-student-intel/src-tauri/target/release/bundle/dmg/Tells\ me\ More_1.0.0_x86_64.dmg \
   ~/Desktop/Tells_me_More_2.0.0_Intel.dmg
```

### Step 3: Crea un Release su GitHub

**Via Web (più semplice):**

1. Vai al tuo repository su GitHub: `https://github.com/TUO-USERNAME/tells-me-more`
2. Click su **"Releases"** nella sidebar destra
3. Click **"Create a new release"**
4. **Tag version**: `v2.0.0`
5. **Release title**: `Tells me More v2.0.0 - Trial Version`
6. **Description**:

```markdown
# 🎙️ Tells me More v2.0.0 - Trial Version

**AI-Powered Audio Transcription for Mac**

This is a **trial version** valid until **December 30, 2025**.

## 🚀 Download

Choose the version for your Mac:

- **Apple Silicon (M1/M2/M3/M4)**: Download `Tells_me_More_2.0.0_Apple_Silicon.dmg`
- **Intel Mac (x86_64)**: Download `Tells_me_More_2.0.0_Intel.dmg`

## ✨ Features

- ⚡ Ultra-fast transcription (15-20× real-time on Apple Silicon)
- 🤖 AI-powered text correction with punctuation
- 🌍 Multilingual support
- 🔒 100% offline and private
- 📦 Multiple export formats (TXT, MD, HTML, PDF, DOCX)

## 📊 Performance

- **Apple Silicon**: Process 1 hour of audio in ~3-4 minutes
- **Intel Mac**: Process 1 hour of audio in ~8-12 minutes

## ⚙️ Requirements

- macOS 10.15 (Catalina) or later
- 8 GB RAM minimum (16 GB recommended)
- 2 GB free disk space

## ⏰ Trial Version

This version expires on **December 30, 2025**. After this date, you'll need to download an updated version.

---

Made with ❤️ by Alessandro Saladino
```

7. Trascina i 2 DMG dal Desktop nella sezione **"Attach binaries"**
8. Click **"Publish release"**

### Step 4: Ottieni i Link Diretti

Dopo aver pubblicato il release, i link saranno:

```
https://github.com/TUO-USERNAME/tells-me-more/releases/download/v2.0.0/Tells_me_More_2.0.0_Apple_Silicon.dmg

https://github.com/TUO-USERNAME/tells-me-more/releases/download/v2.0.0/Tells_me_More_2.0.0_Intel.dmg
```

**Formato generale:**
```
https://github.com/USERNAME/REPO/releases/download/TAG/FILENAME.dmg
```

---

## Parte 2: Aggiorna i Link nel Sito

Apri `script.js` e modifica:

```javascript
// SOSTITUISCI CON I TUOI LINK REALI
const DOWNLOAD_LINKS = {
    appleSilicon: 'https://github.com/TUO-USERNAME/tells-me-more/releases/download/v2.0.0/Tells_me_More_2.0.0_Apple_Silicon.dmg',
    intel: 'https://github.com/TUO-USERNAME/tells-me-more/releases/download/v2.0.0/Tells_me_More_2.0.0_Intel.dmg'
};

// DECOMMENTA QUESTE RIGHE (riga ~48 e ~62)
downloadMBtn.addEventListener('click', (e) => {
    e.preventDefault();
    console.log('Download iniziato: Apple Silicon');
    window.location.href = DOWNLOAD_LINKS.appleSilicon;  // ← DECOMMENTA

    // Rimuovi o commenta l'alert
    // alert('🎉 Download in partenza!...');
});

downloadIntelBtn.addEventListener('click', (e) => {
    e.preventDefault();
    console.log('Download iniziato: Intel Mac');
    window.location.href = DOWNLOAD_LINKS.intel;  // ← DECOMMENTA

    // Rimuovi o commenta l'alert
    // alert('🎉 Download in partenza!...');
});
```

Poi commit e push:

```bash
git add script.js
git commit -m "Update download links to GitHub Releases"
git push
```

---

## Parte 3: Deploy su Vercel

### Opzione A: Deploy via Web (più semplice)

1. Vai su https://vercel.com
2. Click **"Sign Up"** e registrati (puoi usare il tuo account GitHub)
3. Click **"Add New..."** → **"Project"**
4. Click **"Import Git Repository"**
5. Seleziona il repository `tells-me-more`
6. **Framework Preset**: None / Other
7. **Root Directory**: `./` (lascia vuoto se il sito è nella root)
8. Click **"Deploy"**

**Il sito sarà online in ~30 secondi!**

Il link sarà: `https://tells-me-more.vercel.app` (o simile)

### Opzione B: Deploy via CLI

```bash
# Installa Vercel CLI
npm install -g vercel

# Login
vercel login

# Deploy (dalla cartella del sito)
cd /Users/alessandrosaladino/Developer/tells-me-more-website
vercel

# Segui il wizard:
# - Set up and deploy? Y
# - Which scope? (scegli il tuo account)
# - Link to existing project? N
# - What's your project's name? tells-me-more
# - In which directory is your code located? ./
# - Want to override settings? N

# Deploy in produzione
vercel --prod
```

### Configurazione Vercel (opzionale)

Se vuoi configurazioni personalizzate, crea `vercel.json`:

```json
{
  "version": 2,
  "name": "tells-me-more",
  "builds": [
    {
      "src": "index.html",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/$1"
    }
  ],
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        },
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        },
        {
          "key": "X-XSS-Protection",
          "value": "1; mode=block"
        }
      ]
    }
  ]
}
```

### Custom Domain (opzionale)

1. Vai su Vercel Dashboard → tuo progetto
2. Click **"Settings"** → **"Domains"**
3. Aggiungi il tuo dominio (es. `tellsmemore.com`)
4. Segui le istruzioni per configurare i DNS

---

## Parte 4: Configura il Sondaggio

### Opzione 1: Google Forms (consigliato)

1. Vai su https://forms.google.com
2. Click **"+"** per creare un nuovo form
3. Titolo: "Tells me More - Feedback"
4. Aggiungi domande tipo:
   - Come valuti l'app? (scala 1-5)
   - Cosa ti è piaciuto di più?
   - Cosa miglioreresti?
   - Per cosa usi principalmente l'app? (lezioni, podcast, altro)
   - La velocità è adeguata?
5. Click **"Send"** → copia il link

### Opzione 2: Typeform (più bello)

1. Vai su https://typeform.com
2. Crea un account gratuito
3. Crea un nuovo typeform
4. Copia il link

### Aggiorna il Sito

In `script.js`:

```javascript
const SURVEY_URL = 'https://forms.google.com/TUO-LINK';  // ← Il tuo link

surveyBtn.addEventListener('click', (e) => {
    e.preventDefault();
    console.log('Sondaggio aperto');
    window.open(SURVEY_URL, '_blank');  // ← DECOMMENTA

    // Rimuovi l'alert
    // alert('📊 Grazie per il tuo interesse!...');
});
```

---

## 📋 Checklist Finale

Prima di andare online:

- [ ] DMG Apple Silicon costruito e testato
- [ ] DMG Intel costruito e testato
- [ ] DMG rinominati chiaramente
- [ ] GitHub repository creato
- [ ] GitHub Release pubblicato con entrambi i DMG
- [ ] Link download aggiornati in `script.js`
- [ ] Sondaggio creato (Google Forms / Typeform)
- [ ] Link sondaggio aggiornato in `script.js`
- [ ] Alert rimossi/commentati in `script.js`
- [ ] Sito testato localmente
- [ ] Deploy su Vercel completato
- [ ] Sito testato online
- [ ] Download DMG testati dal sito
- [ ] Link sondaggio testato

---

## 🐛 Troubleshooting

### I DMG non si scaricano

**Problema**: Click sul bottone ma nessun download

**Soluzione**:
1. Verifica che i link siano corretti (copia-incolla da GitHub Releases)
2. Assicurati di aver decommentato `window.location.href = DOWNLOAD_LINKS...`
3. Controlla la console del browser per errori
4. Verifica che il Release su GitHub sia "Pubblico" (non Draft)

### Il sito non si vede su Vercel

**Problema**: Deploy completato ma sito non carica

**Soluzione**:
1. Controlla il log di deploy su Vercel Dashboard
2. Verifica che `index.html` sia nella root del repository
3. Prova a rifare il deploy: `vercel --prod --force`

### Download DMG fallisce su Safari

**Problema**: Safari blocca il download

**Soluzione**:
- Normale con file DMG non firmati
- L'utente deve:
  1. Aprire Preferenze Safari → Sicurezza
  2. Permettere download da siti sconosciuti

Oppure firma i DMG (richiede Developer Account Apple da $99/anno)

---

## 🎯 Prossimi Passi (Opzionali)

1. **Analytics**: Aggiungi Google Analytics per tracciare download
2. **Newsletter**: Aggiungi un form per email updates
3. **Firmare i DMG**: Con certificato Apple Developer (aumenta la fiducia)
4. **SEO**: Ottimizza meta tags, sitemap, robots.txt
5. **Custom Domain**: Compra un dominio (es. tellsmemore.io)

---

**Fatto! 🚀** Ora hai un sistema completo per distribuire l'app!
