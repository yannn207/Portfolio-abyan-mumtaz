document.addEventListener('DOMContentLoaded', () => {
    const clockElement = document.getElementById('realtime-date-text');
    if (!clockElement) return;

    const days = {
        id: ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'],
        en: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    };

    const months = {
        id: ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'],
        en: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    };

    function updateClock() {
        const currentLang = localStorage.getItem('preferredLang') || (navigator.language.startsWith('id') ? 'id' : 'en');
        const now = new Date();

        const dayName = days[currentLang][now.getDay()];
        const dateNum = now.getDate();
        const monthName = months[currentLang][now.getMonth()];
        const year = now.getFullYear();

        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const seconds = String(now.getSeconds()).padStart(2, '0');
        const timeString = `${hours}:${minutes}:${seconds}`;

        if (currentLang === 'id') {
            clockElement.innerHTML = `<span class="day">${dayName}</span>, <span class="date">${dateNum} ${monthName} ${year}</span><span class="separator">•</span><span class="time">${timeString}</span>`;
        } else {
            clockElement.innerHTML = `<span class="day">${dayName}</span>, <span class="date">${monthName} ${dateNum}, ${year}</span><span class="separator">•</span><span class="time">${timeString}</span>`;
        }
    }

    // Initialize clock immediately
    updateClock();
    // Update every second
    setInterval(updateClock, 1000);

    // Listen to click events on language switch buttons to update language state immediately
    document.addEventListener('click', (e) => {
        if (e.target.closest('.lang-btn')) {
            // Update slightly after the i18n script fades out and sets preference
            setTimeout(updateClock, 100);
        }
    });
});
