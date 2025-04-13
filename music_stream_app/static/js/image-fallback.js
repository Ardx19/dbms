// Function to handle image loading errors
function handleImageError(img) {
    // Default placeholder image
    const defaultPlaceholder = '/static/images/placeholder.svg';
    
    // If the image has a data-placeholder attribute, use that instead
    const customPlaceholder = img.getAttribute('data-placeholder');
    
    // Set the src to either the custom placeholder or the default one
    img.src = customPlaceholder || defaultPlaceholder;
    
    // Add a class to indicate this is a placeholder
    img.classList.add('placeholder-image');
    
    // Add a data attribute to prevent infinite error loops
    img.setAttribute('data-fallback-applied', 'true');
}

// Initialize image fallback for all images
document.addEventListener('DOMContentLoaded', function() {
    // Get all images
    const images = document.querySelectorAll('img');
    
    // Add error event listener to each image
    images.forEach(img => {
        // Only add the error handler if the image doesn't already have one
        if (!img.hasAttribute('data-error-handled')) {
            img.addEventListener('error', function() {
                // Only handle the error if we haven't already applied a fallback
                if (!this.hasAttribute('data-fallback-applied')) {
                    handleImageError(this);
                }
            });
            img.setAttribute('data-error-handled', 'true');
        }
    });
}); 