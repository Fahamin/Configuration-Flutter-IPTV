import 'package:flutter/material.dart';

class BuildItemDesign extends StatelessWidget {
  var name;
  var link;
  var url;

  BuildItemDesign(this.name, this.link, this.url);

  // const BuildItemDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Center(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(url),
                        ),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(1, 12))),
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.black38, shape: BoxShape.rectangle),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.download_for_offline,
                          color: Colors.white,
                        ),
                        Text(
                          "Downolad",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.bookmark,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
