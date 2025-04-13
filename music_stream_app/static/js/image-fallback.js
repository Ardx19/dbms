// Function to handle image loading errors
function handleImageError(img) {
    // Get the image dimensions
    const width = img.width || 300;
    const height = img.height || 300;
    
    // Use our custom placeholder
    const defaultPlaceholder = '/static/images/placeholder.svg';
    
    // If the image has a data-placeholder attribute, use that instead
    const customPlaceholder = img.getAttribute('data-placeholder');
    
    // Set the src to either the custom placeholder or the default one
    img.src = customPlaceholder || defaultPlaceholder;
    
    // Add a class to indicate this is a placeholder
    img.classList.add('placeholder-image');
    
    // Maintain aspect ratio
    img.style.objectFit = 'cover';
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
                handleImageError(this);
            });
            img.setAttribute('data-error-handled', 'true');
        }
    });
}); 