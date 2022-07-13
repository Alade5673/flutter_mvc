import 'dart:convert';

// import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mvc_text/controller/login_controller.dart';
// import 'package:jobgam/views/Home/MainHome.dart';
// import 'package:jobgam/views/Onboarding.dart';
import 'package:http/http.dart' as http;
import 'package:mvc_text/controller/default_button.dart';

// import 'ResetPassword.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  var loginController = Get.put(LoginController());

  // var emailController = TextEditingController();
  // var passwordController = TextEditingController();

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // Future<void> signin() async {
  //   var jsonResponse;
  //
  //   var response = await http.post(
  //     Uri.parse(
  //         'https://staging-jobgam.herokuapp.com/auth/login?accountType=1'),
  //     // headers: <String, String>{
  //     //   'Content-Type': 'application/json; charset=UTF-8',
  //     // },
  //     body: <String, dynamic>{
  //       'email': emailController.text,
  //       'password': passwordController.text,
  //     },
  //   );
  //
  //   Map responseData = jsonDecode(response.body);
  //   var message = responseData['sucessMessage'];
  //   var errorMessage = responseData['errorMessage'];
  //
  //   print(message);
  //
  //   print(responseData);
  //
  //   if (response.statusCode == 200) {
  //
  //     Navigator.pop(context);
  //     Get.to(() => MainHome());
  //
  //
  //     Flushbar(
  //       message: message,
  //       leftBarIndicatorColor: Colors.green,
  //       duration: Duration(seconds: 3),
  //     )..show(context);
  //     jsonResponse = json.decode(response.body);
  //   } else {
  //     if(response.statusCode == 400){
  //       Navigator.pop(context);
  //       Flushbar(
  //         // title: "Access Denied",
  //         message: errorMessage,
  //         icon: Icon(
  //           Icons.info_outline,
  //           size: 28,
  //           color: Color.fromRGBO(255, 46, 0, 1),
  //         ),
  //         leftBarIndicatorColor: Colors.blue.shade300,
  //         duration: Duration(seconds: 3),
  //       )..show(context);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),

                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset('assets/images/backarrow.svg',
                    width: 20,
                    height: 20,
                    semanticsLabel: 'vector',),
                ),

                SizedBox(
                  height: 100,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Text(
                    'Sign in',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#112030'),
                      height: 1.5,
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Text(
                  'Enter your details to sign in',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: HexColor('#75828E'),
                    height: 1.5,
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                Container(
                  width: double.infinity,
                  // height: 60,
                  child: TextField(
                    controller: loginController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    // validator: validateEmail,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Email address',
                        hintStyle: TextStyle(
                            fontSize: 12
                        )
                    ),
                  ),
                ),


                SizedBox(
                  height: 40,
                ),

                Container(
                  width: double.infinity,
                  // height: 60,
                  child: TextField(
                    controller: loginController.passwordController,
                    keyboardType: TextInputType.name,
                    // validator: validateEmail,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            fontSize: 12
                        )
                    ),
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: 'Forgot your password ',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 11, 11, 1),
                              fontFamily: 'Oxygen',
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                        TextSpan(
                          text: 'Reset',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Get.to(ResetPassword());
                            },
                          style: TextStyle(
                              color: HexColor('#28A745'),
                              fontFamily: 'Oxygen',
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1,
                              decoration: TextDecoration.none),
                        ),
                      ]),
                    ),
                  ],
                ),

                SizedBox(
                  height: 250,
                ),

                DefaultButton(name:'Sign in', onTap: () {
                  // print(loginController.emailController);
                  // print(loginController.passwordController);
                  loginController.login;
                  // print('clicked');
                  // showLoaderDialog(context);
                  // signin();
                }, horizontal: 0,),

                SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                              color: Color.fromRGBO(11, 11, 11, 1),
                              fontFamily: 'Oxygen',
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                        TextSpan(
                          text: 'Create account',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Get.to(OnboardingOne());
                            },
                          style: TextStyle(
                              color: HexColor('#28A745'),
                              fontFamily: 'Oxygen',
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1,
                              decoration: TextDecoration.none),
                        ),
                      ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
