import 'package:flutter/material.dart';

import 'package:github_search/widgets/components/search_text_field.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  static const String id = 'SearchPage';
  bool showSearchTextField = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // focus on searchTextField or outside of it
        FocusScope.of(context).unfocus();
        showSearchTextField = false;
      },
      child: Scaffold(
        appBar:
            AppBar(title: const Text('GitHeb Repo Search'), centerTitle: true),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/github.png',
                  scale: 3,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchTextField(showSearchTextField: showSearchTextField),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
