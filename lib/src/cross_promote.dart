library cross_promote;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class CrossPromote extends StatefulWidget {
  final String iosUrl;
  final String androidUrl;

  const CrossPromote({Key key, this.iosUrl, this.androidUrl}) : super(key: key);

  @override
  _CrossPromoteState createState() => _CrossPromoteState();
}

class _CrossPromoteState extends State<CrossPromote> {
  List<String> data;
  List<String> appTitles;
  List<String> appCategory;
  List<String> appIcons;
  int get appCount => (data.length / 2).round();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (data == null)
          ? Container()
          : ListView.builder(
              itemCount: appCount,
              itemBuilder: (context, index) {
                return Row(
                  children: <Widget>[
                    Image.network(
                        "https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/7e/eb/4a/7eeb4a88-db9d-2215-0d6b-8371326c266a/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-85-220.png/146x0w.jpg"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(appTitles[index]),
                        Text(appCategory[index]),
                      ],
                    ),
                  ],
                );
              }),
    );
  }

  Future<void> getData() async {
    appTitles = [];
    appCategory = [];
    appIcons = [];

    http.Response response = await http.get(widget.iosUrl);
    dom.Document document = parser.parse(response.body);
    setState(() {
      data = document.getElementsByClassName('targeted-link__target').map((e) {
        if (e.classes.contains("we-lockup__subtitle")) {
          appCategory.add(e.innerHtml);
          print("yar");
        } else {
          appTitles.add(e.innerHtml);
          print("asdkj");
        }

        return e.innerHtml;
      }).toList();
      print("getting images");
      print(document.getElementsByClassName("we-artwork__image"));
    });
    document.getElementsByClassName("we-artwork__image").map((e) {
      appIcons.add(e.toString());
      print("ho");
    });
  }
}
