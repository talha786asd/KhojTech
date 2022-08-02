import 'package:flutter/material.dart';
import 'package:khoj_tech/widgets/icon_button_widget.dart';
import 'package:khoj_tech/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var name;
  var email;
  var phone;
  var shopName;
  var shopAddress;
  var cnic;

  getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nam = preferences.getString('name');
    setState(() {
      name = nam;
    });
    print(name);
    return name;
  }

  getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var emai = preferences.getString('email');
    setState(() {
      email = emai;
    });
    print(email);
    return email;
  }

  getPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var phon = preferences.getString('phone');
    setState(() {
      phone = phon;
    });
    print(phone);
    return phone;
  }

  getShopName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var shopNam = preferences.getString('shopName');
    setState(() {
      shopName = shopNam;
    });
    print(shopName);
    return shopName;
  }

  getShopAddress() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var shopAddre = preferences.getString('shopAddress');
    setState(() {
      shopAddress = shopAddre;
    });
    print(shopAddress);
    return shopAddress;
  }

  getCnic() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var cni = preferences.getString('cnic');
    setState(() {
      cnic = cni;
    });
    print(cnic);
    return cnic;
  }

  @override
  void initState() {
    getName();
    getEmail();
    getCnic();
    getPhone();
    getShopAddress();
    getShopName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            AppbarWidget(context).preferredSize.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              TextWidget(
                text: name.toString(),
                color: Color(
                  0xff292665,
                ),
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color(
                      0xff292665,
                    ),
                  ),
                  title: Text(
                    email.toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.phone,
                    color: Color(
                      0xff292665,
                    ),
                  ),
                  title: Text(
                    phone.toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Color(
                      0xff292665,
                    ),
                  ),
                  title: Text(
                    shopName.toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.location_city,
                    color: Color(
                      0xff292665,
                    ),
                  ),
                  title: Text(
                    shopAddress.toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Color(
                      0xff292665,
                    ),
                  ),
                  title: Text(
                    cnic.toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
        text: 'Profile',
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Color(
          0xff414042,
        ),
      ),
    );
  }
}
