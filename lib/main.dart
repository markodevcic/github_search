import 'package:flutter/material.dart';

import 'package:github_search/widgets/search_page.dart';
import 'package:github_search/widgets/list_page.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHun Search',
      theme: ThemeData.dark(),
      initialRoute: SearchPage.id,
      routes: {
        SearchPage.id: (context) => SearchPage(),
        ListPage.id: (context) => ListPage(),
      },
      home: SearchPage(),
    );
  }
}
