document.addEventListener('DOMContentLoaded', function() {
    const audioPlayer = document.getElementById('audio-player');
    const modal = document.getElementById('playlist-modal');
    const createPlaylistBtn = document.getElementById('create-playlist-btn');
    const closeModalBtn = document.querySelector('.close');
    let currentSong = null;

    // Play button click handlers
    document.querySelectorAll('.play-btn').forEach(button => {
        button.addEventListener('click', function() {
            const songItem = this.closest('.song-item') || this.closest('.playlist-song');
            const songPath = songItem.dataset.songPath;
            
            if (currentSong !== songPath) {
                audioPlayer.src = songPath;
                currentSong = songPath;
            }
            
            if (audioPlayer.paused) {
                audioPlayer.play();
                this.textContent = 'Pause';
            } else {
                audioPlayer.pause();
                this.textContent = 'Play';
            }
        });
    });

    // Add to playlist button handlers
    document.querySelectorAll('.add-to-playlist-btn').forEach(button => {
        button.addEventListener('click', function() {
            const songId = this.closest('.song-item').dataset.songId;
            // Show playlist selection modal or dropdown
            // This would need to be implemented based on your specific UI requirements
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