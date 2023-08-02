import 'package:flutter/cupertino.dart';
import 'helpers/api_helpers.dart';

class ApiController extends ChangeNotifier {
  List data = [];

  ApiController() {
    search();
  }

  search({String val = "business"}) async {
    data = await ApiHelpers.apiHelpers.getNewsResponse(query: val) ?? [];
    notifyListeners();
    return 0;
  }
}
