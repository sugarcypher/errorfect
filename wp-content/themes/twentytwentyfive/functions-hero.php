<?php
/**
 * Hero Section Functions
 * Additional functions for hero section integration
 */

// Register custom page template
function errorfect_register_page_templates( $templates ) {
    $templates['home-hero.php'] = 'Home with Hero';
    return $templates;
}
add_filter( 'theme_page_templates', 'errorfect_register_page_templates' );

// Load custom template
function errorfect_load_custom_template( $template ) {
    global $post;
    
    if ( $post && is_page() ) {
        $page_template = get_post_meta( $post->ID, '_wp_page_template', true );
        
        if ( 'home-hero.php' === $page_template ) {
            $template = locate_template( array( 'home-hero.php' ) );
        }
    }
    
    // Use front-page-hero.php for front page if it exists
    if ( is_front_page() && ! is_home() ) {
        $front_page_template = locate_template( array( 'front-page-hero.php' ) );
        if ( $front_page_template ) {
            return $front_page_template;
        }
    }
    
    return $template;
}
add_filter( 'template_include', 'errorfect_load_custom_template', 99 );

// Add hero section to front page automatically
function errorfect_add_hero_to_front_page() {
    if ( is_front_page() && ! is_admin() ) {
        // Hero section is already included via front-page-hero.php
        // This function can be used for additional customization
    }
}
add_action( 'wp', 'errorfect_add_hero_to_front_page' );

