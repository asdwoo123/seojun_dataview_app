import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seojun_dataview_app/service/account.dart';

class MonitorPage extends StatefulWidget {
  const MonitorPage({Key? key}) : super(key: key);

  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  final Stream<
      DocumentSnapshot<Map<String, dynamic>>> projectStream = FirebaseFirestore
      .instance.collection('project').doc(getUser()?.uid).snapshots();
  CollectionReference investors = FirebaseFirestore.instance.collection(
      'investors');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: projectStream,
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }

          var projectNames = snapshot.data?.data()?['projects'];
          return ListView(
            children: projectNames.map<Widget>((projectName) {
              projectName = projectName as String;
              return FutureBuilder<DocumentSnapshot>(
                  future: investors.doc(projectName).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return Text('Document does not exist');
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data = snapshot.data!.data() as Map<
                          String,
                          dynamic>;
                      var connect = data['connect'] as String;
                      var name = data['name'] as String;
                      List<dynamic> settings = data['setting'];

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                              children: <Widget>[
                              Text(name),
                          ListView(children:
                          settings.map<Widget>((setting) {
                            var name = setting['name'] as String;
                            return Row(children: [
                              Text('name'),
                              Text(name)
                            ]);
                          }).toList(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                          )],
                        ),
                      ),
                    );

                    }

                    return const Text
                    ('loading');
                  });
            }).toList(),
          );
        },
      ),
    );
  }
}
