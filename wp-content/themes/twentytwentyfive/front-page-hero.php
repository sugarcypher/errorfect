<?php
/**
 * Front Page Template with Hero
 * 
 * This template is used for the front page and includes the hero section
 */

get_header();
?>

<main id="main" class="site-main">
    
    <?php
    // Hero Section with Logo Cycler
    get_template_part('hero-section');
    ?>
    
    <?php
    // Main content area
    if ( have_posts() ) :
        while ( have_posts() ) :
            the_post();
            ?>
            
            <div class="content-area" id="about">
                <div class="container">
                    <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
                        
                        <div class="entry-content">
                            <?php the_content(); ?>
                        </div>
                        
                    </article>
                </div>
            </div>
            
            <?php
        endwhile;
    endif;
    ?>
    
</main>

<?php
get_footer();
?>

