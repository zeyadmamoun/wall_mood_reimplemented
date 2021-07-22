import 'package:flutter/material.dart';


/////////////////////////////////////grid view . builder//////////////////////////////////////////
class GridList extends StatelessWidget {
  const GridList({
    Key? key,
    required this.scrollController,
    required this.wallpaperLinks,
    required this.onTap,
  }) : super(key: key);

  final ScrollController scrollController;
  final List<String> wallpaperLinks;
  final onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.8),
        itemCount: wallpaperLinks.length,
        itemBuilder: (context,index){
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(wallpaperLinks.elementAt(index)),
                    fit: BoxFit.cover,
                  )
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin:Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.2),
                        ]
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height:10.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 130.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.arrow_downward),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          );
        },
      ),
    );
  }
}