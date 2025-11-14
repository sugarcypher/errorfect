<?php
/**
 * Template Name: Home with Hero
 * Template Post Type: page
 * 
 * Custom page template with hero section and logo cycler
 */

get_header();
?>

<main id="main" class="site-main">
    
    <?php
    // Include hero section
    get_template_part('hero-section');
    ?>
    
    <div class="content-area">
        <div class="container">
            
            <?php
            while ( have_posts() ) :
                the_post();
                ?>
                
                <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
                    
                    <?php if ( ! is_front_page() ) : ?>
                        <header class="entry-header">
                            <?php the_title( '<h1 class="entry-title">', '</h1>' ); ?>
                        </header>
                    <?php endif; ?>
                    
                    <div class="entry-content">
                        <?php
                        the_content();
                        
                        wp_link_pages(
                            array(
                                'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'twentytwentyfive' ),
                                'after'  => '</div>',
                            )
                        );
                        ?>
                    </div>
                    
                </article>
                
                <?php
            endwhile;
            ?>
            
        </div>
    </div>
    
</main>

<?php
get_footer();
?>

