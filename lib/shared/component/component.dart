import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:news_app/shared/cubit/cubit_app.dart';

Widget buildArticleItem(Map, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(Map['url']));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
        child: Stack(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage('${Map['urlToImage']}'),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.4),
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 140,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),

                    Text(
                      '${Map['author']}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(
                      height: 10.0,
                    ),

                    Text(
                      '${Map['title']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 10.0),

                    // Spacer(),

                    Text(
                      '${Map['publishedAt']}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 10.0,
      ),
      child: Container(
        height: 0.0,
        color: Colors.grey[300],
      ),
    );

Widget articleBuilder(list, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, int index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => buildDivider(),
          itemCount: list.length),
      fallback: (context) => isSearch
          ? Container()
          : Center(
              child: CircularProgressIndicator(
              color: AppCubit.get(context).isDark
                  ? HexColor('#BB86FC')
                  : HexColor('#6200EE'),
            )),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
