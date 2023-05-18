import 'package:flutter/material.dart';
import 'package:flutter_multipagos/flutter_multipagos.dart';
import 'package:flutter_multipagos/multipagos_requets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo multipagos',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter demo multipagos'),
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
  final String url = "URL PROPORCIONADO POR MULTIPAGOS";

  final requestMultipagos = MultipagosRequest(
    mpAccount: "1",
    mpNode: "1",
    mpOrder: "1",
    mpReference: "1",
    mpConcept: "1",
    mpProduct: "1",
    mpAmount: "100.00",
    mpCurrency: "1",
    mpSignature:
        "b3f5f7431983df4892b572e4dd0c16817e76077e0b668cd53786e470860567f8",
    mpUrlFailure: "URL Pago no  exitoso del cliente",
    mpUrlsucces: "URL Pago exitoso del cliente",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Multipagos(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              title: Text(widget.title),
            ),
            title: widget.title,
            multipagos: requestMultipagos,
            actionSuccess: () {
              print("Succes");
              Navigator.pop(context);
            },
            actionFail: () {
              print("Fail");
              Navigator.pop(context);
            },
            bbvaEnv: url));
  }
}
