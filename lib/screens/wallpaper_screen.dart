import 'package:flutter/material.dart';
import 'package:wall_moods/modules/wallpaper_class.dart';
import 'package:wall_moods/services/api_calls.dart';
import 'package:wall_moods/widgets/widgets.dart';

class WallpaperScreen extends StatefulWidget {

  @override
  _WallpaperScreenState createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {

  int page = 1;
  List<String> wallpaperLinks = [];
  Urls urls = Urls();
  WallpaperData wallpaperData = WallpaperData();
  ScrollController scrollController = ScrollController();
  ApiCalls apiCalls = ApiCalls();

  @override
  void initState() {
    super.initState();
    apiCalls.getData(wallpaperData,page).then((value) {
      setState(() {
        for(var i in value){
          wallpaperLinks.add(i);
        }
      });
    });
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        page++;
        apiCalls.getData(wallpaperData,page).then((value) {
          setState(() {
            for(var i in value){
              wallpaperLinks.add(i);
            }
          });
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:wallpaperLinks.isEmpty? Center(
        child: CircularProgressIndicator(
          color: Colors.deepPurple,
        ),
      ) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridList(
            scrollController: scrollController,
            wallpaperLinks: wallpaperLinks,
          onTap: (){

          },
        ),
      ),
    );
  }
}


