import 'package:flutter/material.dart';
import 'package:flutter_data/screen/counter/model/stdmodel.dart';
import 'package:flutter_data/screen/counter/provider/home_provider.dart';
import 'package:provider/provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtid = TextEditingController();
  TextEditingController txtstd = TextEditingController();

  TextEditingController dtxtName = TextEditingController();
  TextEditingController dtxtid = TextEditingController();
  TextEditingController dtxtstd = TextEditingController();

  Homeprovider? homeprovider;

  @override
  Widget build(BuildContext context) {
    homeprovider = Provider.of<Homeprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Data"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: txtid,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtName,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtstd,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    stdModel s1 = stdModel(
                        id: txtid.text, name: txtName.text, std: txtstd.text);
                    homeprovider!.addData(s1);
                  },
                  child: Text("Add")),
              Consumer<Homeprovider>(
                  builder: (context, value, child) => Expanded(
                        child: ListView.builder(
                          itemCount: homeprovider!.l1.length,
                          // shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text("${homeprovider!.l1[index].id}"),
                              title: Text("${homeprovider!.l1[index].name}"),
                              subtitle: Text("${homeprovider!.l1[index].std}"),
                              trailing:
                                  Row(mainAxisSize: MainAxisSize.min, children: [
                                IconButton(
                                  onPressed: () {
                                    homeprovider!.deleteData(index);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                                IconButton(
                                  onPressed: () {
                                    dtxtName = TextEditingController(
                                        text: homeprovider!.l1[index].name);
                                    dtxtid = TextEditingController(
                                        text: homeprovider!.l1[index].id);
                                    dtxtstd = TextEditingController(
                                        text: homeprovider!.l1[index].std);

                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: dtxtid,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            TextField(
                                              controller: dtxtName,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            TextField(
                                              controller: dtxtstd,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                stdModel s1 = stdModel(
                                                    std: dtxtstd.text,
                                                    name: dtxtName.text,
                                                    id: dtxtid.text);
                                                homeprovider!
                                                    .updateData(index, s1);
                                                Navigator.pop(context);
                                              },
                                              child: Text("update"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ]),
                            );
                          },
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
