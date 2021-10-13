import 'package:flutter/material.dart';

import 'package:github_search/models/data_model.dart';
import 'package:github_search/services/search_repos.dart';
import 'package:github_search/globals.dart';
import 'bottom_loading_indicator.dart';
import 'list_card.dart';

class BuildRepoList extends StatefulWidget {
  BuildRepoList({Key? key}) : super(key: key);

  @override
  State<BuildRepoList> createState() => BuildRepoListState();
}

// displaying a list of searched result
class BuildRepoListState extends State<BuildRepoList> {
  final Search searchRepo = Search();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<DataModel>>(
          future: (switchSearchFunction)
              ? searchRepo.nextPage()
              : searchRepo.initPage(searchText),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  var metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    if (metrics.pixels == 0) {
                      print('at the top');
                    } else {
                      if (hasNextPage) {
                        switchSearchFunction = true;
                        setState(() {});
                      }
                      print('at the bottom');
                    }
                  }
                  return true;
                },
                // whether there are repos or not
                child: (totalPages != 0)
                    ? ListView(
                        children: [
                          ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            cacheExtent: 100,
                            itemBuilder: (context, index) {
                              return ListCard(
                                  index: index, dataModel: snapshot.data);
                            },
                            itemCount: snapshot.data.length,
                          ),
                          if (hasNextPage && pageNumber != 1)
                            bottomLoadingIndicator(),
                        ],
                      )
                    : const Center(
                        child: Text('No results found',
                            style: TextStyle(fontSize: 18)),
                      ),
              );
            } else if (snapshot.hasError) {
              return Center(child: (Text('${snapshot.error}')));
            }
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          },
        ),
      ],
    );
  }
}
