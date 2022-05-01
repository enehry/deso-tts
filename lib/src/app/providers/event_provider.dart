import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class EventProvider with ChangeNotifier {
  final List<String> _selectedBallotIds = [];
  String? _ftsCode;

  UnmodifiableListView<String> get selectedBallotIds =>
      UnmodifiableListView(_selectedBallotIds);

  String? get ftsCode => _ftsCode;

  void setFTSCode(String? ftsCode) {
    _ftsCode = ftsCode;
    notifyListeners();
  }

  void setSelectedBallotIds(List<String> selectedBallotIds) {
    _selectedBallotIds.clear();
    _selectedBallotIds.addAll(selectedBallotIds);
    notifyListeners();
  }

  Future<void> sendSMS(String contact) async {
    if (await Telephony.instance.requestPhoneAndSmsPermissions ?? false) {
      for (var id in _selectedBallotIds) {
        final message = '$_ftsCode $id';
        await Telephony.instance
            .sendSms(to: contact.toString(), message: message);
      }
    }
  }

  void softReset() {
    _selectedBallotIds.clear();
    _ftsCode = null;
    notifyListeners();
  }
}
