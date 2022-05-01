import 'package:deso_tss/src/app/components/template_sms.dart';
import 'package:flutter/material.dart';
import 'package:deso_tss/src/app/utils/same_date.dart';

class FTS extends StatelessWidget {
  const FTS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !(DateTime.now().isSameDate(DateTime.utc(2022, 5, 3)) ||
            DateTime.now().isSameDate(DateTime.utc(2022, 5, 4)) ||
            DateTime.now().isSameDate(DateTime.utc(2022, 5, 6)))
        ? const TemplateSMS(subtitle: 'FTS', title: 'FInal Testing & Sealing')
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Text(
                'This page can be only access on the Final Testing & Sealing day MAY 4, 2022',
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
