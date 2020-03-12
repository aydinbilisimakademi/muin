import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muin/CoreUtils/router.dart';
import 'package:muin/CoreUtils/routing_constants.dart';
import 'package:provider/provider.dart';
import 'package:muin/states/state_user.dart';

void main() {
  //rotetion u durdurmak
  //kaynak
  //https://stackoverflow.com/questions/49418332/flutter-how-to-prevent-device-orientation-changes-and-force-portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MuinApp());
}

class MuinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StateUser()),
      ],
      child: MaterialApp(
        title: "Muin App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Color.fromARGB(255, 27, 23, 43),
          scaffoldBackgroundColor: Color.fromARGB(255, 27, 23, 43),
          appBarTheme: AppBarTheme(color: Colors.pink),
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: PageRouteLogin,
      ),
    );
  }
}
