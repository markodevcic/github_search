class DataModel {
  final String name;
  final String description;
  final String lastUpdate;
  final String avatar;
  final String ownerName;
  final String repoUrl;
  final String userUrl;

  DataModel(
      {required this.name,
      required this.description,
      required this.lastUpdate,
      required this.avatar,
      required this.ownerName,
      required this.repoUrl,
      required this.userUrl});
}
