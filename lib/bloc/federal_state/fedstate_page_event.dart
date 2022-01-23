import 'package:sdf_covid/pages/germany/timeframe.dart';
import 'package:sdf_covid/data/states.dart';

abstract class FedStatePageEvent{}

class LoadFedStatePageData extends FedStatePageEvent {
  final TimeFrame? timeframe;

  LoadFedStatePageData({this.timeframe});

}



