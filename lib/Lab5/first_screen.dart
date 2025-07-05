// import 'package:adv_flutter_lab/Lab5/second_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class FirstScreen extends StatelessWidget {
//   const FirstScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text("First Screen", style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.black,),
//       body: Center(
//         child: ElevatedButton(onPressed: (){
//           Get.to(SecondScreen(),transition: Transition.downToUp);
//         }, child: Text("Go to second screen")),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => HomeScreen(),
        middlewares: [MyMiddleware()],
      ),
      GetPage(name: '/welcome', page: () => WelcomeScreen()),
    ],
  ));
}

// Middleware class
class MyMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {

    bool firstTime = true;

    if (firstTime) {
      return RouteSettings(name: '/welcome');
    }
    return null;
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(child: Text("This is the Home Screen")),
    );
  }
}

// Redirected screen
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.offNamed('/home'),
          child: Text("Continue to Home"),
        ),
      ),
    );
  }
}
