import 'package:flutter/material.dart';
import 'package:my_finger_printer/Provider/user_bloc.dart';
import 'package:my_finger_printer/ui/login.dart';
import 'package:my_finger_printer/utils/slider_data.dart';
import 'package:my_finger_printer/widgets/global-functions.dart';

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

//  init() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance ( );
//    userData = prefs.getString ( 'userData' ) != null
//        ? json.decode ( prefs.getString ( 'userData' ) )
//        : null;
//    userBloc = Provider.of<UserBloc> ( context, listen: false );
//    if (userBloc.isLogin || userData != null) {
//      return null;
//    } else {
//      Navigator.of ( context ).pushReplacement (
//          MaterialPageRoute (
//              builder: (BuildContext context) => HomePage ( ) ) );
//    }
//  }
  getUserData() async {
    await Future.delayed(Duration(milliseconds: 10));
    await GlobalFunctions.getUserData(context);
  }

  void initState() {
    super.initState();
    // startTime();
    // getUserData();
    mySLides = getSlides();
    // controller = new PageController();
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
                    Icons.arrow_back,
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
        body: Stack(children: [
          Column(
            children: [
              Container(
                  child: Column(children: [
                Container(
                  height: (h / 2),
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
                        title: mySLides[0].getTitle(),
                        desc: mySLides[0].getDesc(),
                      ),
                      SlideTile(
                        imagePath: mySLides[1].getImageAssetPath(),
                        title: mySLides[1].getTitle(),
                        desc: mySLides[1].getDesc(),
                      ),
                      SlideTile(
                        imagePath: mySLides[2].getImageAssetPath(),
                        title: mySLides[2].getTitle(),
                        desc: mySLides[2].getDesc(),
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
                    0,
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
                SizedBox(
                  height: h / 20,
                )
              ])),
              slideIndex != 2
                  ? Expanded(
                      flex: 1,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(40, 40, 40, 1),
                          ),
                          // color: Color.fromRGBO(40, 40, 40, 1),
                          height: h * 3.33,
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
                                    slideIndex,
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
                                    "Next",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(49, 49, 49, 1),
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(160, 20, 150, 20),
                                child: Center(
                                  child: Text(
                                    'Log In',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        //  fontStyle: FontStyle,
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
                                "Log In",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(113, 113, 113, 1),
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
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
        ])

        //backgroundColor: Colors.white,
        );
  }
  //
  // startTime() async {
  //   return Timer(Duration(seconds: 2), () async {
  //     SharedPreferences sharedPreferences =
  //         await SharedPreferences.getInstance();
  //     bool isLogin = sharedPreferences.getBool(keyIsLogin) ?? false;
  //     if (isLogin) {
  //       Navigator.of(context).pushReplacementNamed(navigatorDashboard);
  //     } else {
  //       Navigator.of(context).pushReplacementNamed(navigatorLogin);
  //     }
  //   });
  // }

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
            height: 60,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 24, color: Color.fromRGBO(49, 49, 49, 1)),
          ),
          // SizedBox(
          //   height: 12,
          // ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 18, color: Color.fromRGBO(49, 49, 49, 0.8)),
          ),
          // SizedBox(
          //   height: 12,
          // ),
        ],
      ),
    );
  }
}
