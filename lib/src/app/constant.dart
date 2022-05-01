import 'package:deso_tss/src/app/models/contact.dart';
import 'package:deso_tss/src/app/models/event_code.dart';
import 'package:deso_tss/src/app/views/ed/ed.dart';
import 'package:deso_tss/src/app/views/fts/fts.dart';
import 'package:deso_tss/src/app/views/home/home.dart';

final views = [
  const Home(),
  const FTS(),
  const ED(),
];

final List<Contact> fContacts = [
  Contact(number: "8080", title: 'Globe/TM'),
  Contact(number: "4438", title: 'Smart/Talk N Text/Sun'),
];

final List<EventCode> fFTSEvents = [
  EventCode(title: 'Attendance of DESO TSS', code: 'FATTE'),
  EventCode(title: 'Ballot Box Reception', code: 'FBBRE'),
  EventCode(title: 'VCM Reception', code: 'FVCMR'),
  EventCode(title: 'Installation and Diagnostics', code: 'FINDI'),
  EventCode(title: 'Open Voting', code: 'FOPVO'),
  EventCode(title: 'Close Voting and Re-zero', code: 'FCVRZ'),
  EventCode(title: 'Sealing', code: 'FSEAL'),
];

final List<EventCode> fEdEvents = [
  EventCode(title: 'Attendance of DESO TSS', code: 'EATTE'),
  EventCode(title: 'Ballot Box Reception', code: 'EBARE'),
  EventCode(title: 'Installation', code: 'EINST'),
  EventCode(title: 'Initialization', code: 'EINIT'),
  EventCode(title: 'Open Voting', code: 'EOPVO'),
  EventCode(title: 'Close Voting', code: 'ECLVO'),
  EventCode(title: 'Transmission', code: 'ETRAN'),
  EventCode(title: 'Sealing', code: 'ESEAL'),
];
