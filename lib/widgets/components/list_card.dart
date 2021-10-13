import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:github_search/models/data_model.dart';
import 'package:github_search/services/datetime_converter.dart';
import 'package:github_search/widgets/user_details_page.dart';

class ListCard extends StatelessWidget {
  ListCard({Key? key, required this.index, required this.dataModel})
      : super(key: key);

  int index;
  List<DataModel> dataModel;

  @override
  Widget build(BuildContext context) {
    final lastUpdated = DatetimeConverter(dataModel, index).convert();

    return Card(
      color: const Color(0xFF323232),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: dataModel[index].avatar,
          width: 56,
          height: 56,
          placeholder: (context, url) => const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 0.5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          dataModel[index].name,
          style: TextStyle(fontSize: 18, color: Colors.grey.shade50),
        ),
        subtitle: Text(
          lastUpdated,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserDetailsPage(
                        avatar: dataModel[index].avatar,
                        ownerName: dataModel[index].ownerName,
                        name: dataModel[index].name,
                        lastUpdate: lastUpdated,
                        description: dataModel[index].description,
                      )));
        },
      ),
    );
  }
}
