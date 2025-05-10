import 'package:bharat_nxt_article_app/api/api_service.dart';
import 'package:bharat_nxt_article_app/api/app_url.dart';
import 'package:bharat_nxt_article_app/feature/article/model/article_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class ArticleViewModel extends GetxController {
  final _apiService = ApiService();
  var isLoading = false.obs;
  var isLoadingFavourite = false.obs;
  RxList<ArticleModel> articles = <ArticleModel>[].obs;
  RxList<ArticleModel> allArticles = <ArticleModel>[].obs;

  Future<void> fetchArticles() async {
    try {
      isLoading.value = true;
      var response = await _apiService.getRequest(AppUrl.posts);
      if (response['status'] == 200) {
        for (var article in response['data']) {
          articles.add(ArticleModel.fromJson(article));
          allArticles.add(ArticleModel.fromJson(article));
        }
        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print('Fetch Article Failed: ${e.toString()}');
    }
  }

  void serachArticle(String query) {
    if (query.isEmpty) {
      articles.assignAll(allArticles);
    } else {
      articles.value = allArticles
          .where((element) =>
              element.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
