/**
 * Errorfect Logo Cycler
 * Cycles through logos in images/branding/logo/ on each click
 */

class LogoCycler {
    constructor(containerSelector, logoPath = '/images/branding/logo/') {
        this.container = document.querySelector(containerSelector);
        this.logoPath = logoPath;
        this.logos = [];
        this.currentIndex = 0;
        this.init();
    }

    async init() {
        // Load logo list from server or use predefined list
        await this.loadLogos();
        
        if (this.logos.length === 0) {
            console.warn('No logos found in branding/logo folder');
            return;
        }

        // Set up click handler
        if (this.container) {
            this.container.addEventListener('click', () => this.cycleLogo());
            this.container.style.cursor = 'pointer';
            this.container.style.transition = 'opacity 0.3s ease-in-out';
            
            // Load first logo
            this.showLogo(0);
        }
    }

    async loadLogos() {
        // Option 1: Fetch from WordPress API (if available)
        try {
            const response = await fetch('/wp-json/wp/v2/media?media_type=image&search=branding/logo');
            if (response.ok) {
                const media = await response.json();
                this.logos = media.map(item => item.source_url);
                return;
            }
        } catch (e) {
            // Fall through to manual list
        }

        // Option 2: Use predefined list (update this with your actual logo filenames)
        // You can also generate this list server-side
        this.logos = [
            'logo-1.svg',
            'logo-2.svg',
            'logo-3.svg',
            'logo-4.svg',
            'logo-5.svg'
        ].map(filename => this.logoPath + filename);
    }

    cycleLogo() {
        this.currentIndex = (this.currentIndex + 1) % this.logos.length;
        this.showLogo(this.currentIndex);
    }

    showLogo(index) {
        if (!this.container || !this.logos[index]) return;

        const logoUrl = this.logos[index];
        
        // Fade out
        this.container.style.opacity = '0';
        
        setTimeout(() => {
            // Update image source
            if (this.container.tagName === 'IMG') {
                this.container.src = logoUrl;
            } else {
                // If container is a div, update background or innerHTML
                const img = this.container.querySelector('img');
                if (img) {
                    img.src = logoUrl;
                } else {
                    this.container.innerHTML = `<img src="${logoUrl}" alt="Errorfect Logo" />`;
                }
            }
            
            // Fade in
            this.container.style.opacity = '1';
        }, 150);
    }

    // Method to manually set logo list (useful for WordPress integration)
    setLogos(logos) {
        this.logos = logos;
        if (this.logos.length > 0) {
            this.showLogo(0);
        }
    }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    // Initialize logo cycler on hero logo
    window.logoCycler = new LogoCycler('#hero-logo, .hero-logo, [data-logo-cycler]');
});

// Export for use in modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = LogoCycler;
}

