# 🚀 Quick Start - In 3 Passi

Vuoi mettere online il sito velocemente? Segui questi 3 passi:

---

## ⚡ Passo 1: Prepara i DMG (5 minuti)

### Costruisci il DMG Intel (se non l'hai già fatto)

```bash
cd /Users/alessandrosaladino/Developer/whisper-student-intel
pnpm tauri build
```

⏱️ Tempo: ~5-10 minuti

### Copia i DMG sul Desktop

```bash
cd /Users/alessandrosaladino/Developer/tells-me-more-website
./prepare-dmgs.sh
```

Questo script:
- ✅ Trova i DMG compilati
- ✅ Li copia sul Desktop con nomi chiari
- ✅ Ti mostra le istruzioni per GitHub Releases

---

## ⚡ Passo 2: Carica su GitHub Releases (3 minuti)

### A. Crea Repository GitHub

1. Vai su https://github.com/new
2. Nome: `tells-me-more`
3. Pubblico o Privato
4. Click "Create repository"

### B. Push del Codice

```bash
cd /Users/alessandrosaladino/Developer/tells-me-more-website

# Inizializza git (se non l'hai già fatto)
git init
git add .
git commit -m "Initial commit: Tells me More website"

# Collega a GitHub (sostituisci TUO-USERNAME)
git remote add origin https://github.com/TUO-USERNAME/tells-me-more.git
git branch -M main
git push -u origin main
```

### C. Crea Release

1. Vai su https://github.com/TUO-USERNAME/tells-me-more/releases/new
2. **Tag version**: `v2.0.0`
3. **Release title**: `Tells me More v2.0.0 - Trial Version`
4. **Description**: (copia dalla DEPLOY_GUIDE.md)
5. **Attach files**: Trascina i 2 DMG dal Desktop
6. Click **"Publish release"**

✅ Fatto! I DMG sono online.

### D. Aggiorna i Link nel Sito

```bash
# Usa lo script helper
./update-links.sh

# Inserisci il tuo username GitHub quando richiesto
# Lo script aggiornerà automaticamente script.js
```

**Poi apri `script.js` e:**
- Decommenta le righe con `window.location.href = DOWNLOAD_LINKS...`
- Commenta/rimuovi gli `alert()`

**Commit e push:**

```bash
git add script.js
git commit -m "Update download links"
git push
```

---

## ⚡ Passo 3: Deploy su Vercel (2 minuti)

### Usa lo Script Automatico

```bash
./deploy-vercel.sh
```

Lo script:
1. ✅ Installa Vercel CLI (se necessario)
2. ✅ Fa login
3. ✅ Deploy del sito
4. ✅ Ti dà il link finale

### Oppure Manuale

```bash
# Installa Vercel CLI
npm install -g vercel

# Deploy
vercel

# Quando pronto, deploy in produzione
vercel --prod
```

✅ **Fatto! Il sito è online!** 🎉

---

## 📋 Checklist Rapida

Prima di andare online, verifica:

- [ ] DMG Apple Silicon compilato e testato
- [ ] DMG Intel compilato e testato
- [ ] GitHub repository creato
- [ ] GitHub Release pubblicato
- [ ] Link download aggiornati in `script.js`
- [ ] Sondaggio creato (Google Forms)
- [ ] Link sondaggio aggiornato in `script.js`
- [ ] Deploy su Vercel completato
- [ ] Sito testato online
- [ ] Download testati dal sito

---

## 🎯 Link Utili

Dopo il deploy, i tuoi link saranno:

**Sito Web:**
```
https://tells-me-more.vercel.app
```

**Download Apple Silicon:**
```
https://github.com/TUO-USERNAME/tells-me-more/releases/download/v2.0.0/Tells_me_More_2.0.0_Apple_Silicon.dmg
```

**Download Intel:**
```
https://github.com/TUO-USERNAME/tells-me-more/releases/download/v2.0.0/Tells_me_More_2.0.0_Intel.dmg
```

---

## 🆘 Problemi?

### DMG Intel non si compila

**Errore**: Build fallisce

**Soluzione**:
```bash
cd /Users/alessandrosaladino/Developer/whisper-student-intel
pnpm install  # Reinstalla dipendenze
cargo clean   # Pulisci build
pnpm tauri build
```

### GitHub Release non visibile

**Problema**: Dopo aver pubblicato, il release è "Draft"

**Soluzione**: Torna su GitHub, vai su Releases, click sul tuo release e assicurati non sia segnato come "Draft".

### Download non partono dal sito

**Problema**: Click sul bottone ma nessun download

**Soluzione**: Verifica in `script.js` che:
1. I link siano corretti (copia da GitHub Releases)
2. Le righe `window.location.href = DOWNLOAD_LINKS...` siano decommentate
3. Gli `alert()` siano commentati/rimossi

### Vercel deploy fallisce

**Problema**: Deploy fallito

**Soluzione**:
```bash
# Controlla il log di errore su Vercel Dashboard
# Spesso è un problema di permessi o file mancanti

# Riprova il deploy forzato
vercel --prod --force
```

---

## 🎓 Documentazione Completa

Per istruzioni dettagliate, vedi:

- **DEPLOY_GUIDE.md** - Guida completa passo-passo
- **README.md** - Documentazione sito web

---

## 💡 Tips

1. **Testa localmente prima**: Usa `python3 -m http.server 8000` per testare il sito prima del deploy

2. **Custom Domain**: Su Vercel Dashboard puoi aggiungere un dominio personalizzato

3. **Analytics**: Aggiungi Google Analytics per tracciare i download

4. **Sondaggio**: Google Forms è gratuito e perfetto per feedback

5. **Updates**: Per aggiornare il sito, basta fare `git push` e `vercel --prod`

---

**Tempo totale: ~10-15 minuti** ⏱️

Buon deploy! 🚀
