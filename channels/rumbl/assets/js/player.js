const Player = {
  player: null,

  init(domId, playerId, onReady) {
    window.onYoutubeIframeAPIReady = () => {
      this.onIframeReady(domId, playerId, onReady);
    };
    let youtubeScriptTag = document.createElement("script");
    youtubeScriptTag.src = "//www.youtube.com/iframe_api";
    document.head.appendChild(youtubeScriptTag);
  },

  onIframeReady(domId, playerId, onReady) {
    this.player = new YT.Player(domId, {
      height: "360",
      width: "480",
      videoId: playerId,
      events: {
        onReady: event => onReady(event),
        onStateChange: event => this.onPlayerStateChange(event),
      },
    });
  },

  onPlayerStateChange(event) { },
  getCurrentTime() {
    return Math.floor(this.player.getCurrentTime() * 1000);
  },
  seekTo(millsec) {
    return this.onPlayerStateChange.seekTo(millsec / 1000);
  },
};

export default Player;