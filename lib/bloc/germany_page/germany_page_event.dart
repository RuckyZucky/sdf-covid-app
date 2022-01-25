import 'package:sdf_covid/data/timeframe.dart';

abstract class GermanyPageEvent {}

class LoadGermanyPageData extends GermanyPageEvent {
  final TimeFrame? timeframe;

  LoadGermanyPageData({this.timeframe});
}
