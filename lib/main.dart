import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String mailAddress = 'flutter.database@gmail.com';
  final String mailTitle = '件名です';
  final String mailContents = 'メール本体です';
  final String webSite = 'http://twitter.com/EmilyShibuya';

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw '${url}が立ち上がりません';
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blue.shade50,
            appBar: AppBar(
              backgroundColor: Colors.blue.shade50,
              title: Text(
                "My Profile",
                style: TextStyle(color: Colors.red),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            overlayColor: Colors.transparent,
                            backgroundColor: Colors.transparent),
                        onPressed: () {
                          print('object');
                        },
                        child: Image.asset(
                          "assets/013.BMP",
                          height: 30,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Emily Shinbuya"),
                    Text("Emily Shinbuya"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("所属"),
                        Text("株式会社"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("電話"), Text("090-xxx-xxxx")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("メール"),
                        Text("ooo@ooo.oooo"),
                        TextButton(
                            onPressed: () async {
                              launchURL(
                                  'mailto:${mailAddress}?subject=${mailTitle}&body=${mailContents}');
                            },
                            child: Icon(Icons.mail))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("HP:"),
                        Text(webSite),
                        TextButton(
                            onPressed: () async {
                              launchUrl(Uri.parse(webSite));
                            },
                            child: Icon(Icons.public))
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/013.BMP",
                          height: 300,
                        ),
                        Positioned(
                          left: 0,
                          top: 00,
                          child: TextButton(
                            onPressed: () {
                              print('Button 1 pressed');
                            },
                            child: Container(
                              width: 300,
                              height: 300,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
