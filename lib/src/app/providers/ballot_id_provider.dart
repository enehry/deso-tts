import 'dart:collection';
import 'package:deso_tss/src/app/models/ballot_id.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BallotIDProvider with ChangeNotifier {
  late final SharedPreferences _prefs;
  final String _ballotKey = 'ballot_ids';
  final String _contactKey = 'contact';
  String? _selectedContact;

  List<String> _ballotIDs = [];
  UnmodifiableListView<String> get ballotIDs =>
      UnmodifiableListView(_ballotIDs);
  final List<BallotID> _ballotIDObjects = [];

  UnmodifiableListView<BallotID> get ballotIDObjects =>
      UnmodifiableListView(_ballotIDObjects);

  String? get selectedContact => _selectedContact;

  BallotIDProvider() {
    init();
  }

  void init() async {
    _prefs = await SharedPreferences.getInstance();
    _selectedContact = _prefs.getString(_contactKey);

    _ballotIDs = _prefs.getStringList(_ballotKey) ?? [];
    _ballotIDs.sort();
    _ballotIDs
        .map((id) => BallotID(id: id))
        .forEach((id) => _ballotIDObjects.add(id));
    notifyListeners();
  }

  void addBallotID(String id) async {
    // sort ids after adding
    _ballotIDs.add(id);
    _ballotIDObjects.add(BallotID(id: id));
    _ballotIDs.sort();
    _prefs.setStringList(_ballotKey, _ballotIDs);
    notifyListeners();
  }

  void deleteBallotID(String id) async {
    _ballotIDs.remove(id);
    _ballotIDObjects.removeWhere((ballotID) => ballotID.id == id);
    _prefs.setStringList(_ballotKey, _ballotIDs);
    notifyListeners();
  }

  void selectBallotID(String id) {
    for (var ballotID in _ballotIDObjects) {
      if (ballotID.id == id) {
        ballotID.select();
      }
    }
    notifyListeners();
  }

  void setContact(String? contact) {
    if (contact == null) {
      _prefs.remove(_contactKey);
    } else {
      _prefs.setString(_contactKey, contact);
      _selectedContact = contact;
      notifyListeners();
    }
  }

  void softReset() {
    // set to false selected ballot ids
    for (var ballotID in _ballotIDObjects) {
      ballotID.isSelected = false;
    }
    notifyListeners();
  }
}
