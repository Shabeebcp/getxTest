
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetxtest/View/01_page_one.dart';
import 'package:testgetxtest/ViewState/indexViewState.dart';

class IndexView extends StatefulWidget {
  IndexView({Key? key}) : super(key: key);

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  ///[using ViewState]
  final indexState = Get.put(IndexViewState());

  ///[Another Method ViewState Handling ; Alternative OF Get.Put()]
  //IndexViewState indexState = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton.icon(
              onPressed: () async {
                await indexState.getUserName();
              },
              icon: const Icon(Icons.reddit_outlined),
              label: const Text('Next Page')),

          ///[GetBuilder is must For Any Change In The ViewState;To Change View]
          GetBuilder<IndexViewState>(
              builder: (_) => indexState.myUserName == null
                  ? const Text("No User Name Found!!")
                  : Text("My Name Is : ${indexState.myUserName}")),

          Center(
            child: Card(
              color: Colors.lightGreen,
              child: Column(
                children: [
                  ElevatedButton.icon(
                      onPressed: () async {
                        await indexState.getCheckApi();
                      },
                      icon: const Icon(Icons.two_wheeler_sharp),
                      label: const Text('Get Activity Details')),
                  GetBuilder<IndexViewState>(
                      builder: (_) => indexState.activityModel.activity == null
                          ? CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 10,
                            )
                          : Column(
                              children: [
                                Text(indexState.activityModel.accessibility
                                    .toString()),
                                Text(indexState.activityModel.activity
                                    .toString()),
                                Text(indexState.activityModel.key.toString()),
                                Text(indexState.activityModel.link.toString()),
                                Text(indexState.activityModel.participants
                                    .toString()),
                                Text(indexState.activityModel.price.toString()),
                                Text(indexState.activityModel.type.toString()),
                              ],
                            )),
                ],
              ),
            ),
          ),

          TextButton.icon(
              style: TextButton.styleFrom(backgroundColor: Colors.pink[200]),
              onPressed: () {
                ///[Push To Next Page]
                Get.to(() => PageOne(),
                    duration: Duration(seconds: 2),
                    transition: Transition.zoom);
                ////[Push and Replacement]
                // Get.off(PageOne());
              },
              icon: Icon(Icons.umbrella_rounded, color: Colors.black),
              label: Text(
                "<=Route=>",
                style: TextStyle(color: Colors.black),
              )),

          ElevatedButton(
              onPressed: () {
                ///[Getx SnackBar]
                Get.snackbar("Snack Bar", "SnackBar Popup On Button Clicks",
                    backgroundColor: Color.fromARGB(255, 122, 22, 56),
                    colorText: Colors.white,
                    icon: Icon(
                      Icons.alternate_email_outlined,
                      color: Colors.white,
                    ));
              },
              child: Text("SnackBar")),
          ElevatedButton(
              onPressed: () {
                ///[Getx defaultDialog box]
                Get.defaultDialog(
                    title: "Alert !",
                    textConfirm: "Yes",
                    textCancel: "No",
                    middleText: "Alert Dialogue Box");
              },
              child: Text("DefaultDialog")),
        ],
      )),
    );
  }
}
