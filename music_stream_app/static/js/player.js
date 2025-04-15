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
        showErrorPopup("An error occurred while playing the audio.");
    });

    // --- Central function to load and play a song, updating UI ---
    function playSong(songData) {
        if (!songData || !songData.url) {
            console.error("Invalid song data provided to playSong");
            showErrorPopup("Could not play song: Invalid data.");
            return;
        }

        // Update player bar UI immediately
        trackName.textContent = songData.title || 'Unknown Title';
        artistName.textContent = songData.artist || 'Unknown Artist';
        albumArt.src = songData.cover || '/static/images/placeholder.svg';
        albumArt.onerror = () => { albumArt.src = '/static/images/placeholder.svg'; };

        // Load and play the audio
        try {
            if (audioPlayer.src.endsWith(songData.url) && audioPlayer.paused) {
                audioPlayer.play().catch(e => {
                    console.error("Error resuming play:", e);
                    showErrorPopup("Error playing audio.");
                });
            } else if (!audioPlayer.src.endsWith(songData.url) || audioPlayer.ended) {
                audioPlayer.src = songData.url;
                audioPlayer.load();
                audioPlayer.play().catch(e => {
                    console.error("Error starting play:", e);
                    showErrorPopup("Error playing audio.");
                });
            }

            playPauseBtn.innerHTML = '<i class="fas fa-pause"></i>';

        } catch (error) {
            console.error("Error setting audio source or playing:", error);
            showErrorPopup("Could not play song.");
        }
    }

    // --- Event Delegation for Play Buttons ---
    document.addEventListener('click', (e) => {
        const playButton = e.target.closest('.play-btn, .row-play-btn');
        if (!playButton) return;

        e.preventDefault();

        let songData = {};
        const songCard = e.target.closest('.song-card');
        const songRow = e.target.closest('.song-row');

        if (songCard) {
            songData.id = playButton.dataset.songId;
            songData.url = `/static/songs/${songData.id}.mp3`;
            songData.title = songCard.querySelector('.song-info h3')?.textContent;
            songData.artist = songCard.querySelector('.song-info .artist')?.textContent;
            songData.cover = songCard.querySelector('.song-image img')?.src;
        } else if (songRow) {
            songData.id = songRow.dataset.songId;
            songData.url = songRow.dataset.songUrl;
            songData.title = songRow.querySelector('.song-row-title')?.textContent;
            songData.artist = songRow.querySelector('.song-row-artist')?.textContent;
            songData.cover = songRow.querySelector('.song-row-img')?.src;
        } else {
            songData.id = playButton.dataset.songId;
            songData.url = playButton.dataset.songUrl || `/static/songs/${songData.id}.mp3`;
            songData.title = 'Loading...';
            songData.artist = '';
            songData.cover = '/static/images/placeholder.svg';
        }
        
        playSong(songData);
    });

    // Helper function for errors
    function showErrorPopup(message) {
        console.error("Player Error:", message);
        if (errorPopup) {
            errorPopup.textContent = message;
            errorPopup.style.display = 'block';
            setTimeout(() => { errorPopup.style.display = 'none'; }, 3000);
        }
    }
});