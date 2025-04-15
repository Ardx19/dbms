document.addEventListener('DOMContentLoaded', () => {
    const audioPlayer = document.getElementById('audio-player');
    const playPauseBtn = document.querySelector('.play-pause-btn');
    const progressBar = document.querySelector('.progress-fill');
    const volumeSlider = document.querySelector('.volume-slider');
    const currentTimeDisplay = document.querySelector('.current-time');
    const totalTimeDisplay = document.querySelector('.total-time');
    const errorPopup = document.getElementById('error-popup');
    const trackName = document.querySelector('.track-name');
    const artistName = document.querySelector('.artist-name');
    const albumArt = document.querySelector('.album-art');

    // Format time in MM:SS
    function formatTime(seconds) {
        const minutes = Math.floor(seconds / 60);
        const remainingSeconds = Math.floor(seconds % 60);
        return `${minutes}:${remainingSeconds.toString().padStart(2, '0')}`;
    }

    // Update progress bar
    function updateProgress() {
        const progress = (audioPlayer.currentTime / audioPlayer.duration) * 100;
        progressBar.style.width = `${progress}%`;
        currentTimeDisplay.textContent = formatTime(audioPlayer.currentTime);
    }

    // Update duration display
    function updateDuration() {
        totalTimeDisplay.textContent = formatTime(audioPlayer.duration);
    }

    // Play/Pause functionality
    playPauseBtn.addEventListener('click', () => {
        if (audioPlayer.paused) {
            audioPlayer.play();
            playPauseBtn.innerHTML = '<i class="fas fa-pause"></i>';
        } else {
            audioPlayer.pause();
            playPauseBtn.innerHTML = '<i class="fas fa-play"></i>';
        }
    });

    // Progress bar functionality
    document.querySelector('.progress').addEventListener('click', (e) => {
        const progress = document.querySelector('.progress');
        const rect = progress.getBoundingClientRect();
        const pos = (e.clientX - rect.left) / rect.width;
        audioPlayer.currentTime = pos * audioPlayer.duration;
    });

    // Volume control
    volumeSlider.addEventListener('input', () => {
        audioPlayer.volume = volumeSlider.value / 100;
        const volumeIcon = document.querySelector('.volume-control i');
        if (audioPlayer.volume === 0) {
            volumeIcon.className = 'fas fa-volume-mute';
        } else if (audioPlayer.volume < 0.5) {
            volumeIcon.className = 'fas fa-volume-down';
        } else {
            volumeIcon.className = 'fas fa-volume-up';
        }
    });

    // Update time displays
    audioPlayer.addEventListener('timeupdate', updateProgress);
    audioPlayer.addEventListener('loadedmetadata', updateDuration);

    // Handle song end
    audioPlayer.addEventListener('ended', () => {
        playPauseBtn.innerHTML = '<i class="fas fa-play"></i>';
    });

    // Handle errors
    audioPlayer.addEventListener('error', () => {
        errorPopup.style.display = 'block';
        setTimeout(() => {
            errorPopup.style.display = 'none';
        }, 3000);
    });

    // Play song when play button is clicked
    document.addEventListener('click', (e) => {
        if (e.target.closest('.play-btn')) {
            const songCard = e.target.closest('.song-card');
            const songId = e.target.closest('.play-btn').dataset.songId;
            const songPath = `/static/songs/${songId}.mp3`;
            
            // Update player info
            trackName.textContent = songCard.querySelector('h3').textContent;
            artistName.textContent = songCard.querySelector('.artist').textContent;
            albumArt.src = songCard.querySelector('img').src;
            
            // Check if file exists and play
            fetch(songPath)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('File not found');
                    }
                    audioPlayer.src = songPath;
                    audioPlayer.play();
                    playPauseBtn.innerHTML = '<i class="fas fa-pause"></i>';
                })
                .catch(() => {
                    errorPopup.style.display = 'block';
                    setTimeout(() => {
                        errorPopup.style.display = 'none';
                    }, 3000);
                });
        }
    });
}); 