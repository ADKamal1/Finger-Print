import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/ui/login.dart';
import 'package:my_finger_printer/utils/languages/translations_delegate_base.dart';
import 'package:my_finger_printer/utils/slider_data.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;
  UserBloc userBloc;
  Map<String, dynamic> userData;
  String c;
  void initState() {
    super.initState();
    // startTime();
    // getUserData();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: (slideIndex != 0)
            ? AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                leading: new IconButton(
                  icon: new Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    controller.animateToPage(slideIndex - 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                  },
                ),
              )
            : AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
              ),
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(children: [
            Column(children: [
              Container(
                  child: Column(children: [
                Container(
                  height: h * .53,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() {
                        slideIndex = index;
                      });
                    },
                    children: <Widget>[
                      SlideTile(
                        imagePath: mySLides[0].getImageAssetPath(),
                        title: TranslationBase.of(context)
                            .getStringLocaledByKey('Welcome'),
                        desc: TranslationBase.of(context)
                            .getStringLocaledByKey('des1'),
                      ),
                      SlideTile(
                        imagePath: mySLides[1].getImageAssetPath(),
                        title: TranslationBase.of(context)
                            .getStringLocaledByKey('Welcome'),
                        desc: TranslationBase.of(context)
                            .getStringLocaledByKey('des2'),
                      ),
                      SlideTile(
                        imagePath: mySLides[2].getImageAssetPath(),
                        title: TranslationBase.of(context)
                            .getStringLocaledByKey('Welcome'),
                        desc: TranslationBase.of(context)
                            .getStringLocaledByKey('des3'),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // height: MediaQuery.of(context).size.height/4,
                  padding: EdgeInsets.fromLTRB(
                    150,
                    10,
                    150,
                    10,
                  ),
                  child: Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        i == slideIndex
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                ),
//                SizedBox(
//                  height: h * .04,
//                )
              ])),
              slideIndex != 2
                  ? Expanded(
                      flex: 1,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(40, 40, 40, 1),
                          ),
                          // color: Color.fromRGBO(40, 40, 40, 1),
                          //height: h * .2,
                          // margin: EdgeInsets.symmetric(vertical: 16),
                          child: Column(children: [
                            Container(
                              child: Image.asset(
                                'assets/images/5.jpg',
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(41, 0, 41, 10),
                              child: InkWell(
                                onTap: () {
                                  controller.animateToPage(
                                    slideIndex + 1,
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: h / 20,
                                  width: 3 * w / 4,
                                  color: Colors.white,
                                  child: Text(
                                    TranslationBase.of(context)
                                        .getStringLocaledByKey('Next'),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(49, 49, 49, 1),
                                        fontSize: 18,fontFamily: "Montserrat"),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage())),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(120, 10, 120, 20),
                                child: Center(
                                  child: Text(
                                    TranslationBase.of(context)
                                        .getStringLocaledByKey('LOGIN'),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 18,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1)),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                    )
                  : Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color.fromRGBO(40, 40, 40, 1),
                        ),
                        height: h / 3.3,
                        child: Column(children: [
                          Container(
                            child: Image.asset(
                              'assets/images/5.jpg',
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: h / 90,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Container(
                              //padding: EdgeInsets.only(bottom: 10),
                              alignment: Alignment.center,
                              height: h / 20,
                              width: 3 * w / 4,
                              color: Colors.white,
                              child: Text(
                                TranslationBase.of(context)
                                    .getStringLocaledByKey('LOGIN'),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(113, 113, 113, 1),
                                    fontSize: 18,fontFamily: "Montserrat"),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
            ]),
            Positioned(
              bottom: 20,
              left: 10,
              child: Row(
                children: [
                  Text(
                    "Developed By",
                    style: TextStyle(
                        color: Color.fromRGBO(213, 213, 213, 0.8),
                        fontSize: 12,
                        inherit: false),
                  ),
                  Container(
                    child: Image.asset(
                      "assets/images/component.png",
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                    ),
                  )
                ],
              ),
            )
          ]),
        )

        //backgroundColor: Colors.white,
        );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isCurrentPage ? 8.0 : 6.0,
      width: isCurrentPage ? 8.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.black : Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 24, color: Color.fromRGBO(49, 49, 49, 1),fontFamily: "Montserrat"),
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 18, color: Color.fromRGBO(49, 49, 49, 0.8),fontFamily: "Montserrat"),
          ),
        ],
      ),
    );
  }
}
