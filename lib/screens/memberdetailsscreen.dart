import 'dart:convert';

import 'package:flutter/material.dart';
import '../helpers/sliderightroute.dart';
import '../models/members.dart';
import '../screens/editmemberscreen.dart';
import '../screens/membersscreen.dart';
import '../services/api_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MemberDetailsScreen extends StatelessWidget {
  const MemberDetailsScreen({Key? key, required this.members})
      : super(key: key);
  final Members members;
  static const String _title = 'Users';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: StatefulMemberDetailsWidget(members: members),
    );
  }
}

class StatefulMemberDetailsWidget extends StatefulWidget {
  const StatefulMemberDetailsWidget({Key? key, required this.members})
      : super(key: key);
  final Members members;

  @override
  // ignore: no_logic_in_create_state
  _MemberDetailsWidgetState createState() =>
      _MemberDetailsWidgetState(members: members);
}

class _MemberDetailsWidgetState extends State<StatefulMemberDetailsWidget> {
  _MemberDetailsWidgetState({required this.members});

  final Members members;
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Member Details',
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
                  page: const MembersScreen(
                errMsg: '',
              ))),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Card(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Color.fromARGB(255, 9, 194, 236)),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Member Branch:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.members.branchId.toString(),
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Member Rep:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.members.repId.toString(),
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Member Name:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.members.name.toString(),
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Member Current Position:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.members.currentPosition.toString(),
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Member Manager:',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8))),
                            Text(widget.members.managerId.toString(),
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: SizedBox(
                                height: 60.0,
                                width: MediaQuery.of(context).size.width * 1.0,
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.edit,
                                    // color: Color.fromARGB(255, 0, 0, 0),
                                    size: 24.0,
                                  ),
                                  // style: ButtonStyle(
                                  //   shape: MaterialStateProperty.all<
                                  //           RoundedRectangleBorder>(
                                  //       RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(5.0),
                                  //     side: const BorderSide(
                                  //         // color:
                                  //         //     Color.fromARGB(255, 128, 255, 0),
                                  //         width: 1.0),
                                  //   )),
                                  //   // backgroundColor: MaterialStateProperty.all<
                                  //   //         Color>(
                                  //   //     const Color.fromARGB(255, 255, 200, 0)
                                  //   //     ),
                                  // ),
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                        context,
                                        SlideRightRoute(
                                            page: EditMemberScreen(
                                          members: members,
                                        )));
                                  },
                                  label: const Text('EDIT',
                                      style: TextStyle(
                                        height: 1.171875,
                                        fontSize: 24.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        // color: Color.fromARGB(255, 0, 0, 0),
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: SizedBox(
                                height: 60.0,
                                width: MediaQuery.of(context).size.width * 1.0,
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 24.0,
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  onPressed: () async {
                                    _confirmDialog();
                                  },
                                  label: const Text('DELETE',
                                      style: TextStyle(
                                        height: 1.171875,
                                        fontSize: 24.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () async {
                EasyLoading.show();
                var res = await api.deleteMember(widget.members.id.toString());

                switch (res.statusCode) {
                  case 200:
                    EasyLoading.dismiss();
                    Navigator.pushReplacement(
                        context,
                        SlideRightRoute(
                            page: const MembersScreen(
                          errMsg: 'Deleted Successfully',
                        )));
                    break;
                  case 400:
                    EasyLoading.dismiss();
                    var data = jsonDecode(res.body);
                    if (data["msg"] != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(data["msg"].toString()),
                      ));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Delete Failed"),
                    ));
                    break;
                  case 403:
                    EasyLoading.dismiss();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Permission Denied"),
                    ));
                    break;
                  default:
                    EasyLoading.dismiss();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Delete Failed"),
                    ));
                    break;
                }
              },
            ),
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
