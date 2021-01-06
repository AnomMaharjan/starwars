import 'package:Starwars/controller/starwars_controller.dart';
import 'package:Starwars/helper/starwars_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Starwars/model/starwars_model.dart';

class StarwarsPage extends StatelessWidget {
  final StarwarsController controller = Get.put(StarwarsController());

  void initState() {
    controller.getCharactersList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      initState: (_) => initState(),
      dispose: (state) => {},
      builder: (_) {
        return Obx(
          () => WidgetBuilderHelper(
            state: controller.state,
            onLoadingWidget: buildLoadingWidget(),
            onErrorWidget: buildErrorWidget(),
            onSuccessWidget: buildSuccessWidget(),
          ),
        );
      },
    );
  }

  Widget buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildSuccessWidget() {
    // final character = controller.characters;
    List<dynamic> names = controller.characters.results;
    return SingleChildScrollView(
      child: Column(children: List.generate(names.length, (i){
        return Container(
          child: Card(
            child: ListTile(
              title: Text(
                "Name: ${names[i]['name']}",
                style: TextStyle(color: Colors.red),
              ),
              subtitle: Text(
                "Gender: ${names[i]['gender']}"
              ),
            ),
          ),
        );
      } ),
      // color: Colors.blueAccent,
      // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      // child: new Card(
      //   child: ListTile(
      //     title: Text(
      //       "${names[0]['name']}",
      //       style: new TextStyle(
      //         fontSize: 20,
      //         color: Colors.red,
      //       ),
      //     ),
      //   ),
      // ),

    ));
  }
}
