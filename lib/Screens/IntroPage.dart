import 'package:flutter/material.dart';
import 'package:gym_app/Animations/FadeAnimation.dart';
import 'package:gym_app/Components/AccountDescription.dart';
import 'package:gym_app/constants.dart';

class IntroPage extends StatefulWidget {
  static String id = 'intro_page';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    if (_pageState != 0) {
      setState(() {
        _pageState--;
      });
    }
    return false;
  }

  double height;
  double width;

  int _pageState = 0;
  double _loginYOffset = 0;
  double _topPadding = 120;
  double _loginOpacity = 0.0;
  double _signUpYOffset = 0;
  double _scaling = 0;
  double _loginMargin = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 0:
        _loginYOffset = height;
        _topPadding = 120;
        _loginOpacity = 1.0;
        _signUpYOffset = height;
        _loginMargin = 0;
        _scaling = 1.0;
        break;
      case 1:
        _loginYOffset = height - 600;
        _topPadding = 90;
        _loginOpacity = 1.0;
        _signUpYOffset = height;
        _scaling = 1.0;
        _loginMargin = 0;
        break;
      case 2:
        _loginYOffset = height - 610;
        _topPadding = 70;
        _loginOpacity = 0.7;
        _signUpYOffset = height - 590;
        _scaling = 0.9;
        _loginMargin = 40;
        break;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/backgroundGymapp.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          width: width,
          height: height,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Stack(
                  children: <Widget>[
                    //Top Labels and Container(NXT LVL Fitness center)
                    AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeIn,
                      margin:
                          EdgeInsets.only(left: width - 210, top: _topPadding),
                      child: Stack(
                        children: <Widget>[
                          //NXT
                          FadeAnimation(
                            delay: 2.0,
                            child: Container(
                              margin: EdgeInsets.only(left: 40),
                              child: Text(
                                'NXT',
                                style: kHeadingText.copyWith(
                                  color: kCrossColor,
                                  fontSize: 47,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                          //LVL
                          FadeAnimation(
                            delay: 2.2,
                            child: Container(
                              margin: EdgeInsets.only(top: 35, left: 65),
                              child: Text(
                                'LVL',
                                style: kHeadingText.copyWith(
                                    color: Colors.white,
                                    fontSize: 47,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            delay: 2.2,
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 160,
                              ),
                              color: Colors.white,
                              height: 140,
                              width: 5,
                            ),
                          ),
                          //Fitness
                          FadeAnimation(
                            delay: 2.7,
                            child: Container(
                              margin: EdgeInsets.only(top: 100, left: 10),
                              child: Text(
                                'Fitness',
                                style: kNormalText.copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          //Center
                          FadeAnimation(
                            delay: 2.7,
                            child: Container(
                              margin: EdgeInsets.only(top: 100, left: 85),
                              child: Text(
                                'Center',
                                style: kNormalText.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Center Banner with Welcome Text
                    Container(
                      margin: EdgeInsets.only(top: height - 480, left: 40),
                      child: Stack(
                        children: <Widget>[
                          //White Container
                          FadeAnimation(
                            delay: 3.7,
                            child: Container(
                              height: 135,
                              width: 10,
                              color: Colors.white,
                            ),
                          ),
                          //Welcome Text
                          FadeAnimation(
                            delay: 2.0,
                            child: Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Text(
                                'Welcome',
                                style: kHeadingText.copyWith(
                                    fontSize: 50, color: Colors.white),
                              ),
                            ),
                          ),
                          //Unleash Your Inner Athlete
                          FadeAnimation(
                            delay: 3.2,
                            child: Container(
                              margin: EdgeInsets.only(left: 30, top: 80),
                              child: Text(
                                'UNLEASH YOUR INNER',
                                style: kNormalText.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            delay: 3.4,
                            child: Container(
                              margin: EdgeInsets.only(left: 30, top: 100),
                              child: Text(
                                'ATHLETE',
                                style: kNormalText.copyWith(
                                    fontSize: 23,
                                    color: kCrossColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Bottom button with go with button
              FadeAnimation(
                delay: 3.8,
                child: Container(
                  margin: EdgeInsets.only(
                    top: height - 150,
                    left: (width * 0.5) - 40,
                  ),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0, 0),
                              blurRadius: 5,
                              spreadRadius: 5)
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Go',
                          style: kHeadingText.copyWith(
                              color: Colors.black54, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Bottom Sheet
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_pageState == 1) {
                      _pageState = 2;
                    } else {
                      _pageState = 1;
                    }
                  });
                },
                child: AnimatedContainer(
                  margin: EdgeInsets.only(left: _loginMargin),
                  curve: Curves.easeIn,
                  transform: Matrix4.translationValues(0, _loginYOffset, 1)
                    ..scale(_scaling),
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(_loginOpacity),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  width: width,
                  child: _pageState == 1  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          FadeAnimation(
                            delay: 0.5,
                            child: Container(
                              margin: EdgeInsets.only(top: 40, bottom: 40),
                              child: Text(
                                "LOGIN",
                                style: kHeadingText.copyWith(
                                    color: Colors.black54, fontSize: 35),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            delay: 0.6,
                            child: TextFieldContainer(
                              width: width,
                              hintText: 'Enter Email',
                              prefixIcon: Icons.email,
                              obscureText: false,
                              function: () {
                                setState(() {});
                              },
                            ),
                          ),
                          FadeAnimation(
                            delay: 0.7,
                            child: TextFieldContainer(
                              width: width,
                              hintText: 'Enter Password',
                              prefixIcon: Icons.lock,
                              obscureText: true,
                              function: () {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      FadeAnimation(
                        delay: 0.8,
                        child: Container(
                          margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 60,
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: kHeadingText.copyWith(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      AccountDescription(
                        description: "Don't Have An Account? ",
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Container(
                          margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black87, width: 2),
                          ),
                          height: 60,
                          child: Center(
                            child: Text(
                              "SIGN IN",
                              style: kHeadingText.copyWith(
                                  fontSize: 30, color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ) : Container(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 1;
                  });
                },
                child: AnimatedContainer(
                  curve: Curves.easeIn,
                  transform: Matrix4.translationValues(0, _signUpYOffset, 1),
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  width: width,
                  child: _pageState == 2 ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FadeAnimation(
                        delay: 0.5,
                        child: Container(
                          margin: EdgeInsets.only(top: 40, bottom: 40),
                          child: Text(
                            "SIGN IN",
                            style: kHeadingText.copyWith(
                                color: Colors.black54, fontSize: 35),
                          ),
                        ),
                      ),
                      FadeAnimation(
                        delay: 0.6,
                        child: TextFieldContainer(
                          width: width,
                          hintText: 'Enter Email',
                          prefixIcon: Icons.email,
                          obscureText: false,
                          function: () {
                            setState(() {});
                          },
                        ),
                      ),
                      FadeAnimation(
                        delay: 0.7,
                        child: TextFieldContainer(
                          width: width,
                          hintText: 'Enter Password',
                          prefixIcon: Icons.lock,
                          obscureText: true,
                          function: () {
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(height: 30,),
                      FadeAnimation(
                        delay: 0.8,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 60,
                          child: Center(
                            child: Text(
                              "SIGN IN",
                              style: kHeadingText.copyWith(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      AccountDescription(
                        description: 'Already Have An Account?',
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black87, width: 2),
                          ),
                          height: 60,
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: kHeadingText.copyWith(
                                  fontSize: 30, color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ) : Container(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatefulWidget {
  TextFieldContainer(
      {this.hintText,
      this.prefixIcon,
      this.obscureText,
      this.function,
      this.width});

  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final Function function;
  final double width;

  @override
  _TextFieldContainerState createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.8,
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
        obscureText: widget.obscureText,
        onChanged: (value) {},
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: widget.hintText,
          prefixIcon: Icon(
            widget.prefixIcon,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
