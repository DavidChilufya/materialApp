import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learner_teacher_material/data/data.dart';
import 'package:path_provider/path_provider.dart';

// ignore: use_key_in_widget_constructors
class Details extends StatefulWidget {
  static String id = 'details';

  @override
  _Details createState() => _Details();
}

class _Details extends State<Details> {
  List dataList = [];
  //List routeData = [];

  @override
  void initState() {
    super.initState();
    //  List routeData = [];
  }

  @override
  Widget build(BuildContext context) {
    //final routeData = ModalRoute.of(context)!.settings.arguments;
    var routeData = ModalRoute.of(context)!.settings.arguments;
    filesStructure.forEach((value) {
      if (value['id'] == routeData) {
        this.dataList = value['subjectLevelList'];
        return;
      }
    });
    print('ALL DATA $routeData , ${this.dataList}');
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(''),
      ),
      body: Center(
        child: Expanded(
          child: ListView.builder(
            itemCount: this.dataList.length,
            itemBuilder: (context, index) {
              // ignore: avoid_print
              return ExpansionTile(
                  title: Text(
                    this.dataList[index]['levelKey'],
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  children: [
                    for (var i in this.dataList[index]['levelList'])
                      _subjectWidget(i),
                  ]);
              //child: _subjectWidget();
            },
          ),
        ),
      ),
    );
  }

  Widget _subjectWidget(Map data) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 26),
      child: Visibility(
          visible: data['levelItemList'].length > 0,
          child: gridWidget(data['levelItemList'], data['levelItem'])),
    );
  }

  Widget gridWidget(List data, String item) {
    return Column(
      children: [
        Text(
          item,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 200,
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 6,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(data.length, (index) {
              return Container(
                height: 60,
                child: InkWell(
                  child: Card(
                    //color: Colors.green.shade100,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: item == 'Videos',
                          child: Icon(
                            Icons.video_collection,
                            color: Colors.green,
                            size: 50.0,
                          ),
                        ),
                        Visibility(
                          visible: item == 'Books',
                          child: Icon(
                            Icons.library_books,
                            color: Colors.green,
                            size: 50.0,
                          ),
                        ),
                        Visibility(
                          visible: item == 'Past Papers',
                          child: Icon(
                            Icons.assignment,
                            color: data[index]['fileName'] != 'folder' &&
                                    data[index]['location'].length > 0
                                ? Colors.green
                                : Colors.grey,
                            size: 50.0,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          data[index]['fileName'],
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    bool check = data[index]['fileName'] != 'folder' &&
                        data[index]['download'].length > 0;
                    if (check) {}
                  },
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Future<void> downloadFile(String location) async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      var path = "${dir.path}/learnerMaterial/${fileName.tex}";
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1);
    }
  }
}
