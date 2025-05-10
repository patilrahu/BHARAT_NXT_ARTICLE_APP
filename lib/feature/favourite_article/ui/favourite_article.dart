import 'package:bharat_nxt_article_app/feature/article/model/article_model.dart';
import 'package:bharat_nxt_article_app/feature/article/ui/article_card.dart';
import 'package:bharat_nxt_article_app/feature/article/ui/article_detail.dart';
import 'package:bharat_nxt_article_app/feature/article/view_model/article_view_model.dart';
import 'package:bharat_nxt_article_app/utils/app_shared_preference.dart';
import 'package:bharat_nxt_article_app/widget/app_background.dart';
import 'package:bharat_nxt_article_app/widget/app_loader.dart';
import 'package:bharat_nxt_article_app/widget/app_no_data_found.dart';
import 'package:flutter/material.dart';

class FavouriteArticle extends StatefulWidget {
  const FavouriteArticle({super.key});

  @override
  State<FavouriteArticle> createState() => _FavouriteArticleState();
}

class _FavouriteArticleState extends State<FavouriteArticle> {
  final ArticleViewModel _articleViewModel = ArticleViewModel();
  List<ArticleModel> favouriteArticlesList = [];

  @override
  void initState() {
    super.initState();
    fetchFavouriteArticles();
  }

  Future<void> fetchFavouriteArticles() async {
    _articleViewModel.isLoadingFavourite.value = true;
    await _articleViewModel.fetchArticles();
    List<String> favouriteArticles = await AppSharedPreference.getValue(
        AppSharedPreference.isFavouriteArticle);

    setState(() {
      if (favouriteArticles.isEmpty) {
        favouriteArticlesList.clear();
        _articleViewModel.isLoadingFavourite.value = false;
      } else {
        for (var favID in favouriteArticles) {
          var data = _articleViewModel.articles.firstWhere(
            (element) => element.id == int.parse(favID),
          );
          favouriteArticlesList.add(data);
        }
        _articleViewModel.isLoadingFavourite.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left_rounded,
              size: 40,
            )),
        Expanded(
          child: Visibility(
            visible: !_articleViewModel.isLoadingFavourite.value,
            replacement: appLoadingPage(),
            child: Visibility(
              visible: favouriteArticlesList.isNotEmpty,
              replacement: noSearchDataFoundWidget(
                () {
                  fetchFavouriteArticles();
                },
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: favouriteArticlesList.length,
                itemBuilder: (context, index) {
                  var article = favouriteArticlesList[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleDetail(
                                articleData: article,
                              ),
                            )).then((value) async {
                          favouriteArticlesList.clear();

                          await fetchFavouriteArticles();
                        });
                      },
                      child: ArticleCard(article: article));
                },
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
