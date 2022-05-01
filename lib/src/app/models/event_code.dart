import 'package:deso_tss/src/app/constant.dart';
import 'package:deso_tss/src/app/views/fts/fts.dart';

class EventCode {
  final String title;
  final String code;

  EventCode({required this.title, required this.code});
}

final List<EventCode> ftsEvents = fFTSEvents;

final List<EventCode> edEvents = fEdEvents;
