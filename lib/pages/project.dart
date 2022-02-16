import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              TextButton(onPressed: () {}, child: const Text('저장')),
              TextButton(onPressed: () {}, child: const Text('설비 등록')),
            ],
          ),
          SizedBox(
            height: 18,
          ),

        ],
      ),
    );
  }
}
