import 'package:sdf_covid/data/states.dart';
import 'package:sdf_covid/data/timeframe.dart';

abstract class FedStatePageEvent{}

class LoadFedStatePageData extends FedStatePageEvent {
  final TimeFrame? timeframe;
  final FederalState? federalState;

  LoadFedStatePageData({this.timeframe,this.federalState});
}



