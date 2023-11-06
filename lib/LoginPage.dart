import 'package:flutter/material.dart';
import 'package:mvvm/RegistrationPage.dart';
import 'package:mvvm/Resourcefile/CustomButton.dart';
import 'package:mvvm/Resourcefile/CustomContainer.dart';
import 'package:mvvm/Resourcefile/CustomTextField.dart';
import 'package:mvvm/Resourcefile/StringResource.dart';
import 'package:mvvm/Resourcefile/StyleResource.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _txtusername = TextEditingController();
  TextEditingController _txtpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: CustomContainer(
            gradientColors: [Colors.orange, Colors.pink],
            beginAlignment: Alignment.topLeft,
            endAlignment: Alignment.bottomRight,
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: Center(
                    child: Text(
                      StringResource.Loginpage,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      StringResource.username,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextField(
                    controller: _txtusername,
                      labelText: StringResource.username, // Label text
                      hintText: StringResource.hintusername, // Placeholder text
                      prefixIcon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        StringResource.password,
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextField(
                    controller: _txtpassword,
                    labelText: StringResource.password,
                    hintText: StringResource.hintpassword,
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: StringResource.Loginpage,
                      onPressed: () {

                      },
                    )
                ),
                Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      },
                      child: RichText(
                        text: TextSpan(
                          style: StyleResource.txtsty,
                          children: [
                            TextSpan(
                              text: StringResource.linklogin,
                            ),
                            TextSpan(
                              text: StringResource.registrationpage,
                              style: TextStyle(
                                color:Color(0xFF336699), // Style for the word "LOGIN"
                                fontWeight: FontWeight
                                    .bold, // You can add additional styling as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
