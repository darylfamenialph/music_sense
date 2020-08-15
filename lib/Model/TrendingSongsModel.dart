

class TrendingSongsModel {

  String song_title;
  String song_artist;
  String song_album;
  String released_date;
  String album_art;
  String song_lyrics;

  TrendingSongsModel(this.song_title, this.song_artist, this.song_album, this.released_date, this.album_art, this.song_lyrics);

  factory TrendingSongsModel.fromJson(Map<String, dynamic> json)
  {
    if(json == null)
      return null;
    else{
      return TrendingSongsModel(json["song_title"],json["song_artist"],json["song_album"],json["released_date"],json["album_art"],json["song_lyrics"]);
    }
  }

  get songTitle => this.song_title;
  get songArtist => this.song_artist;
  get songAlbum => this.song_album;
  get releasedDate => this.released_date;
  get albumArt => this.album_art;
  get songLyrics => this.song_lyrics;

  @override
  String toString()
  {
    return '{ ${this.song_title},${this.song_artist},${this.song_album},${this.released_date},${this.album_art},${this.song_lyrics} }';
  }
  
}