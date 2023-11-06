import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/Resourcefile/CustomContainer.dart';
import 'package:mvvm/Resourcefile/StringResource.dart';
import 'package:mvvm/Resourcefile/StyleResource.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  bool isConnected = true; // Initial assumption

  @override
  void initState() {
    super.initState();

    // Check for internet connectivity when the page is initialized
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    setState(() {
      isConnected = connectivityResult != ConnectivityResult.none;
      if (isConnected == true) {
        Navigator.of(context).pop();
      } else {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("No Internet Connection"),
      ),
      body: CustomContainer(
        gradientColors: [Colors.orange, Colors.pink],
        beginAlignment: Alignment.topLeft,
        endAlignment: Alignment.bottomRight,
        child: Center(
          child: isConnected
              ? Text("Internet is available")
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/image/rocket.png'),
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit
                          .cover, // Adjust the image fit within the widget
                    ),
                    Text(
                      StringResource.internet_start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, // You can add additional styling as needed
                      ),
                    ),
                    Text(
                      StringResource.internetcon,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      StringResource.internet_end,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: checkConnectivity,
                      child: Text("Try again"),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
