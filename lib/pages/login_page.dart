import 'package:flutter/material.dart';
import 'package:khoj_tech/api_service.dart';
import 'package:khoj_tech/models/request_login_model.dart';
import 'package:khoj_tech/pages/signup_page.dart';
import 'package:khoj_tech/utils/ProgressHUD.dart';
import 'package:khoj_tech/utils/form_helper.dart';
import 'package:khoj_tech/widgets/bottom_nav_bar_widget.dart';
import 'package:khoj_tech/widgets/elevated_button_widget.dart';
import 'package:khoj_tech/widgets/rich_text_button_widget.dart';
import 'package:khoj_tech/widgets/text_button_widget.dart';
import 'package:khoj_tech/widgets/text_field_widget.dart';
import 'package:khoj_tech/widgets/text_widget.dart';
import 'package:khoj_tech/utils/validator_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  APIService? apiService;

  @override
  void initState() {
    apiService = APIService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                key: globalKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: MediaQuery.of(context).size.height * .33,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .08,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(
                            context,
                          ).size.height *
                          .15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(
                            text: 'Email',
                            color: Color(
                              0xff414042,
                            ),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .011,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'Please enter email address';
                              }
                              if (value!.isNotEmpty &&
                                  !value.toString().isValidEmail()) {
                                return "Please enter valid email address";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: const Color(0xfff2f2f2),
                              filled: true,
                              hintText: 'Enter your email',
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              hintStyle: const TextStyle(
                                color: Color(
                                  0xffdadada,
                                ),
                                fontFamily: 'Avenir',
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(
                            context,
                          ).size.height *
                          .15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(
                            text: 'Password',
                            color: Color(
                              0xff414042,
                            ),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .011,
                          ),
                          TextFieldWidget(
                            controller: passwordController,
                            obscureText: hidePassword,
                            suffixIcon: hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            iconColor: hidePassword
                                ? Colors.grey
                                : const Color(
                                    0xff292665,
                                  ),
                            hintText: 'Please Enter Password',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter Password";
                              }
                              return null;
                            },
                            iconOnTap: () {
                              setState(
                                () {
                                  hidePassword = !hidePassword;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(
                            context,
                          ).size.height *
                          .005,
                    ),
                    Container(
                      width: MediaQuery.of(
                            context,
                          ).size.width *
                          .9,
                      height: MediaQuery.of(
                            context,
                          ).size.height *
                          .06,
                      child: ElevatedButtonWidget(
                        text: 'Sign In',
                        textColor: Colors.white,
                        fontSize: 16.5,
                        backColor: const Color(
                          0xff292665,
                        ),
                        onTap: ()  {
                          if (globalKey.currentState!.validate()) {
                            setState(() {
                              isApiCallProcess = true;
                            });

                            apiService!
                                .postLogin(RequestLoginModel(
                                  email: emailController.text,
                                  password: passwordController.text
                                ))
                                .then((ret) async{
                              //  setState(() {
                              //   isApiCallProcess = false;
                              // });
                              if (ret.status == "1") {
                                print(ret.user!.data!.displayName);
                                print(
                                 ret.user!.data!.userEmail,
                                );
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                  SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              await preferences.setInt('userId',  ret.user!.iD!);
                              await preferences.setString('userEmail',  ret.user!.data!.userEmail!);
                              await preferences.setString('userName',  ret.user!.data!.displayName!);
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> BottomNavBarWidget()));
                                // FormHelper.showMessage(context, 'Khoj Tech',
                                //     'Login Successfull', "OK", () {

                                //     });
                              } else {
                                FormHelper.showMessage(context, 'Khoj Tech',
                                    'Email or Password is incorrect', "OK", () {
                                      Navigator.pop(context);
                                    });
                              }
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .029,
                    ),
                    TextButtonWidget(
                      onTap: () {},
                      text: "Forgot Password?",
                      color: const Color(
                        0xff414042,
                      ),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .015,
                    ),
                    RichTextButtonWidget(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => SignupPage()));
                      },
                      text1: "Don't have account? ",
                      text2: "Register",
                      color1: const Color(
                        0xff414042,
                      ),
                      color2: const Color(
                        0xffED1651,
                      ),
                      fontSize1: 17,
                      fontSize2: 17,
                      fontWeight2: FontWeight.bold,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                  ],
                ),
              ),
            )));
  }
}
