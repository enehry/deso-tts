import 'package:deso_tss/src/app/components/dropdown_events.dart';
import 'package:deso_tss/src/app/components/grid_ballot_id.dart';
import 'package:deso_tss/src/app/providers/ballot_id_provider.dart';
import 'package:deso_tss/src/app/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemplateSMS extends StatelessWidget {
  const TemplateSMS({Key? key, required this.subtitle, required this.title})
      : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final _code = context.watch<EventProvider>().ftsCode;
    final _selectedBallotIds = context.watch<EventProvider>().selectedBallotIds;
    final _contact = context.watch<BallotIDProvider>().selectedContact;

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
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Use only this event code for $title',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 10.0,
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
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // get all selected ballot
                final _contact =
                    context.read<BallotIDProvider>().selectedContact;
                final ballotIds = context
                    .read<BallotIDProvider>()
                    .ballotIDObjects
                    .where((e) => e.isSelected);
                context
                    .read<EventProvider>()
                    .setSelectedBallotIds(ballotIds.map((e) => e.id).toList());
                // check if ballot ids are empty
                if (_contact == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Please select where to send the codes',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  );
                } else if (context
                    .read<EventProvider>()
                    .selectedBallotIds
                    .isEmpty) {
                  // show snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Please add at least one ballot id',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  );
                } else if (context.read<EventProvider>().ftsCode?.isEmpty ??
                    true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Please select $subtitle event',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  );
                } else {
                  // show dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            const Icon(
                              Icons.info_outline_rounded,
                              color: Colors.green,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Notice',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: _contact.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )
                                ],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.0,
                                    ),
                                text:
                                    'Are you sure you want to send the following codes to ',
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ...ballotIds.map(
                              (e) => Text(
                                '$_code $e',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: const Text('CANCEL'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('YES'),
                            onPressed: () async {
                              // set fts status to true
                              await context
                                  .read<EventProvider>()
                                  .sendSMS(_contact);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                    'Sent successfully',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              );
                              context.read<BallotIDProvider>().softReset();
                              context.read<EventProvider>().softReset();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Please select at least one ballot id. (this is a part of the code for sending $subtitle events). Highlighted means selected, re select to un select the id.',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: const Color(0xFF1A434E),
                          ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const GridBallotId(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    DropdownEvents(
                      subtitle: subtitle,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                        '$subtitle Event Code that will be send to ${_contact ?? '<Please select a contact>'}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ...context
                        .watch<BallotIDProvider>()
                        .ballotIDObjects
                        .where((e) => e.isSelected)
                        .map(
                          (e) => Text(
                            '${context.watch<EventProvider>().ftsCode ?? '<Code>'} ${e.id}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
