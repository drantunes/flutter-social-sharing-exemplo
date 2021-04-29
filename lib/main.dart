import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Sharing Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Social Sharing Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width - 50;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size,
              child: ElevatedButton.icon(
                onPressed: () {
                  SocialShare.shareSms('Teste!');
                },
                icon: Icon(Icons.message),
                label: Text('Share via SMS'),
              ),
            ),
            SizedBox(
              width: size,
              child: ElevatedButton.icon(
                onPressed: () {
                  SocialShare.shareOptions('Teste!');
                },
                icon: Icon(Icons.share),
                label: Text('Share via Options'),
              ),
            ),
            SizedBox(
              width: size,
              child: ElevatedButton.icon(
                onPressed: () {
                  SocialShare.copyToClipboard('Teste!');
                },
                icon: Icon(Icons.content_copy),
                label: Text('Copy to Clipboard'),
              ),
            ),
            SizedBox(
              width: size,
              child: ElevatedButton.icon(
                onPressed: () async {
                  var teste = await SocialShare.checkInstalledAppsForShare();
                  print(teste);
                },
                icon: Icon(Icons.apps),
                label: Text('Apps to Share'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
