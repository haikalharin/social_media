import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:swapi/common/utils/substring_util.dart';
import 'package:swapi/data/model/people_model/people_model.dart';

import '../../common/injector/injector.dart';
import '../../common/widget/dialog_default_internet_custom.dart';
import '../../routes/route_name.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/article_bloc.dart';

class ListArticleVertical extends StatefulWidget {
  List<PeopleModel>? listArticle = [];
  String? condition = '';
  bool? isSearch = false;

  ListArticleVertical(
      {this.listArticle, this.condition, this.isSearch = false});

  @override
  State<ListArticleVertical> createState() => _ListArticleVerticalState();
}

class _ListArticleVerticalState extends State<ListArticleVertical> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  final TextEditingController _searchTextController = TextEditingController();
  bool _isGetData = false;

  Future<void> _handleRefresh() async {
    if (widget.isSearch == false) {
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(page: 1));
    }
  }

  @override
  void initState() {
    if (widget.isSearch == false) {
      Injector.resolve<ArticlePageBloc>().add(ArticleFetchEvent(page: 1));
    }

    super.initState();
  }

  var articleBgColor = [];

  // final String nextMenu, content;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ArticlePageBloc, ArticlePageState>(
      listener: (context, state) {
        if (state.submitStatus == FormzStatus.submissionFailure) {
          if (state.errorMessage == "internetConnection") {
            return showDialogDefaultErrorCustom(
                context, "Lost Connection", "Please check your connection",
                refresh: (){
                  Navigator.of(context).pop();
                  _handleRefresh();
                });
          }else if (state.errorMessage == "timeout") {
            return showDialogDefaultErrorCustom(
                context, "Timeout", "Sorry please refresh",
                refresh: (){
                  Navigator.of(context).pop();
                  _handleRefresh();
                });
          }
        }
      },
      child: BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('StarWars Caracter'),
            ),
            body: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(16.w),
                    height: 40.h,
                    child: TextFormField(
                      controller: _searchTextController,
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (keyWord) {
                        setState(() {
                          _isGetData = true;
                        });

                        Injector.resolve<ArticlePageBloc>().add(
                            ArticleFetchEvent(
                                page: 1,
                                keyword: _searchTextController.text,
                                isSearch: true));
                      },
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            BoxConstraints(maxHeight: 35, maxWidth: 35),
                        prefixText: '',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 8.w, right: 8.w),
                          child: Icon(
                            Icons.search,
                            color: Colors.deepPurple,
                          ),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(maxWidth: 40, maxHeight: 21),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _isGetData = true;
                            });
                            _searchTextController.clear();
                            Injector.resolve<ArticlePageBloc>()
                                .add(ArticleFetchEvent(
                              page: 1,
                              keyword: '',
                            ));
                            // Injector.resolve<PatientSelectBloc>().add(FetchPatientEvent(''));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepPurple, shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(top: 5.h, left: 20.w, right: 20.w),
                        hintText: "Find by name...",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: EpregnancyColors.primer,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: EpregnancyColors.borderGrey,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Stack(
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: state.listArticle == null
                                ? Stack(children: [
                                    Container(
                                        margin: EdgeInsets.only(),
                                        child: Container())
                                  ])
                                : state.listArticle!.isEmpty
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Center(
                                            child:
                                                Text("Not found")))
                                    : Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Expanded(
                                                child: LazyLoadScrollView(
                                                  isLoading: state
                                                              .submitStatus ==
                                                          FormzStatus
                                                              .submissionInProgress &&
                                                      state.type ==
                                                          "get-next-page-article",
                                                  onEndOfPage: () {
                                                    if (!state.isLast) {
                                                      if (widget.isSearch ==
                                                          true) {
                                                        Injector.resolve<
                                                                ArticlePageBloc>()
                                                            .add(ArticleFetchEvent(
                                                                isBottomScroll:
                                                                    true));
                                                      } else {
                                                        Injector.resolve<
                                                                ArticlePageBloc>()
                                                            .add(ArticleFetchEvent(
                                                                isBottomScroll:
                                                                    true));
                                                      }
                                                    }
                                                  },
                                                  child: Scrollbar(
                                                    child: LiquidPullToRefresh(
                                                        color: Colors.deepPurple,
                                                        key:
                                                            _refreshIndicatorKey,
                                                        onRefresh:
                                                            _handleRefresh,
                                                        showChildOpacityTransition:
                                                            false,
                                                        child:
                                                            _ListArticleBody()),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          (state.submitStatus ==
                                                      FormzStatus
                                                          .submissionInProgress &&
                                                  state.type ==
                                                      'get-next-page-article')
                                              ? Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: _LoadingBottom())
                                              :Container()
                                        ],
                                      )),
                        _Loading(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ListArticleBody extends StatelessWidget {
  _ListArticleBody();



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
      return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16, crossAxisCount: 2),
        itemBuilder: (context, index) {
          String outputDate = "";
          var outputFormat = DateFormat.yMMMMd('id');
          outputDate = outputFormat.format(DateTime.parse(
              state.listArticle![index].created ?? "0000-00-00"));
          // 12/3
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(RouteName.secondPage, arguments: {
                "people_detail": state.listArticle![index].url ?? '0'
              });
              // Injector.resolve<ArticlePageBloc>()
              //     .add(ArticleReadDetailEvent(getIdOrPage( state.listArticle![index].url??'0')));
            },
            child: Container(
              height: 300,
              // padding: EdgeInsets.,
              decoration: BoxDecoration(
                image: state.listArticle != null &&
                        state.listArticle![index].url != null
                    ? DecorationImage(
                        image: new AssetImage(
                            'assets/people/${getIdOrPage(state.listArticle?[index].url ?? "0")}.jpg'),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: new AssetImage('assets/images/userImage.png'),
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.bottomRight,
                      ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black26,
              ),
              // color: Colors.greenAccent,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: EpregnancyColors.primer.withAlpha(50)),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Expanded(
                        child: Container(
                            width: 80.w,
                            margin: EdgeInsets.only(),
                            child: Text(
                              state.listArticle?[index].name ?? '',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: EpregnancyColors.primer),
                                height: 18,
                                width: 100,
                                child: Center(
                                    child: Text(
                                  state.listArticle?[index].gender ??"-",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          )),
                    ])),
              ),
            ),
          );
        },
        itemCount: state.listArticle!.length,
      );
    });
  }
}

class _LoadingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'get-next-page-article') {
        return Container(
            height: 50,
            // padding: EdgeInsets.symmetric(vertical: 16),
            color: Colors.white.withAlpha(90),
            child: Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            )));
      } else {
        return Container();
      }
    });
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'fetching-article') {
        return Container(
            color: Colors.white.withAlpha(50),
            child: Center(child: Lottie.asset("assets/lottie/starwars.json", repeat: true)));
      } else {
        return Text("");
      }
    });
  }
}