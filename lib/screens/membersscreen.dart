import 'dart:convert';

import 'package:flutter/material.dart';
import '../helpers/sliderightroute.dart';
import '../helpers/constants.dart';
import '../models/members.dart';
import '../screens/addmemberscreen.dart';
import '../screens/homescreen.dart';
import '../screens/loginscreen.dart';
import '../services/api_service.dart';
import '../widgets/memberlistwidget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({Key? key, required this.errMsg}) : super(key: key);
  final String errMsg;
  static const String _title = 'Members';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: StatefulMembersWidget(
        errMsg: errMsg,
      ),
    );
  }
}

class StatefulMembersWidget extends StatefulWidget {
  const StatefulMembersWidget({Key? key, required this.errMsg})
      : super(key: key);
  final String errMsg;

  @override
  // ignore: no_logic_in_create_state
  State<StatefulMembersWidget> createState() =>
      _StatefulMembersWidget(errMsg: errMsg);
}

class _StatefulMembersWidget extends State<StatefulMembersWidget> {
  _StatefulMembersWidget({required this.errMsg});
  final String errMsg;
  final ApiService api = ApiService();
  late List<Members> members = [];
  final Uri _url = Uri.parse('${Constants.BASE_URL}/members/download/excel');

  Future<void> _launchUrl() async {
    if (!await launchUrl(
      _url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $_url';
    }
  }

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

  Future<Response> get listMembers async {
    EasyLoading.show();
    return await api.getMemberList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Members',
          style: TextStyle(
            height: 1.171875,
            fontSize: 18.0,
            fontFamily: 'Roboto Condensed',
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pushReplacement(
              context,
              SlideRightRoute(
                  page: const HomeScreen(
                errMsg: '',
              ))),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.download,
            ),
            onPressed: _launchUrl,
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: listMembers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Response resp = snapshot.data as Response;
              if (resp.statusCode == 200) {
                EasyLoading.dismiss();
                final jsonMap = json.decode(resp.body);
                members = (jsonMap as List)
                    .map((prodItem) => Members.fromJson(prodItem))
                    .toList();
                return members.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: MemberListWidget(members: members),
                      )
                    : const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No members found',
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.171875,
                              fontSize: 24.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      );
              } else if (resp.statusCode == 401) {
                EasyLoading.dismiss();
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen(
                                errMsg: 'Unauthenticated',
                              )));
                });
              } else if (resp.statusCode == 403) {
                EasyLoading.dismiss();
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen(
                                errMsg: 'Permission Denied',
                              )));
                });
              }
            } else if (snapshot.hasError) {
              EasyLoading.dismiss();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${snapshot.error}'),
              ));
            }
            return const Center(
              child: Text(''''''),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddMemberScreen()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
