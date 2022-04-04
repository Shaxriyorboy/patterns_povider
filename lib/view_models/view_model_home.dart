import 'package:flutter/foundation.dart';
import 'package:patterns_povider/models/post_model.dart';
import 'package:patterns_povider/services/http_service.dart';

class ViewModelHome extends ChangeNotifier {
  bool isLoading = false;
  List<Post> listPost = [];

  void apiPostList() async {
    isLoading = true;
    notifyListeners();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      listPost = Network.parsePostList(response);
      isLoading = false;
      notifyListeners();
    }
  }

  void apiDelete(int id) async {
    isLoading = true;
    notifyListeners();
    var response = await Network.DEL(
        Network.API_DELETE + id.toString(), Network.paramsEmpty());
    if (response != null) apiPostList();
    notifyListeners();
  }
}
