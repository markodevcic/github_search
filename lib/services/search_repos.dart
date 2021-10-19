import 'package:http/http.dart' show get;
import 'dart:convert';
import 'dart:async';

import 'package:github_search/models/data_model.dart';
import 'package:github_search/constants.dart';
import '../globals.dart';

class Search {
  Future<List<DataModel>> initPage(text) async {
    pageNumber = 1;
    searchText = text;
    String url = api + kSearchRepos + searchText + kSortByUpdated;

    var response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      for (var i in jsonData['items']) {
        DataModel item = DataModel(
            name: i['name'],
            description: i['description'] ?? '',
            lastUpdate: i['updated_at'],
            avatar: i['owner']['avatar_url'],
            ownerName: i['owner']['login'],
            repoUrl: i['html_url'],
            userUrl: i['owner']['html_url']);

        items.add(item);
      }
      // get total search pages
      int totalCount = jsonData['total_count'];
      totalPages = (totalCount / 30).ceil();
      if (totalPages == 0) pageNumber = 0;
      // maximum 1000 search results (GitHub API documentation)
      (totalPages > 34) ? totalPages = 34 : null;
      // if there is next page available
      (pageNumber == totalPages) ? hasNextPage = false : hasNextPage = true;
      // increment page number if there is next page available
      if (hasNextPage) pageNumber++;

      return items;
    } else {
      throw Exception('Failed to search Repos with status code ' +
          response.statusCode.toString());
    }
  }

  Future<List<DataModel>> nextPage() async {
    String url = api +
        kSearchRepos +
        searchText +
        kSortByUpdated +
        kPageNumber +
        pageNumber.toString();

    var response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      for (var i in jsonData['items']) {
        DataModel item = DataModel(
            name: i['name'],
            description: i['description'] ?? '',
            lastUpdate: i['updated_at'],
            avatar: i['owner']['avatar_url'],
            ownerName: i['owner']['login'],
            repoUrl: i['html_url'],
            userUrl: i['owner']['html_url']);
        items.add(item);
      }
      (pageNumber == totalPages) ? hasNextPage = false : hasNextPage = true;
      if (hasNextPage) pageNumber++;

      return items;
    } else {
      throw Exception(
          'Failed to search Repos with status code ${response.statusCode.toString()}');
    }
  }
}
