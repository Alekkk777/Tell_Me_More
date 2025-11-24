# 🚀 Guida Passo-Passo - Tell Me More

**Repository GitHub**: https://github.com/Alekkk777/Tell_Me_More
**Vercel**: Già collegato ✅

---

## 📦 PASSO 1: Prepara i DMG (5-10 minuti)

### 1.1 Verifica DMG Apple Silicon

```bash
ls -lh /Users/alessandrosaladino/Developer/whisper-student/src-tauri/target/release/bundle/dmg/
```

✅ Dovresti vedere: `Tells me More_1.0.0_aarch64.dmg` (~3.9 MB)

### 1.2 Costruisci DMG Intel (se non l'hai già fatto)

```bash
cd /Users/alessandrosaladino/Developer/whisper-student-intel
pnpm tauri build
```

⏱️ Tempo: ~5-10 minuti

### 1.3 Copia i DMG sul Desktop

```bash
cd /Users/alessandrosaladino/Developer/tells-me-more-website

# Usa lo script automatico
./prepare-dmgs.sh
```

Questo copierà i DMG sul Desktop con nomi chiari:
- `Tells_me_More_2.0.0_Apple_Silicon.dmg`
- `Tells_me_More_2.0.0_Intel.dmg`

---

## 📤 PASSO 2: Carica DMG su GitHub Releases (3 minuti)

### 2.1 Crea un nuovo Release

1. Vai su: https://github.com/Alekkk777/Tell_Me_More/releases/new

2. Compila i campi:
   - **Tag version**: `v2.0.0`
   - **Release title**: `Tells me More v2.0.0 - Trial Version`
   - **Description**:

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
- 🤖 AI-powered text correction with automatic punctuation
- 🌍 Multilingual support (Italian, English, Spanish, French, German, and more)
- 🔒 100% offline and private - your data never leaves your Mac
- 📦 Multiple export formats (TXT, Markdown, HTML, PDF, DOCX)
- 🎛️ Smart audio profiles (University Lecture, Podcast, Auto Detect)

## 📊 Performance

- **Apple Silicon**: Process 1 hour of audio in ~3-4 minutes (15-20× real-time)
- **Intel Mac**: Process 1 hour of audio in ~8-12 minutes (5-8× real-time)
- Support for up to 3 hours of continuous audio

## ⚙️ System Requirements

- macOS 10.15 (Catalina) or later
- 8 GB RAM minimum (16 GB recommended for best performance)
- 2 GB free disk space for AI models
- Supported formats: MP3, WAV, M4A, OGG, FLAC, AAC

## ⏰ Trial Version Notice

This version expires on **December 30, 2025**. After this date, you'll need to download an updated version to continue using the application.

---

Made with ❤️ by Alessandro Saladino
```

3. **Attach binaries**: Trascina i 2 DMG dal Desktop:
   - `Tells_me_More_2.0.0_Apple_Silicon.dmg`
   - `Tells_me_More_2.0.0_Intel.dmg`

4. Click **"Publish release"**

### 2.2 Verifica i Link

Dopo la pubblicazione, i link saranno:

**Apple Silicon:**
```
https://github.com/Alekkk777/Tell_Me_More/releases/download/v2.0.0/Tells_me_More_2.0.0_Apple_Silicon.dmg
```

**Intel:**
```
https://github.com/Alekkk777/Tell_Me_More/releases/download/v2.0.0/Tells_me_More_2.0.0_Intel.dmg
```

✅ **I link sono già configurati nel sito!** Il codice `script.js` punta già a questi URL.

---

## 🚀 PASSO 3: Deploy su Vercel (1 minuto)

### 3.1 Push del Codice

```bash
cd /Users/alessandrosaladino/Developer/tells-me-more-website

# Aggiungi tutti i file
git add .

# Commit
git commit -m "Initial commit: Tells me More website with download links"

