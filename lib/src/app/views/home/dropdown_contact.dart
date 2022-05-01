import 'package:deso_tss/src/app/models/contact.dart';
import 'package:deso_tss/src/app/providers/ballot_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownContacts extends StatelessWidget {
  const DropdownContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? _selectedContact =
        context.watch<BallotIDProvider>().selectedContact;

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: Theme.of(context).textTheme.headline5,
      isExpanded: true,
      icon: Icon(
        Icons.arrow_downward,
        color: Theme.of(context).colorScheme.primary,
      ),
      items: contacts
          .map((e) => DropdownMenuItem(value: e.number, child: Text(e.title)))
          .toList(),
      onChanged: (e) {
        context.read<BallotIDProvider>().setContact(e);
      },
      // check if contact is on array contacts
      value: _selectedContact != null &&
              contacts.any((e) => e.number == _selectedContact)
          ? _selectedContact
          : null,
    );
  }
}
