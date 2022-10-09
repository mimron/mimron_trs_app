import 'dart:convert';

import 'package:flutter/material.dart';
import '../helpers/sliderightroute.dart';
import '../models/members.dart';
import '../screens/memberdetailsscreen.dart';
import '../screens/membersscreen.dart';
import '../services/api_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EditMemberScreen extends StatelessWidget {
  const EditMemberScreen({Key? key, required this.members}) : super(key: key);
  final Members members;
  static const String _title = 'Edit Member';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: StatefulEditMemberWidget(members: members),
    );
  }
}

class StatefulEditMemberWidget extends StatefulWidget {
  const StatefulEditMemberWidget({Key? key, required this.members})
      : super(key: key);
  final Members members;

  @override
  // ignore: no_logic_in_create_state
  _EditMemberWidgetState createState() =>
      _EditMemberWidgetState(members: members);
}

class _EditMemberWidgetState extends State<StatefulEditMemberWidget> {
  _EditMemberWidgetState({required this.members});
  List<dynamic> managers = [];
  String? _valManager;
  final Members members;
  final ApiService api = ApiService();
  final _editMemberFormKey = GlobalKey<FormState>();
  final _memberBranchIdController = TextEditingController();
  final _memberRepIdController = TextEditingController();
  final _memberNameController = TextEditingController();
  final _memberCurrentPositionController = TextEditingController();

  void loadManagerList() async {
    final resp = await api.getMemberList();
    setState(() {
      managers = jsonDecode(resp.body);
    });
  }

  @override
  void initState() {
    super.initState();
    loadManagerList();
    _valManager = members.managerId.toString();
    _memberBranchIdController.text = members.branchId.toString();
    _memberRepIdController.text = members.repId.toString();
    _memberNameController.text = members.name.toString();
    _memberCurrentPositionController.text = members.currentPosition.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Member',
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
          onPressed: () => Navigator.pushReplacement(context,
              SlideRightRoute(page: MemberDetailsScreen(members: members))),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _editMemberFormKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: Text(
                  'Please edit your member branch, rep_id, name, and current_position, manager_id',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.171875,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: _memberBranchIdController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your member branch ID';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Member Branch ID',
                    hintText: 'Member Branch ID',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Icon(
                        Icons.text_format,
                        size: 24,
                      ),
                    ),
                    labelStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    hintStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    filled: true,
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: _memberRepIdController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your member rep ID';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Member Rep ID',
                    hintText: 'Member Rep ID',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Icon(
                        Icons.text_fields,
                        size: 24,
                      ),
                    ),
                    labelStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    hintStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    filled: true,
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: _memberNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your member name';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Member Name',
                    hintText: 'Member Name',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Icon(
                        Icons.image,
                        size: 24,
                      ),
                    ),
                    labelStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    hintStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    filled: true,
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: _memberCurrentPositionController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your member current position';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Member Current Position',
                    hintText: 'Member Current Position',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Icon(
                        Icons.monetization_on,
                        size: 24,
                      ),
                    ),
                    labelStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    hintStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    filled: true,
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.group_work,
                      size: 24,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(
                          // color: Color.fromARGB(255, 128, 255, 0),
                          width: 1),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 24.0),
                    // dropdownColor: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    isExpanded: true,
                    value: _valManager,
                    hint: const Text(
                      'Select Manager',
                      style: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        // color: Color.fromARGB(255, 0, 0, 0)
                      ),
                    ),
                    items: managers.map((item) {
                      return DropdownMenuItem(
                        child: Text(
                          item['name'],
                          style: const TextStyle(
                            height: 2.171875,
                            fontSize: 24.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                            // color: Color.fromARGB(255, 26, 255, 1),
                          ),
                        ),
                        value: item['rep_id'],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _valManager = value as String;
                      });
                    },
                  )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: SizedBox(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.login,
                      // color: Color.fromARGB(255, 0, 0, 0),
                      size: 24.0,
                    ),
                    // style: ButtonStyle(
                    //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //       RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(5.0),
                    //     side: const BorderSide(
                    //         color: Color.fromARGB(255, 128, 255, 0),
                    //         width: 1.0),
                    //   )),
                    //   backgroundColor: MaterialStateProperty.all<Color>(
                    //       const Color.fromARGB(255, 255, 200, 0)),
                    // ),
                    onPressed: () async {
                      if (_editMemberFormKey.currentState!.validate()) {
                        _editMemberFormKey.currentState!.save();
                        EasyLoading.show();
                        var res = await api.updateMember(
                            members.id,
                            _memberBranchIdController.text,
                            _memberRepIdController.text,
                            _memberNameController.text,
                            _memberCurrentPositionController.text,
                            _valManager as String);

                        switch (res.statusCode) {
                          case 200:
                            EasyLoading.dismiss();
                            Navigator.pushReplacement(
                                context,
                                SlideRightRoute(
                                    page: const MembersScreen(
                                  errMsg: 'Updated Successfully',
                                )));
                            break;
                          case 400:
                            EasyLoading.dismiss();
                            var data = jsonDecode(res.body);
                            if (data["msg"] != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(data["msg"].toString()),
                              ));
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Update Failed"),
                            ));
                            break;
                          case 403:
                            EasyLoading.dismiss();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Permission Denied"),
                            ));
                            break;
                          default:
                            EasyLoading.dismiss();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Update Failed"),
                            ));
                            break;
                        }
                      }
                    },
                    label: const Text('UPDATE',
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
            ],
          ),
        ),
      ),
    );
  }
}
