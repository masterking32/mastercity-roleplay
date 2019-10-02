const musicControls = document.getElementById('musicControls');
const volumeSlider = document.getElementById('volumeSlider');
const playButton = document.getElementById('play-pause');
const muteButton = document.getElementById('mute');

if (config.enableMusic) {
  var tag = document.createElement('script');

  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  var randomizeSong = (min, max) => { return min + Math.floor(Math.random() * max); };
  var chooseSong = randomizeSong(0, config.music.length);

  volumeSlider.setAttribute('value', config.musicVolume);
  volumeSlider.addEventListener("input", updateVolume, false);
} else {
  musicControls.style.display = 'none';
}

var player;
function onYouTubeIframeAPIReady() {
  var videoId = config.music[chooseSong];

  player = new YT.Player('ytPlayer', {
    height: '0',
    width: '0',
    playerVars: {
      'autoplay': 0,
      'controls': 0,
      'disablekb': 1,
      'enablejsapi': 1,
    },
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange,
      'onError': onPlayerError
    }
  });
}

function onPlayerReady(event) {
  player.setVolume(config.musicVolume);
  playVideo();
}

function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.PLAYING) {

  } else if (event.data == YT.PlayerState.ENDED) {
    chooseSong++;
    playVideo();
  }
}

function onPlayerError(event) {
  switch (event.data) {
    case 2:
      console.log("The request contains an invalid parameter value. For example, this error occurs if you specify a video ID that does not have 11 characters, or if the video ID contains invalid characters, such as exclamation points or asterisks.");
      break;
    case 5:
      console.log("The requested content cannot be played in an HTML5 player or another error related to the HTML5 player has occurred.");
      break;
    case 100:
      console.log("The video requested was not found. This error occurs when a video has been removed (for any reason) or has been marked as private.");
      break;
    case 101:
      console.log("The owner of the requested video does not allow it to be played in embedded players.");
      break;
    case 150:
      console.log("This error is the same as 101. It's just a 101 error in disguise!");
      break;
  }
  skipVideo();
}

var playing = true;

function updateVolume() {
  player.setVolume((volumeSlider.value - 1));
}

function playPause() {
  if (playing) {
    playing = false;
    player.pauseVideo();

    playButton.innerHTML = '<i class="fas fa-play"></i>';
  } else {
    playing = true;
    player.playVideo();

    playButton.innerHTML = '<i class="fas fa-pause"></i>';
  }
}

function playVideo() {

  var index = chooseSong % config.music.length;
  var videoId = config.music[index];

  player.loadVideoById(videoId);
  player.playVideo();
}

function skipVideo() {
  chooseSong++;
  playVideo();
}

function previousVideo() {
  chooseSong--;
  playVideo();
}

function muteVideo() {
  if (player.isMuted()) {
    player.unMute();

    muteButton.innerHTML = '<i class="fas fa-volume-up"></i>';
  } else {
    player.mute();

    muteButton.innerHTML = '<i class="fas fa-volume-mute"></i>';
  }
}