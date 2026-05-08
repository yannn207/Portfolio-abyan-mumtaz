document.addEventListener('DOMContentLoaded', () => {
    const langSwitcher = document.querySelector('.lang-switcher');
    let currentLang = localStorage.getItem('preferredLang') || (navigator.language.startsWith('id') ? 'id' : 'en');

    const updateText = (lang) => {
        document.querySelectorAll('[data-i18n]').forEach(el => {
            const key = el.getAttribute('data-i18n');
            if (translations[lang] && translations[lang][key]) {
                // Use innerHTML if the content has HTML tags, otherwise textContent
                if (translations[lang][key].includes('<')) {
                    el.innerHTML = translations[lang][key];
                } else {
                    el.textContent = translations[lang][key];
                }
            }
        });
        
        // Update document lang attribute
        document.documentElement.lang = lang;
        
        // Update switcher UI if exists
        const idBtn = document.querySelector('.lang-btn[data-lang="id"]');
        const enBtn = document.querySelector('.lang-btn[data-lang="en"]');
        if (idBtn && enBtn) {
            if (lang === 'id') {
                idBtn.classList.add('active');
                enBtn.classList.remove('active');
            } else {
                enBtn.classList.add('active');
                idBtn.classList.remove('active');
            }
        }
    };

    // Initialize
    updateText(currentLang);

    // Language switch click handler
    document.addEventListener('click', (e) => {
        if (e.target.closest('.lang-btn')) {
            const btn = e.target.closest('.lang-btn');
            const newLang = btn.getAttribute('data-lang');
            if (newLang !== currentLang) {
                currentLang = newLang;
                localStorage.setItem('preferredLang', currentLang);
                
                // Add a small fade effect
                document.body.style.opacity = '0';
                setTimeout(() => {
                    updateText(currentLang);
                    document.body.style.opacity = '1';
                }, 150);
            }
        }
    });

    // Add transition style to body
    document.body.style.transition = 'opacity 0.2s ease-in-out';
});
