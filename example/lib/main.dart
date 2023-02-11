import 'package:flutter/material.dart';
import 'package:node_flow/node_flow.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dashboard dashboard = Dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(30.0),

        // child: Container(color: Colors.amber),

        child: Container(
          constraints: const BoxConstraints.expand(),
          child: NodeFlow(
            dashboard: dashboard,
            onDashboardTapped: ((context, position) {
              debugPrint('Dashboard tapped $position');
            }),
            onDashboardLongtTapped: ((context, position) {
              debugPrint('Dashboard long tapped $position');
            }),
            onElementLongPressed: (context, position, element) {
              debugPrint('Element with "${element.text}" text '
                  'long pressed');
            },
            onElementPressed: (context, position, element) {
              debugPrint('Element with "${element.text}" text pressed');
            },
            onHandlerPressed: (context, position, handler, element) {
              debugPrint('handler pressed: position $position '
                  'handler $handler" of element $element');
            },
            onHandlerLongPressed: (context, position, handler, element) {
              debugPrint('handler long pressed: position $position '
                  'handler $handler" of element $element');
            },
          ),
        ),
      ),
    );
  }
}
