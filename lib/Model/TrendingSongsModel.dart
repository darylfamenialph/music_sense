

class TrendingSongsModel {

  String song_title;
  String song_artist;
  String song_album;
  String released_date;
  String album_art;
  String song_lyrics_original;
  String song_lyrics_transcribed;
  String song_lyrics_translate;
  String mp3_filename;

  TrendingSongsModel(this.song_title, this.song_artist, this.song_album, this.released_date, this.album_art, this.song_lyrics_original,this.song_lyrics_transcribed,this.song_lyrics_translate, this.mp3_filename);

  factory TrendingSongsModel.fromJson(Map<String, dynamic> json)
  {
    if(json == null)
      return null;
    else{
      return TrendingSongsModel(json["song_title"],json["song_artist"],json["song_album"],json["released_date"],json["album_art"],json["song_lyrics_original"],json["song_lyrics_transcribed"],json["song_lyrics_translate"],json["mp3_filename"]);
    }
  }

  get songTitle => this.song_title;
  get songArtist => this.song_artist;
  get songAlbum => this.song_album;
  get releasedDate => this.released_date;
  get albumArt => this.album_art;
  get songLyricsOriginal => this.song_lyrics_original;
  get songLyricsTranscribed => this.song_lyrics_transcribed;
  get songLyricsTranslate => this.song_lyrics_translate;
  get mp3Filename => this.mp3_filename;

  @override
  String toString()
  {
    return '{ ${this.song_title},${this.song_artist},${this.song_album},${this.released_date},${this.album_art},${this.song_lyrics_original},${this.song_lyrics_transcribed},${this.song_lyrics_translate},${this.mp3_filename} }';
  }
  
}