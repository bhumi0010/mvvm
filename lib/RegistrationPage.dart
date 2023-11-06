import 'package:flutter/material.dart';
import 'package:mvvm/LoginPage.dart';
import 'package:mvvm/Resourcefile/CustomButton.dart';
import 'package:mvvm/Resourcefile/CustomContainer.dart';
import 'package:mvvm/Resourcefile/CustomTextField.dart';
import 'package:mvvm/Resourcefile/StringResource.dart';
import 'package:mvvm/Resourcefile/StyleResource.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _txtusername = TextEditingController();
  TextEditingController _txtpassword = TextEditingController();
  TextEditingController _txtemail = TextEditingController();
  TextEditingController _txtcontactno = TextEditingController();

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
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Center(
                    child: Text(
                      StringResource.registrationpage,
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
                      style: StyleResource.txtsty,
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
                        StringResource.emailid,
                        style: StyleResource.txtsty,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextField(
                    controller: _txtemail,
                    labelText: StringResource.emailid, // Label text
                    hintText: StringResource.hintemailid, // Placeholder text
                    prefixIcon: Icons.email,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        StringResource.contactno,
                        style: StyleResource.txtsty,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextField(
                    controller: _txtcontactno,
                    labelText: StringResource.contactno, // Label text
                    hintText: StringResource.hintcontactno, // Placeholder text
                    prefixIcon: Icons.phone,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        StringResource.password,
                        style: StyleResource.txtsty,
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
                      text: StringResource.registrationpage,
                      onPressed: () {},
                    )),
                Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: RichText(
                        text: TextSpan(
                          style: StyleResource.txtsty,
                          children: [
                            TextSpan(
                              text: StringResource.linkregistration,
                            ),
                            TextSpan(
                              text: StringResource.Loginpage,
                              style: TextStyle(
                                color: Color(
                                    0xFF336699), // Style for the word "LOGIN"
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
