import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double myTurn = 0.0;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        myTurn = 20;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: Colors.deepOrangeAccent,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 4)),
              child: AnimatedRotation(
                turns: myTurn,
                duration: Duration(seconds: 60),
                child: Stack(
                    children: List.generate(13, (index) {
                  return Center(
                    child: Transform.rotate(
                      angle: index * 0.26,
                      child: Container(
                        height: 4,
                        width: 120,
                        color: Colors.blue,
                      ),
                    ),
                  );
                })),
              ),
            ),
          ),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
        ),
      ]),
    );
  }
}
