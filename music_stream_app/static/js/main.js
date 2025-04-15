document.addEventListener('DOMContentLoaded', function() {
    const audioPlayer = document.getElementById('audio-player');
    const modal = document.getElementById('playlist-modal');
    const createPlaylistBtn = document.getElementById('create-playlist-btn');
    const closeModalBtn = document.querySelector('.close');
    let currentSong = null;
    const volumeSlider = document.querySelector('.volume-slider');
    if (volumeSlider) {
                // Function to update slider background and audio volume
                const updateVolume = () => {
                    const percentage = volumeSlider.value; // Value is 0-100
                    // Update the CSS variable for the background gradient
                    volumeSlider.style.setProperty('--volume-percentage', percentage + '%');
                    // Update the actual audio volume (needs 0-1)
                    audioPlayer.volume = parseInt(percentage, 10) / 100;
                };
        
                // Add the event listener
                volumeSlider.addEventListener('input', updateVolume);
                
        
                // Optional: Set initial background on page load
                updateVolume(); 
    }

    

    // Play button click handlers
    document.querySelectorAll('.play-btn').forEach(button => {
        button.addEventListener('click', function() {
            const songId = this.dataset.songId;
            if (!songId) {
                console.error('No song ID found');
                return;
            }
            
            const songPath = `/static/songs/${songId}.mp3`;
            
            // Log the song path for debugging
            console.log('Attempting to play song:', songPath);
            
            try {
                if (currentSong !== songPath) {
                    audioPlayer.src = songPath;
                    currentSong = songPath;
                    audioPlayer.play().catch(error => {
                        console.error('Error playing song:', error);
                        showErrorPopup('Error playing song. Please try again.');
                    });
                    this.innerHTML = '<i class="fas fa-pause"></i>';
                } else if (audioPlayer.paused) {
                    audioPlayer.play().catch(error => {
                        console.error('Error playing song:', error);
                        showErrorPopup('Error playing song. Please try again.');
                    });
                    this.innerHTML = '<i class="fas fa-pause"></i>';
                } else {
                    audioPlayer.pause();
                    this.innerHTML = '<i class="fas fa-play"></i>';
                }
            } catch (error) {
                console.error('Error handling play button click:', error);
                showErrorPopup('An error occurred. Please try again.');
            }
        });
    });

    // Helper function to show error popup
    function showErrorPopup(message) {
        const errorPopup = document.createElement('div');
        errorPopup.className = 'error-popup';
        errorPopup.innerHTML = `
            <div class="error-content">
                <i class="fas fa-exclamation-circle"></i>
                <span>${message}</span>
            </div>
        `;
        document.body.appendChild(errorPopup);
        setTimeout(() => errorPopup.remove(), 3000);
    }

    // Add to playlist button handlers
    document.querySelectorAll('.add-to-playlist-btn').forEach(button => {
        button.addEventListener('click', function() {
            const songId = this.closest('.song-item').dataset.songId;
            // Show playlist selection modal or dropdown
            // This would need to be implemented based on your specific UI requirements
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        const songRows = document.querySelectorAll('.song-row');
        const audioPlayer = document.getElementById('audio-player'); // Assuming you have this ID
    
        songRows.forEach(row => {
            const playBtn = row.querySelector('.row-play-btn');
            const songIndex = row.querySelector('.song-index');
            const songUrl = row.dataset.songUrl;
    
            row.addEventListener('mouseenter', () => {
                songIndex.style.display = 'none';
                playBtn.style.display = 'inline-flex';
            });
            row.addEventListener('mouseleave', () => {
                songIndex.style.display = 'inline';
                playBtn.style.display = 'none';
            });
    
            if (playBtn && songUrl && songUrl !== '#') {
                playBtn.addEventListener('click', (e) => {
                    e.stopPropagation(); // Prevent row click if any
                    // Basic play functionality - enhance as needed
                    if (audioPlayer.src !== songUrl) {
                        audioPlayer.src = songUrl;
                        audioPlayer.play();
                        // Update player bar UI here
                    } else if (audioPlayer.paused) {
                        audioPlayer.play();
                    } else {
                        audioPlayer.pause();
                    }
                });
            }
        });
    });

    // Modal handlers
    if (createPlaylistBtn) {
        createPlaylistBtn.addEventListener('click', function() {
            modal.style.display = 'block';
        });
    }

    if (closeModalBtn) {
        closeModalBtn.addEventListener('click', function() {
            modal.style.display = 'none';
        });
    }

    window.addEventListener('click', function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    });

    // Audio player event handlers
    audioPlayer.addEventListener('ended', function() {
        // Fix 1: Use innerHTML instead of textContent for icons
        const playButtons = document.querySelectorAll('.play-btn, .row-play-btn');
        playButtons.forEach(button => {
            button.innerHTML = '<i class="fas fa-play"></i>';
            
            // Add class removal for visual indicators
            const container = button.closest('.song-item, .playlist-song, .song-row, .song-card');
            if (container) {
                container.classList.remove('playing');
            }
        });
    });

    audioPlayer.addEventListener('play', function() {
        // Fix 2: Use lowercase parameter to match function implementation
        updatePlayButtons('pause');
    });

    audioPlayer.addEventListener('pause', function() {
        // Fix 3: Use lowercase parameter to match function implementation
        updatePlayButtons('play');
    });
    
    function updatePlayButtons(state) {
        // Find all play buttons in both card and table layouts
        const playButtons = document.querySelectorAll('.play-btn, .row-play-btn');
        
        playButtons.forEach(button => {
            // Find the containing element, supporting all UI layouts
            const container = button.closest('.song-item, .playlist-song, .song-row, .song-card');
            if (!container) return;
            
            // Get song ID or URL using the various ways it might be stored
            const songId = button.dataset.songId || container.dataset.songId;
            const songPath = container.dataset.songPath || container.dataset.songUrl || 
                           (songId ? `/static/songs/${songId}.mp3` : null);
            
            // Fix 4: Better comparison with the current song
            // Convert both to absolute URLs or check if one ends with the other
            const currentSrcPath = decodeURIComponent(audioPlayer.src).split('/').slice(-1)[0];
            const songFileName = songPath ? songPath.split('/').slice(-1)[0] : null;
            
            // Check if this is the current song
            if (songFileName && currentSrcPath && currentSrcPath.includes(songFileName)) {
                // Update icon based on state
                if (state === 'play') {
                    button.innerHTML = '<i class="fas fa-play"></i>';
                    container.classList.remove('playing');
                } else {
                    button.innerHTML = '<i class="fas fa-pause"></i>';
                    container.classList.add('playing');
                }
            }
        });
        
        // Fix 5: Also update the main player button in the player bar
        const playPauseBtn = document.querySelector('.play-pause-btn');
        if (playPauseBtn) {
            if (state === 'play') {
                playPauseBtn.innerHTML = '<i class="fas fa-play"></i>';
            } else {
                playPauseBtn.innerHTML = '<i class="fas fa-pause"></i>';
            }
        }
    }
}); 