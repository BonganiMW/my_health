import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        theme: ThemeData(primarySwatch: Colors.blueGrey));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animation;

  void inistate() {
    super.initState();
    (animController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );



    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Stack(fit: StackFit.expand, children: <Widget>[
        const Image(
          image: AssetImage("lib/assets/land.jpg"),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //WORKING HERE
            Transform.rotate(
              angle: animController.value,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                child: Image.asset("lib/assets/LOGO.png"),
              ),
            ),

            Form(
              child: Theme(
                data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.orange,
                    inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(
                            color: Colors.orange, fontSize: 20.0))),
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Enter Email",
                          hintText: "name@something.com",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Enter Password",
                          hintText: "Min 8 Characters",
                          hintStyle: TextStyle(color: Colors.red),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      MaterialButton(
                          color: Colors.orange,
                          textColor: Colors.white,
                          child: const Text("Login"),
                          onPressed: () => {}),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

}
