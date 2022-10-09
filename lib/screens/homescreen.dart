import 'package:flutter/material.dart';
import '../helpers/sliderightroute.dart';
import '../screens/loginscreen.dart';
import '../screens/membersscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.errMsg}) : super(key: key);
  final String errMsg;
  static const String _title = 'Home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: StatefulHomeWidget(
        errMsg: errMsg,
      ),
    );
  }
}

class StatefulHomeWidget extends StatefulWidget {
  const StatefulHomeWidget({Key? key, required this.errMsg}) : super(key: key);
  final String errMsg;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulHomeWidget> createState() =>
      _StatefulHomeWidget(errMsg: errMsg);
}

class _StatefulHomeWidget extends State<StatefulHomeWidget> {
  _StatefulHomeWidget({required this.errMsg});
  final String errMsg;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();

    if (errMsg.isNotEmpty) {
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errMsg),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //iconTheme: const IconThemeData(color: Color.fromARGB(255, 26, 255, 1)),
        title: const Text(
          'Flutter Home',
          style: TextStyle(
            height: 1.171875,
            fontSize: 18.0,
            fontFamily: 'Roboto Condensed',
            fontWeight: FontWeight.w500,
            //color: Color.fromARGB(255, 26, 255, 1),
          ),
        ),
        //backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: Drawer(
        child: Container(
          //color: const Color.fromARGB(255, 252, 142, 54),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'MENU',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      //color: Color.fromARGB(255, 26, 255, 1),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 6.0, color: Colors.blue),
                    bottom: BorderSide(width: 1.0, color: Colors.blue),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    'Members',
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        SlideRightRoute(
                            page: const MembersScreen(
                          errMsg: '',
                        )));
                  },
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 6.0, color: Colors.blue),
                    bottom: BorderSide(width: 1.0, color: Colors.blue),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      height: 1.171875,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () async {
                    final SharedPreferences prefs = await _prefs;
                    await prefs.remove('token');
                    //await storage.deleteAll();
                    Navigator.push(
                        context,
                        SlideRightRoute(
                            page: const LoginScreen(
                          errMsg: 'User logged out',
                        )));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome Home!\n',
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          style: TextStyle(
            height: 1.171875,
            fontSize: 18.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
