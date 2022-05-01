import 'package:deso_tss/src/app/models/event_code.dart';
import 'package:deso_tss/src/app/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownEvents extends StatelessWidget {
  const DropdownEvents({Key? key, required this.subtitle}) : super(key: key);
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    final events = subtitle == 'ED' ? edEvents : ftsEvents;

    return DropdownButtonFormField<String>(
        value: context.watch<EventProvider>().ftsCode,
        decoration: InputDecoration(
          label: Text(
            '$subtitle Event',
            style: Theme.of(context).textTheme.headline4,
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 15.0,
          ),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 5.0,
            ),
          ),
        ),
        style: Theme.of(context).textTheme.headline4,
        isExpanded: true,
        icon: Icon(
          Icons.arrow_downward,
          color: Theme.of(context).colorScheme.primary,
        ),
        items: events
            .map(
              (e) => DropdownMenuItem(
                value: e.code,
                child: Text(
                  '${e.title} - ${e.code}',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            )
            .toList(),
        onChanged: (e) => context.read<EventProvider>().setFTSCode(e));
  }
}
