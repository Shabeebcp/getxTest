import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetxtest/ViewState/indexViewState.dart';

class PageOne extends StatefulWidget {
  PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  ///[Another Method ViewState Handling ; Alternative OF Get.Put()]
  IndexViewState indexViewState = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(indexViewState.activityModel.activity.toString()),
            Text(indexViewState.activityModel.activity.toString()),
            Text("ok"),
            Text("ok"),
            Text("ok"),
            Text("ok"),
            Text("ok"),
            ElevatedButton(
                onPressed: () {
                  Get.back();

                  ///[Alternative of Navigator.pop(context);]
                },
                child: Text('Home')),

                
            ///////////////////////[obx checking]////////////////////////////////
            ElevatedButton(
                onPressed: () {
                  indexViewState.incremenFunction();
                },
                child: Text('Get Data')),
            Obx(
              () => Text(indexViewState.counter.toString()),
            )
          ],
        ),
      ),
    );
  }
}
