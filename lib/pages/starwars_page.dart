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
    return Container(
      decoration: BoxDecoration(
      // color: Colors.black,
      image: DecorationImage(
        image: AssetImage("images/starwars.jpeg"), 
        fit: BoxFit.cover,
      )
      ),
          child: GridView.count(
              crossAxisCount: 2,
        children: List.generate(names.length, (i) {
          return Container(
             decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.yellow,
        ),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  "Name: ${names[i]['name']}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'StarJedi'
                  ),
                ),
                Text(
                  "Gender: ${names[i]['gender']}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'StarJedi'
                  ),
                ),
                Text(
                  "Height: ${names[i]['height']}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'StarJedi'
                  ),
                ),
                Text(
                  "Weight: ${names[i]['mass']}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'StarJedi'
                  ),
                ),
              ],
            ),
          );
        }
        ),
        
      ),
    );
  }
}
