import 'dart:convert';
import 'package:wall_moods/modules/wallpaper_class.dart';
import 'package:http/http.dart'as http;

class ApiCalls{

  Future<dynamic> getData(WallpaperData wallpaperData,int page)async{
    var apiUrl = 'https://api.unsplash.com/photos?page=$page&client_id=ENZyGvLdwKSlCcYup7yQA8Z3W-DZutABPsgYdT0Ur78';
    List <String>temp = [];

    try{
      http.Response response  = await http.get(Uri.parse(apiUrl));
      if(response.statusCode == 200){
        List<dynamic> jsonData = jsonDecode(response.body);
        for(var link in jsonData){
          wallpaperData = WallpaperData.fromJson(link);
          temp.add(wallpaperData.urls!.regular!);
        }
        return temp;
      }else{
        return null;
      }
    }catch(e){
      print(e);
    }
  }


}