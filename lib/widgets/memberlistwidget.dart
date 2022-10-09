import 'package:flutter/material.dart';
import '../models/members.dart';
import '../screens/memberdetailsscreen.dart';

class MemberListWidget extends StatelessWidget {
  final List<Members> members;

  const MemberListWidget({Key? key, required this.members}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: members.isEmpty ? 0 : members.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: Card(
            //color: const Color.fromARGB(255, 252, 142, 54),
            // shape: RoundedRectangleBorder(
            //   side: const BorderSide(
            //       color: Color.fromARGB(255, 0, 0, 0), width: 1),
            //   borderRadius: BorderRadius.circular(10),
            // ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MemberDetailsScreen(members: members[index])),
                );
              },
              child: ListTile(
                leading: const Icon(
                  Icons.group_work,
                  size: 48,
                  //color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(
                  members[index].repId.toString(),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    //color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                subtitle: Text(
                  members[index].name.toString(),
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    //color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
