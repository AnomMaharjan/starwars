import 'package:Starwars/api/starwars_api.dart';
import 'package:Starwars/controller/base_controller.dart';
import 'package:Starwars/model/starwars_model.dart';
import 'package:Starwars/widget/enum.dart';

class StarwarsController extends BaseController {
  StarwarsAPI api = StarwarsAPI();
  Characters characters;

  getCharactersList() async {
    setState(ViewState.Busy);
    await api.getCharactersList().then((value) => characters = value);
    setState(ViewState.Retrieved);
  }
}
