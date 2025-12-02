// ====================================
// Smooth Scroll
// ====================================
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            const headerOffset = 80;
            const elementPosition = target.getBoundingClientRect().top;
            const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

            window.scrollTo({
                top: offsetPosition,
                behavior: 'smooth'
            });
        }
    });
});

// ====================================
// Header Scroll Effect
// ====================================
let lastScroll = 0;
const header = document.querySelector('.header');

window.addEventListener('scroll', () => {
    const currentScroll = window.pageYOffset;

    if (currentScroll > 100) {
        header.style.boxShadow = '0 4px 6px -1px rgb(0 0 0 / 0.1)';
    } else {
        header.style.boxShadow = 'none';
    }

    lastScroll = currentScroll;
});

// ====================================
// Download Buttons
// ====================================
const downloadMBtn = document.getElementById('download-m');
const downloadIntelBtn = document.getElementById('download-intel');

// Link al DMG Apple Silicon su GitHub Releases
const DOWNLOAD_LINK = 'https://github.com/Alekkk777/Tell_Me_More/releases/download/v1.0.0/Tells_me_More_2.0.0_Apple_Silicon.dmg';

downloadMBtn.addEventListener('click', (e) => {
    e.preventDefault();

    // Analisi evento (opzionale: aggiungi qui il tuo tracking)
    console.log('Download iniziato: Apple Silicon');

    // Avvia il download del DMG
    window.location.href = DOWNLOAD_LINK;
});

// Intel Mac - Coming Soon (disabled)
// Il bottone è già disabilitato nell'HTML, quindi questo listener non è necessario
// ma lo lasciamo per completezza
if (downloadIntelBtn && !downloadIntelBtn.disabled) {
    downloadIntelBtn.addEventListener('click', (e) => {
        e.preventDefault();
        console.log('Intel version: Coming soon');
    });
}

// ====================================
// Survey Button
// ====================================
// Link del sondaggio ora gestito direttamente nell'HTML
// const surveyBtn = document.getElementById('survey-btn');
// surveyBtn.addEventListener('click', (e) => {
//     // Opzionale: aggiungi qui il tuo tracking analytics
//     console.log('Sondaggio aperto');
// });

// ====================================
// Animate on Scroll (Observer API)
// ====================================
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Osserva tutte le card
document.querySelectorAll('.feature-card, .performance-card, .download-card').forEach(card => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(30px)';
    card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
    observer.observe(card);
});

// ====================================
// Animate comparison bars on scroll
// ====================================
const comparisonObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const bar = entry.target.querySelector('.comparison-fill');
            if (bar) {
                const width = bar.style.width;
                bar.style.width = '0';
                setTimeout(() => {
                    bar.style.width = width;
                }, 100);
            }
        }
    });
}, { threshold: 0.5 });

document.querySelectorAll('.comparison-item').forEach(item => {
    comparisonObserver.observe(item);
});

// ====================================
// Parallax Effect on Hero
// ====================================
window.addEventListener('scroll', () => {
    const scrolled = window.pageYOffset;
    const heroGradient = document.querySelector('.hero-gradient');

    if (heroGradient) {
        heroGradient.style.transform = `translateX(-50%) translateY(${scrolled * 0.5}px)`;
    }
});

// ====================================
// Console Easter Egg
// ====================================
console.log('%c🎙️ Tells me More', 'font-size: 24px; font-weight: bold; color: #6366f1;');
console.log('%cTrascrizione Audio AI Ultra-Veloce', 'font-size: 14px; color: #6b7280;');
console.log('%c\nInteressato al codice? Siamo sempre alla ricerca di feedback!', 'font-size: 12px; color: #10b981;');
console.log('%cVersione 2.0.0 - Valida fino al 30 Dicembre 2025', 'font-size: 11px; color: #f59e0b; font-style: italic;');
