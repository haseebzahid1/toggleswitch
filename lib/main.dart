import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Switch Example';
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MainPage(title: title),
    );
  }
}


class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool value = true;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                value ? "assets/images/on.png" : "assets/images/off.png",
                height: 300,
              ),
              Spacer(),
              buildPlatforms(),////////////// buildplaform
              const SizedBox(height: 12),
              buildHeader(text: 'Adaptive', child: buildSwitch(),), /////build switch
              const SizedBox(height: 12),
              buildHeader(child: Container(), text: "Android Image"),
              const SizedBox(height: 12),
            ],
          ),
        ),
      );

  Widget buildPlatforms() =>
      Row(
        children: [
          Expanded(child: buildHeader(text: 'Android', child: Container()),),
          Expanded(child: buildHeader(text: 'iOS', child: Container()),),
        ],
      );

  Widget buildHeader({
    required Widget child,
    required String text,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          const SizedBox(height: 8),
          child,
        ],
      );

  Widget buildSwitch() =>
      Transform.scale(
        scale: 2,
        child: Switch.adaptive(
          // thumbColor: MaterialStateProperty.all(Colors.red),
          // trackColor: MaterialStateProperty.all(Colors.orange),
          // activeColor: Colors.blueAccent,
          // activeTrackColor: Colors.blue.withOpacity(0.4),
          // inactiveThumbColor: Colors.orange,
          // inactiveTrackColor: Colors.black87,
          splashRadius: 50,
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      );
}