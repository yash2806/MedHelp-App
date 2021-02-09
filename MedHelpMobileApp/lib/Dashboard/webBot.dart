import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webBot extends StatefulWidget {
  @override
  _webBotState createState() => _webBotState();
}

class _webBotState extends State<webBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: InkWell(
         onTap: (){
           Navigator.pop(context);
         },
         child: Icon(Icons.arrow_back)),
       title: Text("Bot Sirius"),
       centerTitle: true,
      ),
      body: WebView(
        
  initialUrl: 'https://web-chat.global.assistant.watson.cloud.ibm.com/preview.html?region=eu-gb&integrationID=4a31c873-7b84-4590-a40c-b06233548c2a&serviceInstanceID=90a02b3c-bc31-4879-8fd8-fca73a3a73f9',
  javascriptMode: JavascriptMode.unrestricted,

      ),

    );
  }
}