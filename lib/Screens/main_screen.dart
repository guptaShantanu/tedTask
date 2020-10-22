import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tedtask/Models/imageData.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = new PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        SystemNavigator.pop();
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Expanded(
                    flex: 10,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index) {
                        print(index);
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 2.0,
                                    offset: Offset(2, 2)),
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 2.0,
                                    offset: Offset(-2, -2)),
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 2.0,
                                    offset: Offset(2, -2)),
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 2.0,
                                    offset: Offset(-2, 2)),
                              ],
                              image: DecorationImage(
                                  image: NetworkImage(imageUrls[index]),
                                  fit: BoxFit.cover)),
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 100.0,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.6)
                                ],
                                    stops: [
                                  0.1,
                                  3.0
                                ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${userData[index]['name']}, ${userData[index]['age']}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'MontAlt',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 25.0),
                                      textAlign: TextAlign.start,
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.info,
                                          color: Colors.white,
                                        ),
                                        onPressed: (){
                                          showModalBottomSheet(context: context,
                                              builder:(ctx){
                                            return Container();
                                              });
                                        })
                                  ],
                                ),
                                Text(
                                  '${userData[index]['job']}, ${userData[index]['location']}',
                                  style: TextStyle(
                                      fontFamily: 'Roboto', color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: Icon(CupertinoIcons.left_chevron, size: 30.0),
                              onPressed: () {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 350),
                                    curve: Curves.linear);
                              },
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(CupertinoIcons.star,
                                  size: 30.0,
                                color: userData[currentIndex]['isS']
                                    ? Colors.deepOrange
                                    : null,),
                              onPressed: (){
                                setState(() {
                                  userData[currentIndex]['isS'] =
                                  !userData[currentIndex]['isS'];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: Icon(
                                CupertinoIcons.heart_solid,
                                size: 30.0,
                                color: userData[currentIndex]['isH']
                                    ? Colors.red
                                    : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  userData[currentIndex]['isH'] =
                                      !userData[currentIndex]['isH'];
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon:
                                  Icon(CupertinoIcons.right_chevron, size: 30.0),
                              onPressed: () {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 350),
                                    curve: Curves.linear);
                              },
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
