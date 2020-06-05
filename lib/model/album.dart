class Album{
final int albumId;
final int id;
final String  title;
final String url;
final String thumnailUrl;
Album(
    {
      this.albumId,this.id,this.title,this.url,this.thumnailUrl}
      );
factory Album.fromJson(Map<String ,dynamic> json){
  return Album(
    albumId:json['albumid'] as int,
    id:json['id'] as int,
    title: json['title'] as String,
    url: json['url'] as String,
    thumnailUrl: json['thumbnailUrl'] as String
  );
}
}