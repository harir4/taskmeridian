import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/modelview/modelview/dataController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DataController>(context, listen: false).DataView();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<DataController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/dp.png'),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Social Media Posts',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Center(
                      child: Text(
                    'Trending',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Relationship',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Selfcare',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
                ),
              ],
            ),
          ),
          Expanded(
            child: data.loading
                ? Center(child: CircularProgressIndicator())
                : data.dataList != null
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.dataList!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 4.5,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/img.png'),
                                  ),
                                  title: Text(
                                    data.dataList![index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  subtitle: Text(
                                    data.dataList![index].body,
                                    style: TextStyle(fontSize: 6),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : AlertDialog(actions: [Text('no data')]),
          ),
        ],
      ),
    );
  }
}
