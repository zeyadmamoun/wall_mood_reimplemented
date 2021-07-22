class WallpaperData {

  String? descreption;
  Urls? urls;
  String? altDescreption;

  WallpaperData({
    this.descreption,
    this.urls,
    this.altDescreption
});

  WallpaperData.fromJson(Map<String, dynamic> json){
    descreption = json['description'];
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
  }

}

class Urls{

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

 Urls.fromJson(Map<String, dynamic> json){
   raw =json["raw"];
   full = json["full"];
   regular = json["regular"];
   small = json["small"];
   thumb = json["thumb"];
 }


  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
  };
}