import 'package:deso_tss/src/app/models/contact.dart';
import 'package:deso_tss/src/app/providers/ballot_id_provider.dart';
import 'package:deso_tss/src/app/views/home/ballot_ids.dart';
import 'package:deso_tss/src/app/views/home/contact_number.dart';
import 'package:deso_tss/src/app/views/home/dropdown_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Home',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Manage where to send and save your ballot ids as part of event code.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const ContactNumber(),
              const SizedBox(
                height: 10.0,
              ),
              const DropdownContacts(),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'My Ballot IDS',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                )),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'You can add and remove your ballot ids here.',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: const Color(0xFF1A434E),
                      ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Expanded(
                  child: BallotIDS(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
