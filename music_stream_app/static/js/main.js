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
    // document.querySelectorAll('.play-btn').forEach(button => {
    //     button.addEventListener('click', function() {
    //         const songId = this.dataset.songId;
    //         if (!songId) {
    //             console.error('No song ID found');
    //             return;
    //         }
            
    //         const songPath = `/static/songs/${songId}.mp3`;
            
    //         // Log the song path for debugging
    //         console.log('Attempting to play song:', songPath);
            
    //         try {
    //             if (currentSong !== songPath) {
    //                 audioPlayer.src = songPath;
    //                 currentSong = songPath;
    //                 audioPlayer.play().catch(error => {
    //                     console.error('Error playing song:', error);
    //                     showErrorPopup('Error playing song. Please try again.');
    //                 });
    //                 this.innerHTML = '<i class="fas fa-pause"></i>';
    //             } else if (audioPlayer.paused) {
    //                 audioPlayer.play().catch(error => {
    //                     console.error('Error playing song:', error);
    //                     showErrorPopup('Error playing song. Please try again.');
    //                 });
    //                 this.innerHTML = '<i class="fas fa-pause"></i>';
    //             } else {
    //                 audioPlayer.pause();
    //                 this.innerHTML = '<i class="fas fa-play"></i>';
    //             }
    //         } catch (error) {
    //             console.error('Error handling play button click:', error);
    //             showErrorPopup('An error occurred. Please try again.');
    //         }
    //     });
    // });

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

    // document.addEventListener('DOMContentLoaded', function() {
    //     const songRows = document.querySelectorAll('.song-row');
    //     const audioPlayer = document.getElementById('audio-player'); // Assuming you have this ID
    
    //     songRows.forEach(row => {
    //         const playBtn = row.querySelector('.row-play-btn');
    //         const songIndex = row.querySelector('.song-index');
    //         const songUrl = row.dataset.songUrl;
    
    //         row.addEventListener('mouseenter', () => {
    //             songIndex.style.display = 'none';
    //             playBtn.style.display = 'inline-flex';
    //         });
    //         row.addEventListener('mouseleave', () => {
    //             songIndex.style.display = 'inline';
    //             playBtn.style.display = 'none';
    //         });
    
    //         if (playBtn && songUrl && songUrl !== '#') {
    //             playBtn.addEventListener('click', (e) => {
    //                 e.stopPropagation(); // Prevent row click if any
    //                 // Basic play functionality - enhance as needed
    //                 if (audioPlayer.src !== songUrl) {
    //                     audioPlayer.src = songUrl;
    //                     audioPlayer.play();
    //                     // Update player bar UI here
    //                 } else if (audioPlayer.paused) {
    //                     audioPlayer.play();
    //                 } else {
    //                     audioPlayer.pause();
    //                 }
    //             });
    //         }
    //     });
    // });

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
        const playButtons = document.querySelectorAll('.play-btn');
        playButtons.forEach(button => {
            button.textContent = 'Play';
        });
    });

    audioPlayer.addEventListener('play', function() {
        updatePlayButtons('Pause');
    });

    audioPlayer.addEventListener('pause', function() {
        updatePlayButtons('Play');
    });

    function updatePlayButtons(text) {
        const playButtons = document.querySelectorAll('.play-btn');
        playButtons.forEach(button => {
            const songItem = button.closest('.song-item') || button.closest('.playlist-song');
            if (songItem && songItem.dataset.songPath === currentSong) {
                button.textContent = text;
            }
        });
    }
}); 