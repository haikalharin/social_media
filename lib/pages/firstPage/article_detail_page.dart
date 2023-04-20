import 'package:base_app_new/pages/firstPage/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../common/injector/injector.dart';
import '../../data/model/response_model/article_model/article_model.dart';
import '../../utils/epragnancy_color.dart';


class ArticleDetailPage extends StatefulWidget {
  ArticleModel? article = ArticleModel();

  ArticleDetailPage({this.article});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    String outputDate = "";
    var outputFormat = DateFormat.yMMMMd('id');
    outputDate = outputFormat.format(DateTime.parse(widget.article?.released?? "0000-00-00"));

    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ArticlePageBloc, ArticlePageState>(
  builder: (context, state) {
    return NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  elevation: 0.0,
                  leading: GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    title: Container(),
                    background: Image(
                      image: NetworkImage(
                         widget.article?.backgroundImage??'https://images.nintendolife.com/7eb5b6e59be08/a-hat-in-time-cover.cover_large.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.0),
                                      color:
                                      EpregnancyColors.green),
                                  height: 30,
                                  width: 100,
                                  child: Center(
                                      child: Text(
                                        "Rating : ${widget.article?.rating.toString()??''}",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                  ),
                                ),
                                Icon(Icons.ios_share),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                  widget.article?.name??'',
                                  maxLines: 5,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.clip,
                              ),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(top: 20, bottom: 10),
                                child: Row(
                                  children: [
                                    Container(
                                        child: Icon(
                                      Icons.access_time,
                                      size: 18,
                                    )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        child: Text(
                                          outputDate,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
              ];
            },
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Container()
                    ),
                  ),
                ),
              ],
            ));
  },
),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._widget);

  final Widget _widget;

  @override
  double get minExtent => 120.h;

  @override
  double get maxExtent => 120.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _widget,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
