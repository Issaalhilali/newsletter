import 'package:flutter/cupertino.dart';
import 'package:newslitter/Model/ArticlesModel/art_error.dart';
import 'package:newslitter/Model/ArticlesModel/articles_mode.dart';
import 'package:newslitter/Services/Api/api_data.dart';
import 'package:newslitter/Services/Api/api_status.dart';

class ArticlesListView extends ChangeNotifier {
  bool _loading = false;
  List<ArticlesModel> _artList = [];
  bool get loading => _loading;
  ArticError? _articError;

  ArticError? get arterror => _articError;
//for get Articles data json from model
  List<ArticlesModel> get articlesList => _artList;

  ArticlesListView() {
    getdata();
  }
//method for fetch data from services api
  setArticlies(List<ArticlesModel> art) {
    _artList = art;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setArtError(ArticError articError) {
    _articError = articError;
  }

  getdata() async {
    setLoading(true);
    var response = await GetData.fetchData();
    if (response is Sucess) {
      setArticlies(response.response as List<ArticlesModel>);
    }
    if (response is Failure) {
      ArticError articError =
          ArticError(code: response.code, message: response.errorresponse);
      setArtError(articError);
    }
    setLoading(false);
  }
}
