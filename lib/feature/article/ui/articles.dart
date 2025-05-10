import 'package:bharat_nxt_article_app/constant/color_constant.dart';
import 'package:bharat_nxt_article_app/constant/string_constant.dart';
import 'package:bharat_nxt_article_app/feature/article/ui/article_card.dart';
import 'package:bharat_nxt_article_app/feature/article/ui/article_detail.dart';
import 'package:bharat_nxt_article_app/feature/article/view_model/article_view_model.dart';
import 'package:bharat_nxt_article_app/feature/favourite_article/ui/favourite_article.dart';
import 'package:bharat_nxt_article_app/widget/app_background.dart';
import 'package:bharat_nxt_article_app/widget/app_loader.dart';
import 'package:bharat_nxt_article_app/widget/app_no_data_found.dart';
import 'package:bharat_nxt_article_app/widget/app_text.dart';
import 'package:bharat_nxt_article_app/widget/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hexcolor/hexcolor.dart';

class Articles extends StatefulWidget {
  const Articles({super.key});

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  final TextEditingController _searchArticleController =
      TextEditingController();
  final ArticleViewModel _articleViewModel = ArticleViewModel();
  @override
  void initState() {
    super.initState();
    fetchAllArticles();
  }

  Future<void> fetchAllArticles() async {
    await _articleViewModel.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
        child: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Colors.white,
            elevation: 4,
            margin: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: StringConstant.articleHeadingText,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FavouriteArticle()));
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          color: HexColor(ColorConstant.primaryColor),
                        ),
                        AppText(
                          text: 'Favorites',
                          color: HexColor(ColorConstant.primaryColor),
                          fontSize: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AppTextfield(
            controller: _searchArticleController,
            keyboardType: TextInputType.text,
            hintText: StringConstant.searchArticleText,
            prefixIcon: const Icon(Icons.search_rounded),
            onChanged: (value) {
              _articleViewModel.serachArticle(value);
            },
          ),
        ),
        Obx(
          () => Visibility(
              visible: !_articleViewModel.isLoading.value,
              replacement: Expanded(child: appLoadingPage()),
              child: Expanded(
                child: Visibility(
                  visible: _articleViewModel.articles.isNotEmpty,
                  replacement: noSearchDataFoundWidget(
                    () {
                      fetchAllArticles();
                    },
                  ),
                  child: RefreshIndicator(
                    onRefresh: fetchAllArticles,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _articleViewModel.articles.length,
                      itemBuilder: (context, index) {
                        var article = _articleViewModel.articles[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ArticleDetail(
                                      articleData: article,
                                    ),
                                  ));
                            },
                            child: ArticleCard(article: article));
                      },
                    ),
                  ),
                ),
              )),
        )
      ],
    ));
  }
}
