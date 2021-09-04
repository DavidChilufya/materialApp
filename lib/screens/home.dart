import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learner_teacher_material/data/data.dart';

import 'details.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  static String id = 'home';

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Home - Foundation Phase, Grade 3'),
      ),
      body: Center(
        child: Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              // ignore: avoid_print
              print('LIST DATA ${data[index]['subjects']}');
              return ExpansionTile(
                  title: Text(
                    data[index]['title'],
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  children: [
                    for (var i in data[index]['subjects']) _subjectWidget(i, data[index]['id'])
                  ]);
              //child: _subjectWidget();
            },
          ),
        ),
      ),
    );
  }

  Widget _subjectWidget(Map data, String id) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: InkWell(
        child: Card(
          color: Colors.green.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                  //title:
                  subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Text(
                      data['display'],
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ])),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, Details.id, arguments: data['id']);
        },
      ),
    );
  }
}
