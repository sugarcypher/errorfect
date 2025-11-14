<?php
/**
 * Hero Section with Logo Cycler
 * Add this to your theme's header.php or create a custom template
 */

// Get the first logo to display initially
$logo_dir = get_template_directory() . '/images/branding/logos/';
$logo_url = get_template_directory_uri() . '/images/branding/logos/';
$first_logo = '';

if (is_dir($logo_dir)) {
    $files = scandir($logo_dir);
    $logo_files = array();
    foreach ($files as $file) {
        if (in_array(strtolower(pathinfo($file, PATHINFO_EXTENSION)), ['svg', 'png', 'jpg', 'jpeg', 'webp'])) {
            $logo_files[] = $logo_url . $file;
        }
    }
    sort($logo_files);
    $first_logo = !empty($logo_files) ? $logo_files[0] : '';
}
?>

<section class="hero-section" id="hero">
    <div class="hero-container">
        <div class="hero-content">
            <!-- Logo with cycler -->
            <?php if ($first_logo): ?>
                <div class="hero-logo-wrapper">
                    <img 
                        id="hero-logo" 
                        src="<?php echo esc_url($first_logo); ?>" 
                        alt="Errorfect - Language Spellbreaking" 
                        class="hero-logo"
                        data-logo-cycler
                    />
                    <span class="logo-hint">Click to cycle logos</span>
                </div>
            <?php endif; ?>
            
            <!-- Hero Text -->
            <h1 class="hero-title">Errorfect</h1>
            <p class="hero-subtitle">Language Spellbreaking & Lexicon Alchemy</p>
            <p class="hero-description">
                Breaking open loaded English words ("normal," "perfect," "crazy," etc.) 
                to expose their hidden rules and rewrite how people think and feel.
            </p>
            
            <!-- CTA Buttons -->
            <div class="hero-cta">
                <a href="#about" class="btn btn-primary">Learn the Method</a>
                <a href="#workshops" class="btn btn-secondary">Join a Workshop</a>
            </div>
        </div>
    </div>
</section>

<style>
.hero-section {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    text-align: center;
    padding: 2rem;
}

.hero-container {
    max-width: 1200px;
    width: 100%;
}

.hero-logo-wrapper {
    margin-bottom: 2rem;
    position: relative;
}

#hero-logo {
    max-width: 300px;
    height: auto;
    cursor: pointer;
    transition: opacity 0.3s ease-in-out, transform 0.3s ease-in-out;
    filter: drop-shadow(0 4px 6px rgba(0, 0, 0, 0.3));
}

#hero-logo:hover {
    transform: scale(1.05);
    opacity: 0.9;
}

.logo-hint {
    display: block;
    font-size: 0.875rem;
    opacity: 0.7;
    margin-top: 0.5rem;
    font-style: italic;
}

.hero-title {
    font-size: 4rem;
    font-weight: 700;
    margin: 1rem 0;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

.hero-subtitle {
    font-size: 1.5rem;
    margin: 0.5rem 0;
    opacity: 0.9;
    font-weight: 300;
}

.hero-description {
    font-size: 1.125rem;
    max-width: 700px;
    margin: 2rem auto;
    line-height: 1.6;
    opacity: 0.95;
}

.hero-cta {
    display: flex;
    gap: 1rem;
    justify-content: center;
    margin-top: 2rem;
    flex-wrap: wrap;
}

.btn {
    padding: 1rem 2rem;
    border-radius: 0.5rem;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.3s ease;
    display: inline-block;
}

.btn-primary {
    background: white;
    color: #667eea;
}

.btn-primary:hover {
    background: #f0f0f0;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.btn-secondary {
    background: transparent;
    color: white;
    border: 2px solid white;
}

.btn-secondary:hover {
    background: white;
    color: #667eea;
}

@media (max-width: 768px) {
    .hero-title {
        font-size: 2.5rem;
    }
    
    .hero-subtitle {
        font-size: 1.25rem;
    }
    
    #hero-logo {
        max-width: 200px;
    }
    
    .hero-cta {
        flex-direction: column;
        align-items: center;
    }
    
    .btn {
        width: 100%;
        max-width: 300px;
    }
}
</style>

