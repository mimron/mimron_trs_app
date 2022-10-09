import 'dart:convert';

import 'package:flutter/material.dart';
import '../helpers/sliderightroute.dart';
import '../screens/membersscreen.dart';
import '../services/api_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AddMemberScreen extends StatelessWidget {
  const AddMemberScreen({Key? key}) : super(key: key);
  static const String _title = 'Add Member';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: StatefulAddMemberWidget(),
    );
  }
}

class StatefulAddMemberWidget extends StatefulWidget {
  const StatefulAddMemberWidget({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _AddMemberWidgetState createState() => _AddMemberWidgetState();
}

class _AddMemberWidgetState extends State<StatefulAddMemberWidget> {
  List<dynamic> managers = [];
  String? _valManager;
  final ApiService api = ApiService();
  final _addMemberFormKey = GlobalKey<FormState>();
  final _memberBranchIdController = TextEditingController();
  final _memberRepIdController = TextEditingController();
  final _memberNameController = TextEditingController();
  final _memberCurrentPositionController = TextEditingController();

  void loadMemberList() async {
    final resp = await api.getMemberList();
    setState(() {
      managers = jsonDecode(resp.body);
    });
  }

  @override
  void initState() {
    super.initState();
    loadMemberList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Member',
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
              context, SlideRightRoute(page: const MembersScreen(errMsg: ''))),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addMemberFormKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: Text(
                  'Please fill your member branch, rep_id, name, and current_position, manager_id',
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
                      return 'Please enter your member branch id';
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
                      return 'Please enter your member rep id';
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
                        // color: Color.fromARGB(255, 128, 255, 0),
                        size: 24,
                      ),
                    ),
                    // labelStyle: TextStyle(
                    //     height: 1.171875,
                    //     fontSize: 24.0,
                    //     fontFamily: 'Roboto',
                    //     fontWeight: FontWeight.w300,
                    //     color: Color.fromARGB(255, 128, 255, 0)),
                    // hintStyle: TextStyle(
                    //     height: 1.171875,
                    //     fontSize: 24.0,
                    //     fontFamily: 'Roboto',
                    //     fontWeight: FontWeight.w300,
                    //     color: Color.fromARGB(255, 128, 255, 0)),
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
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
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
                      Icons.save,
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
                      if (_addMemberFormKey.currentState!.validate()) {
                        _addMemberFormKey.currentState!.save();
                        EasyLoading.show();
                        var res = await api.addMember(
                          _memberBranchIdController.text,
                          _memberRepIdController.text,
                          _memberNameController.text,
                          _memberCurrentPositionController.text,
                          _valManager as String,
                        );

                        switch (res.statusCode) {
                          case 201:
                            EasyLoading.dismiss();
                            Navigator.pushReplacement(
                                context,
                                SlideRightRoute(
                                    page: const MembersScreen(
                                  errMsg: 'Member Added Successfully',
                                )));
                            break;
                          case 400:
                            EasyLoading.dismiss();
                            var data = jsonDecode(res.body);
                            if (data["msg"]) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(data["msg"].toString()),
                              ));
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Failed to Add Member"),
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
                              content: Text("Failed to Add Member"),
                            ));
                            break;
                        }
                      }
                    },
                    label: const Text('SAVE',
                        style: TextStyle(
                          height: 1.171875,
                          fontSize: 24.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
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
