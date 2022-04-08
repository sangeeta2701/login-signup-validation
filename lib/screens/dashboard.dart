import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_intershala/screens/flower.dart';
import 'package:task_intershala/screens/image_picker.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late SharedPreferences s_prfs;
  List temp = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }

  getImages() async {
    s_prfs = await SharedPreferences.getInstance();
    setState(() {
      temp = s_prfs.getString("image") as List;
    });
  }

  /*
  * img = getString("img)
  *
  * */

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FlowerScreen()));
                },
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/flower.PNG"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                      )),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(temp!.toString()), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(
                    //   width: 1,
                    // )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                backgroundColor: Colors.cyan,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ImageScreen()));
                },
                child: Icon(Icons.add),
              )
            ],
          ),
        ),

        // floatingActionButton: SpeedDial(
        //   backgroundColor: Colors.cyan,
        //   animatedIcon: AnimatedIcons.add_event,
        //   children: [
        //     SpeedDialChild(
        //         onTap: () {},
        //         child: Icon(Icons.camera),
        //         label: "Camera",
        //         backgroundColor: Colors.cyanAccent),
        //     SpeedDialChild(
        //         onTap: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => ImageScreen()));
        //         },
        //         child: Icon(Icons.collections),
        //         label: "Gallery",
        //         backgroundColor: Colors.cyanAccent),
        //   ],
        // ),
      ),
    );
  }
}
