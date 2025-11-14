<?php
/**
 * WordPress Integration for Logo Cycler
 * Add this to your theme's functions.php or as a plugin
 */

// Enqueue the logo cycler script
function errorfect_enqueue_logo_cycler() {
    wp_enqueue_script(
        'errorfect-logo-cycler',
        get_template_directory_uri() . '/logo-cycler.js', // Adjust path as needed
        array(),
        '1.0.0',
        true
    );
    
    // Pass logo list to JavaScript
    $logo_dir = get_template_directory() . '/images/branding/logo/';
    $logo_url = get_template_directory_uri() . '/images/branding/logo/';
    $logos = array();
    
    if (is_dir($logo_dir)) {
        $files = scandir($logo_dir);
        foreach ($files as $file) {
            if (in_array(strtolower(pathinfo($file, PATHINFO_EXTENSION)), ['svg', 'png', 'jpg', 'jpeg', 'webp'])) {
                $logos[] = $logo_url . $file;
            }
        }
    }
    
    wp_localize_script('errorfect-logo-cycler', 'errorfectLogos', array(
        'logos' => $logos,
        'path' => $logo_url
    ));
}
add_action('wp_enqueue_scripts', 'errorfect_enqueue_logo_cycler');

// Shortcode to display logo cycler
function errorfect_logo_cycler_shortcode($atts) {
    $atts = shortcode_atts(array(
        'class' => 'hero-logo',
        'alt' => 'Errorfect Logo'
    ), $atts);
    
    $logo_dir = get_template_directory() . '/images/branding/logo/';
    $logo_url = get_template_directory_uri() . '/images/branding/logo/';
    $first_logo = '';
    
    if (is_dir($logo_dir)) {
        $files = scandir($logo_dir);
        foreach ($files as $file) {
            if (in_array(strtolower(pathinfo($file, PATHINFO_EXTENSION)), ['svg', 'png', 'jpg', 'jpeg', 'webp'])) {
                $first_logo = $logo_url . $file;
                break;
            }
        }
    }
    
    if ($first_logo) {
        return '<img src="' . esc_url($first_logo) . '" alt="' . esc_attr($atts['alt']) . '" class="' . esc_attr($atts['class']) . '" data-logo-cycler />';
    }
    
    return '';
}
add_shortcode('errorfect_logo', 'errorfect_logo_cycler_shortcode');

