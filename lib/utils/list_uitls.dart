import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  var playListName;
  var totalChannel;
  var playListLink;

  CustomList(this.playListName, this.totalChannel, this.playListLink);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 25,
                  right: 25,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 20, left: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          // shape: BoxShape.circle
                        ),
                        child: Center(child: Icon(Icons.arrow_upward_rounded)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Container(
                          width: 30,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  playListName,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  playListLink,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                totalChannel,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
