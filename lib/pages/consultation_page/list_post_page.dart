import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:rxdart/rxdart.dart';
import 'package:social_media/data/model/people_model/people_model.dart';
import 'package:social_media/pages/consultation_page/bloc/post_page_bloc.dart';
import 'package:social_media/pages/consultation_page/list_post_body.dart';

import '../../common/injector/injector.dart';
import '../../common/widget/dialog_default_internet_custom.dart';
import '../../routes/route_name.dart';
import '../../utils/epragnancy_color.dart';
import 'forum_event_section.dart';

class ListPostPage extends StatefulWidget {
  List<PeopleModel>? listArticle = [];
  String? id = '';
  bool? isSearch = false;
  bool? isFilter = false;
  bool? isFromUser = false;

  ListPostPage(
      {this.listArticle,
      this.id,
      this.isSearch = false,
      this.isFilter = false,
      this.isFromUser = false, });

  @override
  State<ListPostPage> createState() => _ListPostPageState();
}

class _ListPostPageState extends State<ListPostPage> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  final TextEditingController _searchTextController = TextEditingController();

  bool _isGetData = false;

  Future<void> _handleRefresh() async {
    if (widget.isSearch == false) {
      
        Injector.resolve<PostPageBloc>().add(PostFetchEvent(page: 1));
    }
  }

  @override
  void initState() {
    if (widget.isSearch == false) {
      
        Injector.resolve<PostPageBloc>().add(PostFetchEvent(page: 1));
      

      super.initState();
    }
  }

  var articleBgColor = [];

  // final String nextMenu, content;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PostPageBloc, PostPageState>(
      listener: (context, state) {
        if (state.submitStatus == FormzStatus.submissionFailure) {
          if (state.errorMessage == "internetConnection") {
            return showDialogDefaultErrorCustom(
                context, "Lost Connection", "Please check your connection",
                refresh: () {
              Navigator.of(context).pop();
              _handleRefresh();
            });
          } else if (state.errorMessage == "timeout") {
            return showDialogDefaultErrorCustom(
                context, "Timeout", "Sorry please refresh", refresh: () {
              Navigator.of(context).pop();
              _handleRefresh();
            });
          }
        } else  if (state.submitStatus == FormzStatus.submissionSuccess) {


        }
      },
      child: BlocBuilder<PostPageBloc, PostPageState>(
        builder: (context, state) {

          return widget.isFromUser == true
              ? Scrollbar(
                  child: LiquidPullToRefresh(
                      color: Colors.deepPurple,
                      key: _refreshIndicatorKey,
                      onRefresh: _handleRefresh,
                      showChildOpacityTransition: false,
                      child: ListPostBody(
                        isFilter: widget.isFilter ?? false,
                        isFromUser: widget.isFromUser?? false,
                      )),
                )
              : Scaffold(
                  appBar: AppBar(
                    title: Text('Social Media'),
                  ),
                  body: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                widget.isSearch = true;
                              });

                              Injector.resolve<PostPageBloc>().add(
                                  PostFetchEvent(
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
                                    widget.isSearch = false;
                                  });
                                  _searchTextController.clear();
                                  Injector.resolve<PostPageBloc>()
                                      .add(PostFetchEvent(
                                    page: 1,
                                    keyword: '',
                                  ));
                                  // Injector.resolve<PatientSelectBloc>().add(FetchPatientEvent(''));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(
                                  top: 5.h, left: 20.w, right: 20.w),
                              hintText: "Search...",
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
                        state.isFilter == true
                            ? InkWell(
                                onTap: () {
                                  Injector.resolve<PostPageBloc>().add(
                                      PostFetchEvent(
                                          page: 1, isFilter: false, tag: ''));
                                },
                                child: Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 120,
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: EpregnancyColors
                                                          .primer),
                                                  height: 30,
                                                  width: 100,
                                                  child: Center(
                                                      child: Text(
                                                    state.tag ?? "-",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    color:
                                                        EpregnancyColors.red),
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: Text(
                                                  "x",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            : Container(),
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          flex: 6,
                          child: Stack(
                            children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: state.listArticle == null
                                      ? Stack(children: [
                                          Container(
                                              margin: EdgeInsets.only(),
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                      "Belum Ada Postingan"),
                                                ),
                                              ))
                                        ])
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
                                                          Injector
                                                                  .resolve<
                                                                      PostPageBloc>()
                                                              .add(PostFetchEvent(
                                                                  isSearch:
                                                                      true,
                                                                  keyword:
                                                                      _searchTextController
                                                                          .text,
                                                                  isBottomScroll:
                                                                      true));
                                                        } else {
                                                          Injector.resolve<
                                                                  PostPageBloc>()
                                                              .add(PostFetchEvent(
                                                                  isBottomScroll:
                                                                      true));
                                                        }
                                                      }
                                                    },
                                                    child: Scrollbar(
                                                      child:
                                                          LiquidPullToRefresh(
                                                              color: Colors
                                                                  .deepPurple,
                                                              key:
                                                                  _refreshIndicatorKey,
                                                              onRefresh:
                                                                  _handleRefresh,
                                                              showChildOpacityTransition:
                                                                  false,
                                                              child:
                                                                  ListPostBody(
                                                                isFilter: widget
                                                                        .isFilter ??
                                                                    false, isFromUser: false,
                                                              )),
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
                                                : Container()
                                          ],
                                        )),
                              _Loading(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
        },
      ),
    );
  }
}

class _LoadingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostPageBloc, PostPageState>(builder: (context, state) {
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
    return BlocBuilder<PostPageBloc, PostPageState>(builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'fetching-article') {
        return Container(
            color: Colors.white.withAlpha(50),
            child: Center(
                child:
                    Lottie.asset("assets/lottie/starwars.json", repeat: true)));
      } else {
        return Text("");
      }
    });
  }
}
