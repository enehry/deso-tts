import 'package:deso_tss/src/app/components/template_sms.dart';
import 'package:flutter/material.dart';
import 'package:deso_tss/src/app/utils/same_date.dart';

class ED extends StatelessWidget {
  const ED({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !(DateTime.now().isSameDate(DateTime.utc(2022, 5, 8)) ||
            DateTime.now().isSameDate(DateTime.utc(2022, 5, 9)) ||
            DateTime.now().isSameDate(DateTime.utc(2022, 5, 10)))
        ? const TemplateSMS(
            title: 'Election Day',
            subtitle: 'ED',
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Text(
                'This page can be only access on the election day MAY 9, 2022',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          );
  }
}
