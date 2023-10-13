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
import 'package:social_media/common/utils/substring_util.dart';
import 'package:social_media/data/model/people_model/people_model.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/pages/consultation_page/bloc/post_page_bloc.dart';

import '../../common/injector/injector.dart';
import '../../common/widget/dialog_default_internet_custom.dart';
import '../../routes/route_name.dart';
import '../../utils/epragnancy_color.dart';
import 'forum_event_section.dart';

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
  final PublishSubject<bool> psLikesCount = PublishSubject();

  Future<void> onLike() async {
    psLikesCount.sink.add(true);
  }


  Future<void> _handleRefresh() async {
    if (widget.isSearch == false) {
      Injector.resolve<PostPageBloc>().add(ArticleFetchEvent(page: 1));
    }
  }

  @override
  void initState() {
    if (widget.isSearch == false) {
      Injector.resolve<PostPageBloc>().add(ArticleFetchEvent(page: 1));
    }

    super.initState();
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
      child: BlocBuilder<PostPageBloc, PostPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Social Media'),
            ),
            body:Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(color: Colors.white),
                child: state.listArticle!=null
                    ? Stack(children: [
                  Container(
                      margin: EdgeInsets.only(),
                      child: Container(
                        child: Center(
                          child: Text("Belum Ada Postingan"),
                        ),
                      ))
                ])
                    : Stack(
                  children: [
                    ListView.builder(
                      itemBuilder: (context, index) {
                        bool isChange = false;
                        // bool isLike = psLikesCount.sink ?? false;
                        bool isLocal = false;
                        String likesCount = "";
                        var like = 0;
                        String? date = "";
                        if (state.listArticle?[index].publishDate != null) {
                          DateTime dt = DateTime.parse(
                              state.listArticle?[index].publishDate ??
                                  "0000-00-00 00:00:00");
                          final df = DateFormat('yyyy MMM dd, HH:mm');
                          date = df.format(dt);
                        }

                        var f = NumberFormat("###.###", "en_US");
                        // var commentsCount = f.format(widget.listPost[index].commentsCount);
                        // if (!isLocal) {
                        //   likesCount = f.format(widget.listArticle[index].likes);
                        // }
                        return Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade200,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          // color: Colors.greenAccent,
                          margin:
                          EdgeInsets.only(left: 20, right: 20, bottom: 30),
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                      EdgeInsets.only(left: 20, right: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                // widget image profile komentar
                                                state.listArticle?[index].owner?.picture !=
                                                    null
                                                    ? Container(
                                                  // width: 62,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(40),
                                                    child: FadeInImage(
                                                      placeholder: AssetImage(
                                                          'assets/ic_no_photo.png'),
                                                      image: NetworkImage(
                                                          state.listArticle?[
                                                          index].owner?.picture ??
                                                              ""),
                                                      width: 40,
                                                      height: 40,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                )
                                                    : Container(
                                                  // width: 62,

                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(40),
                                                    child:
                                                    const FadeInImage(
                                                      placeholder: AssetImage(
                                                          'assets/ic_no_photo.png'),
                                                      image: AssetImage(
                                                          'assets/ic_no_photo.png'),
                                                      width: 40,
                                                      height: 40,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),

                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: 10),
                                                        child: Text(
                                                          // widget.listConsul[index].user?.name ?? "",
                                                          state.listArticle?[index]
                                                              .owner
                                                              ?.firstName ??
                                                              "",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        )),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.access_time),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        date != null
                                                            ? Container(
                                                          // width: 62,

                                                            child: Text(
                                                              date,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey),
                                                            ))
                                                            : Container(),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                // todo delete postingan
                                                // Injector.resolve<ConsultationPageBloc>().add(ConsultationDeletePostEvent(widget.listPost[index].id));
                                                print(
                                                    "post id : ${state.listArticle?[index].id}");
                                              },
                                              child: SvgPicture.asset(
                                                'assets/icDelete.svg',
                                                color: Colors.black,
                                              )),

                                          Icon(Icons.ios_share)
                                        ],
                                      ),
                                    ),
                                    state.listArticle?[index].image != null &&
                                        state.listArticle?[index].image != ""
                                        ? ClipRRect(
                                      child: FadeInImage(
                                        placeholder: AssetImage(
                                            'assets/ic_no_photo.png'),
                                        image: NetworkImage(
                                            state.listArticle?[index].image ??
                                                ''),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                        : Container(),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Column(
                                              children: [
                                                // Container(
                                                //     width: 230,
                                                //     margin: EdgeInsets.only(bottom: 10),
                                                //     child: Text(
                                                //         listPrivilegesData[index]
                                                //             .name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 30, bottom: 30),
                                                    width: 300,
                                                    child: Text(state
                                                        .listArticle?[index]
                                                        .text ??
                                                        "")),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 2,
                                width: MediaQuery.of(context).size.width - 40 * 2,
                                color: Colors.grey.shade200,
                              ),
                              ForumEventSection(
                                postModel: state.listArticle?[index]??PostModel(),
                                userId: '',
                                psLikesCount: psLikesCount,
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: state.listArticle?.length,
                    ),
                  ],
                ))
          );
        },
      ),
    );
  }
}



class _LoadingBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostPageBloc, PostPageState>(
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
    return BlocBuilder<PostPageBloc, PostPageState>(
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