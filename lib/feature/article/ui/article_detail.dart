import 'package:bharat_nxt_article_app/constant/color_constant.dart';
import 'package:bharat_nxt_article_app/feature/article/model/article_model.dart';
import 'package:bharat_nxt_article_app/utils/app_shared_preference.dart';
import 'package:bharat_nxt_article_app/widget/app_background.dart';
import 'package:bharat_nxt_article_app/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ArticleDetail extends StatefulWidget {
  ArticleModel articleData;
  ArticleDetail({super.key, required this.articleData});

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  List<String> favouriteArticles = [];
  @override
  void initState() {
    super.initState();
    checkArticleisFavourite();
  }

  void checkArticleisFavourite() async {
    List<String> favouriteArticlesFromLocalStorage =
        await AppSharedPreference.getValue(
            AppSharedPreference.isFavouriteArticle);
    setState(() {
      widget.articleData.isFavourite = favouriteArticlesFromLocalStorage
          .contains(widget.articleData.id.toString());
      favouriteArticles = favouriteArticlesFromLocalStorage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        Navigator.pop(context, true);
                      },
                      icon: const Icon(
                        Icons.chevron_left_rounded,
                        size: 40,
                      )),
                  AppText(
                    text: widget.articleData.id.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: HexColor(ColorConstant.primaryColor),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.articleData.isFavourite =
                        !widget.articleData.isFavourite;

                    if (widget.articleData.isFavourite) {
                      favouriteArticles.add(widget.articleData.id.toString());
                    } else {
                      favouriteArticles
                          .remove(widget.articleData.id.toString());
                    }

                    AppSharedPreference.save(
                        AppSharedPreference.isFavouriteArticle,
                        favouriteArticles);
                  });
                },
                icon: Icon(
                  widget.articleData.isFavourite
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: AppText(
            text: widget.articleData.title.toString(),
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: HexColor(ColorConstant.greyColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppText(
            text: widget.articleData.body,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: HexColor(ColorConstant.greyColor),
          ),
        ),
      ],
    ));
  }
}
