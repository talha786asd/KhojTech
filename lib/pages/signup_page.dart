import 'package:flutter/material.dart';
import 'package:khoj_tech/api_service.dart';
import 'package:khoj_tech/models/customer.dart';
import 'package:khoj_tech/models/request_signup_model.dart';
import 'package:khoj_tech/pages/login_page.dart';
import 'package:khoj_tech/utils/ProgressHUD.dart';
import 'package:khoj_tech/utils/form_helper.dart';
import 'package:khoj_tech/widgets/icon_button_widget.dart';
import 'package:khoj_tech/widgets/text_widget.dart';
import 'package:khoj_tech/utils/validator_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  APIService? apiService;
  // CustomerModel? model;
  RequestSignupModel? model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool hidePassword1 = true;

  bool isApiCallProcess = false;

  @override
  void initState() {
    apiService = APIService();
    model = RequestSignupModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarWidget(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            AppbarWidget(context).preferredSize.height,
        child: ProgressHUD(
          child: Form(
            key: globalKey,
            child: _formUI(),
          ),
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  Widget _formUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHelper.fieldLabel("Full Name"),
                FormHelper.textInput(
                    context,
                    model!.name,
                    hintT: "Enter a full name",
                    (value) => {
                          model!.name = value,
                        }, onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please enter full Name';
                  }
                  return null;
                }),
                FormHelper.fieldLabel("Email Address"),
                FormHelper.textInput(
                    context,
                    model!.email,
                    hintT: 'Enter a email address',
                    (value) => {
                          model!.email = value,
                        }, onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please enter email address';
                  }
                  if (value.isNotEmpty && !value.toString().isValidEmail()) {
                    return "Please enter valid email address";
                  }
                  return null;
                }),
                FormHelper.fieldLabel("Phone Number"),
                FormHelper.textInput(
                  context,
                  model!.phone,
                  hintT: 'Enter a phone',
                  (value) => {
                    model!.phone = value,
                  },
                  onValidate: (value) {
                    if (value!.isEmpty) {
                      return "Please enter phone";
                    } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                        .hasMatch(value)) {
                      return 'Please a valid mobile number';
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel("Cnic"),
                FormHelper.textInput(
                  context,
                  model!.cnic,
                  hintT: 'Enter a cnic',
                  (value) => {
                    model!.cnic = value,
                  },
                  onValidate: (value) {
                    if (value!.isEmpty) {
                      return "Please enter cnic";
                    } else if (value.length < 14) {
                      return "CNIC must be 13 charater";
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel("Shop Name"),
                FormHelper.textInput(
                  context,
                  model!.shopName,
                  hintT: 'Enter a shop name',
                  (value) => {
                    model!.shopName = value,
                  },
                  onValidate: (value) {
                    if (value!.isEmpty) {
                      return "Please enter shop name";
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel("Shop Address"),
                FormHelper.textInput(
                  context,
                  model!.shopAddress,
                  hintT: 'Enter a shop address',
                  (value) => {
                    model!.shopAddress = value,
                  },
                  onValidate: (value) {
                    if (value!.isEmpty) {
                      return "Please enter shop address";
                    }
                    return null;
                  },
                ),
                FormHelper.fieldLabel("Password"),
                FormHelper.textInput(
                    context,
                    model!.password,
                    hintT: 'Enter a password',
                    (value) => {
                          model!.password = value,
                        }, onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                    obscureText: hidePassword,
                    suffixIcon: IconButtonWidget(
                      onTap: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: hidePassword
                          ? Colors.grey
                          : Color(
                              0xff292665,
                            ),
                    )),
                FormHelper.fieldLabel("Confirm Password"),
                FormHelper.textInput(
                    context,
                    model!.cPassword,
                    hintT: 'Enter a confirm password',
                    (value) => {
                          model!.cPassword = value,
                        }, onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please enter confirm password';
                  } else if (model!.password != model!.cPassword) {
                    return "Password and confirm password does not match";
                  }
                  return null;
                },
                    obscureText: hidePassword1,
                    suffixIcon: IconButtonWidget(
                      onTap: () {
                        setState(() {
                          hidePassword1 = !hidePassword1;
                        });
                      },
                      icon: hidePassword1
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: hidePassword1
                          ? Colors.grey
                          : Color(
                              0xff292665,
                            ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(
                          context,
                        ).size.width *
                        .9,
                    height: MediaQuery.of(
                          context,
                        ).size.height *
                        .06,
                    child: FormHelper.saveButton('Register', () {
                      if (validateAndSave()) {
                        print(model!.toJson());
                        setState(() {
                          isApiCallProcess = true;
                        });
                        apiService!.postSignup(model!).then((ret) {
                          setState(() {
                            isApiCallProcess = false;
                          });

                          if (ret.status == '1') {
                            FormHelper.showMessage(context, 'Khoj Tech',
                                'Registration Successfull\nPlease Login', "Ok", () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
                            });
                          } else {
                            FormHelper.showMessage(context, 'Khoj Tech',
                                'Email address already registered', "Ok", () {
                              Navigator.of(context).pop();
                            });
                          }
                        });
                      }
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  AppBar AppbarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButtonWidget(
        onTap: () {
          Navigator.pop(context);
        },
        icon: Icons.arrow_back_ios,
        iconSize: 19,
        color: const Color(
          0xff414042,
        ),
      ),
      title: const TextWidget(
        text: 'Register now',
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Color(
          0xff414042,
        ),
      ),
    );
  }
}
