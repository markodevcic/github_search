import 'package:github_search/models/data_model.dart';
import 'package:intl/intl.dart';

class DatetimeConverter {
  final List<DataModel> dataModel;
  final int index;

  DatetimeConverter(this.dataModel, this.index);

  String convert() {
    var dateTime = dataModel[index].lastUpdate;
    var dateTimeParsed = DateTime.parse(dateTime);
    var dateName = DateFormat.MMMM().format(dateTimeParsed);
    var dateFormat = DateFormat('dd yyyy');
    var timeFormat = DateFormat('HH:mm');
    var outputDate = dateFormat.format(dateTimeParsed);
    var outputTime = timeFormat.format(dateTimeParsed);
    var lastUpdated = 'Last updated on $dateName $outputDate at $outputTime';

    return lastUpdated;
  }
}
