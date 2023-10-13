import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media/common/utils/substring_util.dart';
import 'package:social_media/data/model/people_model/people_model.dart';

import '../../common/injector/injector.dart';
import '../../common/widget/dialog_default_internet_custom.dart';
import '../../routes/route_name.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/user_page_bloc.dart';
import 'list_body.dart';

class ListUserVertical extends StatefulWidget {
  List<PeopleModel>? listArticle = [];
  String? condition = '';
  bool? isSearch = false;

  ListUserVertical(
      {this.listArticle, this.condition, this.isSearch = false});

  @override
  State<ListUserVertical> createState() => _ListUserVerticalState();
}

class _ListUserVerticalState extends State<ListUserVertical> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  final TextEditingController _searchTextController = TextEditingController();
  bool _isGetData = false;

  Future<void> _handleRefresh() async {
    if (widget.isSearch == false) {
      Injector.resolve<UserPageBloc>().add(ArticleFetchEvent(page: 1));
    }
  }

  @override
  void initState() {
    if (widget.isSearch == false) {
      Injector.resolve<UserPageBloc>().add(ArticleFetchEvent(page: 1));
    }

    super.initState();
  }

  var articleBgColor = [];

  // final String nextMenu, content;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserPageBloc, UserPageState>(
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
      child: BlocBuilder<UserPageBloc, UserPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Social Media'),
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

                        Injector.resolve<UserPageBloc>().add(
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
                            Injector.resolve<UserPageBloc>()
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
                            child: state.listPeople == null
                                ? Stack(children: [
                                    Container(
                                        margin: EdgeInsets.only(),
                                        child: Container())
                                  ])
                                : state.listPeople!.isEmpty
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
                                                                UserPageBloc>()
                                                            .add(ArticleFetchEvent(
                                                                isBottomScroll:
                                                                    true));
                                                      } else {
                                                        Injector.resolve<
                                                                UserPageBloc>()
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
                                                            ListArticleBody()),
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



class _LoadingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPageBloc, UserPageState>(
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
    return BlocBuilder<UserPageBloc, UserPageState>(
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