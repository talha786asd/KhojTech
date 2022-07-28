import 'package:flutter/material.dart';
import 'package:khoj_tech/utils/ProgressHUD.dart';
import 'package:khoj_tech/widgets/icon_button_widget.dart';
import 'package:khoj_tech/widgets/text_widget.dart';

class BasePage extends StatefulWidget {
    BasePage({Key? key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  bool? isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ProgressHUD(
        child: pageUI(),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    );
  }

  Widget pageUI() {
    return null!;
  }

  PreferredSizeWidget? _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButtonWidget(
        onTap: () {
          Navigator.pop(
            context,
          );
        },
        icon: Icons.arrow_back_ios,
        iconSize: 19,
        color: const Color(
          0xff414042,
        ),
      ),
      title: const TextWidget(
        text: 'Khoj Tech',
        overflow: TextOverflow.ellipsis,
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Color(
          0xff414042,
        ),
      ),
    
    );
  }
}