# Push su GitHub
git push -u origin main
```

### 3.2 Deploy Automatico

✅ **Vercel è già collegato alla tua repository!**

Appena fai `git push`, Vercel:
1. Rileva il push automaticamente
2. Avvia il build
3. Deploya il sito
4. Ti notifica quando è pronto

**Vai su**: https://vercel.com/dashboard

Vedrai il deploy in corso. Ci vorranno ~30 secondi.

---

## 🎯 PASSO 4: Testa Tutto (2 minuti)

### 4.1 Apri il Sito

Il tuo sito sarà disponibile su:
```
https://tell-me-more.vercel.app
```
(o il dominio che hai configurato su Vercel)

### 4.2 Testa i Download

1. Scroll fino alla sezione "Download"
2. Click su "Scarica per Apple Silicon"
   - ✅ Dovrebbe iniziare il download del DMG
3. Click su "Scarica per Intel Mac"
   - ✅ Dovrebbe iniziare il download del DMG

### 4.3 Verifica Safari

Su Safari, il browser potrebbe bloccare il download. È normale per DMG non firmati.

L'utente dovrà:
1. Aprire Preferenze Safari → Sicurezza
2. Permettere download

---

## 📊 PASSO 5: Crea il Sondaggio (2 minuti)

### 5.1 Crea Google Form

1. Vai su https://forms.google.com
2. Click "+" per nuovo form
3. Titolo: **"Tells me More - Feedback"**

4. Aggiungi domande tipo:
   - Come valuti l'app? (scala 1-5 stelle)
   - Per cosa hai usato Tells me More? (lezioni, podcast, interviste, altro)
   - La velocità di trascrizione è soddisfacente?
   - L'accuratezza è buona?
   - La correzione AI ti è stata utile?
   - Cosa miglioreresti?
   - Consiglieresti Tells me More? (Sì/No)

5. Click **"Send"** → copia il link

### 5.2 Aggiorna il Sito

Apri `script.js` e trova (riga ~74):

```javascript
const SURVEY_URL = 'https://forms.google.com/your-survey-link';
```

Sostituisci con il tuo link:

```javascript
const SURVEY_URL = 'https://forms.google.com/TUO-LINK-REALE';
```

Trova (riga ~82) e decommenta:

```javascript
surveyBtn.addEventListener('click', (e) => {
    e.preventDefault();
    console.log('Sondaggio aperto');
    window.open(SURVEY_URL, '_blank');  // ← DECOMMENTA QUESTA

    // Rimuovi l'alert
    // alert('📊 Grazie...');
});
```

### 5.3 Push e Rideploy

```bash
git add script.js
git commit -m "Add survey link"
git push
```

Vercel farà automaticamente il redeploy (~30 secondi).

---

## ✅ Checklist Finale

Prima di condividere il sito:

- [ ] DMG Apple Silicon costruito e testato
- [ ] DMG Intel costruito e testato
- [ ] GitHub Release v2.0.0 pubblicato con entrambi i DMG
- [ ] Link download funzionanti (testati dal sito)
- [ ] Sondaggio Google Forms creato
- [ ] Link sondaggio aggiunto al sito
- [ ] Sito deployato su Vercel
- [ ] Sito testato online
- [ ] Download testati da Safari e Chrome
- [ ] Mobile responsive testato

---

## 🎉 Fatto!

Il tuo sito è online con:
- ✅ Download funzionanti per entrambe le versioni Mac
- ✅ Sondaggio per raccogliere feedback
- ✅ Design bellissimo e professionale
- ✅ Deploy automatico su Vercel

### Link Importanti:

**Sito Web**: https://tell-me-more.vercel.app
**Repository**: https://github.com/Alekkk777/Tell_Me_More
**Releases**: https://github.com/Alekkk777/Tell_Me_More/releases
**Vercel Dashboard**: https://vercel.com/dashboard

---

## 🔄 Aggiornamenti Futuri

Quando vuoi aggiornare il sito:

```bash
# Modifica i file
# Poi:
git add .
git commit -m "Descrizione modifiche"
git push
```

Vercel farà automaticamente il redeploy! 🚀

---

## 🆘 Problemi Comuni

### DMG non si scaricano

**Soluzione**: Verifica che il Release su GitHub sia "Published" (non "Draft")

### Vercel non fa il deploy

**Soluzione**:
- Verifica su Vercel Dashboard che la repository sia collegata
- Vai su Settings → Git → verifica che il branch sia "main"

### Safari blocca il download

**Normale**: DMG non firmati vengono bloccati. L'utente deve permettere manualmente.

---

**Buon lavoro! 🎙️**
