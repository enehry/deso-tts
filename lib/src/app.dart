import 'package:deso_tss/src/app/providers/ballot_id_provider.dart';
import 'package:deso_tss/src/app/providers/event_provider.dart';
import 'package:deso_tss/src/app/providers/navigation_provider.dart';
import 'package:deso_tss/src/app/utils/theme.dart';
import 'package:deso_tss/src/app/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => BallotIDProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EventProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const Wrapper(),
      ),
    );
  }
}
