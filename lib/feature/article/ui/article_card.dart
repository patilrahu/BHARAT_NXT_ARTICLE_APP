import 'package:bharat_nxt_article_app/constant/image_constant.dart';
import 'package:bharat_nxt_article_app/feature/article/model/article_model.dart';
import 'package:bharat_nxt_article_app/widget/app_text.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatefulWidget {
  ArticleModel article;
  ArticleCard({super.key, required this.article});

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: AppText(
                  text: '${widget.article.id}\n${widget.article.title}',
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      ImageConstant.arrowImage,
                      width: 30,
                      height: 30,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
