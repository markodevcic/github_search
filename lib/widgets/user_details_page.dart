import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage(
      {Key? key,
      required this.avatar,
      required this.ownerName,
      required this.name,
      required this.lastUpdate,
      required this.description,
      required this.repoUrl,
      required this.userUrl})
      : super(key: key);
  String avatar;
  String ownerName;
  String name;
  String lastUpdate;
  String description;
  String repoUrl;
  String userUrl;

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text(ownerName),
          onTap: () {
            print(userUrl);
            launchUrl(userUrl);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Image.network(
              avatar,
              height: 128,
              width: 128,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: InkWell(
              onTap: () {
                print(repoUrl);
                launchUrl(repoUrl);
              },
              child: Text(
                name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 26, color: Colors.grey.shade50),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 20),
            child: Text(
              lastUpdate,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade300),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: Text(
                      (description.isEmpty) ? 'No description' : description,
                      textAlign: (description.isEmpty)
                          ? TextAlign.center
                          : TextAlign.start,
                      softWrap: true,
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade100),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
