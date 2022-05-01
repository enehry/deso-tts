import 'dart:convert';

import 'package:deso_tss/src/app/constant.dart';

class Contact {
  final String title;
  final String number;

  Contact({required this.title, required this.number});
}

final List<Contact> contacts = fContacts;
