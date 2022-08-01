import 'package:flutter/material.dart';
import 'package:khoj_tech/pages/login_page.dart';
import 'package:khoj_tech/pages/profile_page.dart';
import 'package:khoj_tech/widgets/text_button_widget.dart';
import 'package:khoj_tech/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            AppbarWidget(context).preferredSize.height,
        color: const Color(0xfff2f2f2),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/Order");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: MediaQuery.of(context).size.height * .09,
                width: MediaQuery.of(context).size.width * .9,
                child: const Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Color(
                        0xff292665,
                      ),
                      size: 28,
                    ),
                    title: TextWidget(
                      text: "Orders",
                      color: Color(
                        0xff414042,
                      ),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Color(
                        0xff414042,
                      ),
                      size: 27,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              height: MediaQuery.of(context).size.height * .09,
              width: MediaQuery.of(context).size.width * .9,
              child: const Center(
                child: ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Color(0xff292665),
                    size: 28,
                  ),
                  title: TextWidget(
                    text: "Help",
                    color: Color(0xff414042),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color(0xff414042),
                    size: 27,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              height: MediaQuery.of(context).size.height * .09,
              width: MediaQuery.of(context).size.width * .9,
              child:   Center(
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));

                  },
                  leading: Icon(
                    Icons.account_circle,
                    color: Color(0xff292665),
                    size: 28,
                  ),
                  title: TextWidget(
                    text: "Profile",
                    color: Color(0xff414042),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color(0xff414042),
                    size: 27,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5,),
              ),
              height: MediaQuery.of(context).size.height * .09,
              width: MediaQuery.of(context).size.width * .9,
              child: const Center(
                child: ListTile(
                  leading: Icon(
                    Icons.circle,
                    color: Color(
                      0xff292665,
                    ),
                    size: 28,
                  ),
                  title: TextWidget(
                    text: "Coupons",
                    color: Color(
                      0xff414042,
                    ),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color(
                      0xff414042,
                    ),
                    size: 27,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              height: MediaQuery.of(context).size.height * .09,
              width: MediaQuery.of(context).size.width * .9,
              child: const Center(
                child: ListTile(
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Color(
                      0xff292665,
                    ),
                    size: 28,
                  ),
                  title: TextWidget(
                    text: "My Items",
                    color: Color(0xff414042,),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: Color(
                      0xff414042,
                    ),
                    size: 27,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .035,
            ),
            TextButtonWidget(
              onTap: () async{
                SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('userEmail');
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
              },
              text: "Logout",
              color: const Color(
                0xff414042,
              ),
              fontSize: 18,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
          ],
        ),
      ),
    );
  }

  AppBar AppbarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const TextWidget(
        text: 'Account',
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Color(
          0xff414042,
        ),
      ),
    );
  }
}
