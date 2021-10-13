import 'package:flutter/material.dart';
import 'package:github_search/widgets/components/build_repo_list.dart';

import 'package:github_search/widgets/search_page.dart';
import '../globals.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key}) : super(key: key);
  static const String id = 'ListPage';
  // page holds widgets to build list that will be displayed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'logo',
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset(
              'images/github.png',
            ),
          ),
        ),
        title: const Text('Available Repos'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              items = [];
              hasNextPage = false;
              switchSearchFunction = false;
              pageNumber = 1;
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(SearchPage.id, (route) => false);
            },
          ),
        ],
      ),
      // displaying a list
      body: BuildRepoList(),
    );
  }
}
