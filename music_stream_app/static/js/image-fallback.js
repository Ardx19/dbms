// Function to handle image loading errors
function handleImageError(img) {
    // Don't try to apply fallback if already applied
    if (img.getAttribute('data-fallback-applied') === 'true') return;
    
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

// Add this new code to attach the error handler to all images
document.addEventListener('DOMContentLoaded', function() {
    // Select all images
    const images = document.querySelectorAll('img');
    
    // Add error handler to each image
    images.forEach(img => {
        img.addEventListener('error', function() {
            handleImageError(this);
        });
    });
    
    // Also handle images that might have already failed before the script loaded
    images.forEach(img => {
        // Check if the image is broken (has no dimensions)
        if (img.complete && (img.naturalWidth === 0 || img.naturalHeight === 0)) {
            handleImageError(img);
        }
    });
});