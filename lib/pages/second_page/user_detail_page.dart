import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/color/color.dart';
import '../../common/injector/injector.dart';
import '../../common/style/style.dart';
import '../../common/utils/substring_util.dart';
import '../../common/widget/dialog_default_internet_custom.dart';
import '../../utils/epragnancy_color.dart';
import '../user_page/bloc/user_page_bloc.dart';
import 'body_detail_people.dart';

class ArticleDetailPage extends StatefulWidget {
  final String? data;

  ArticleDetailPage({this.data});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {

  var articleBgColor = [
    EpregnancyColors.coolGreen,
    EpregnancyColors.periwinkle,
    EpregnancyColors.rosePink
  ];

  @override
  void initState() {
    Injector.resolve<ArticlePageBloc>()
        .add(ArticleReadDetailEvent(getIdOrPage(widget.data ?? '0')));
    super.initState();
  }


  Future<void> _handleRefresh() async {
    Injector.resolve<ArticlePageBloc>()
        .add(ArticleReadDetailEvent(getIdOrPage(widget.data ?? '0')));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<ArticlePageBloc, ArticlePageState>(
      listener: (context, state) {
        if (state.submitStatus == FormzStatus.submissionSuccess &&
            state.type == 'fetching-detail') {
          if (state.articleDetailModel?.starships?.length != 0) {
            state.articleDetailModel?.starships?.forEach((element) {
              Injector.resolve<ArticlePageBloc>().add(
                  ArticleListStarshipsHorizontalEvent(
                      type: 'starships',
                      id: getIdOrPage(element),
                      listData: state.articleDetailModel?.starships ?? []));
            });
          } else {
            Injector.resolve<ArticlePageBloc>()
                .add(ArticleListStarshipsHorizontalEvent(type: 'starships'));
          }
        }  if (state.submitStatus == FormzStatus.submissionSuccess &&
            state.type == 'fetching-detail') {
          if (state.articleDetailModel?.vehicles?.length != 0) {
            state.articleDetailModel?.vehicles?.forEach((element) {
              Injector.resolve<ArticlePageBloc>().add(
                  ArticleListVehiclesHorizontalEvent(
                      id: getIdOrPage(element),
                      listData: state.articleDetailModel?.vehicles ?? []));
            });
          } else {
            Injector.resolve<ArticlePageBloc>()
                .add(ArticleListVehiclesHorizontalEvent());
          }
        }

        if (state.submitStatus == FormzStatus.submissionSuccess &&
            state.type == 'fetching-detail') {
          if (state.articleDetailModel?.homeworld != null) {
              Injector.resolve<ArticlePageBloc>().add(
                  ArticleReadHomeworldEvent(
                      getIdOrPage(state.articleDetailModel?.homeworld??'0')));
          } else {
            Injector.resolve<ArticlePageBloc>()
                .add(ArticleReadHomeworldEvent(0));
          }
        } else if (state.submitStatus == FormzStatus.submissionFailure) {
          if (state.errorMessage == "internetConnection") {
            return showDialogDefaultErrorCustom(
                context, "Lost Connection", "Please check your connection",
                refresh: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  _handleRefresh();
                });
          } else if (state.errorMessage == "timeout") {
            return showDialogDefaultErrorCustom(
                context, "Timeout", "Sorry please refresh",
                refresh: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  _handleRefresh();
                });
          }
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 300.0,
                    floating: false,
                    pinned: true,
                    elevation: 0.0,
                    leading: GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.redAccent,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      title: Container(),
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          BlocBuilder<ArticlePageBloc, ArticlePageState>(
                            builder: (context, state) {
                              return state.submitStatus ==
                                      FormzStatus.submissionInProgress
                                  ? SizedBox(
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.deepPurple,
                                        highlightColor: Colors.grey,
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: EpregnancyColors.grey)),
                                      ),
                                    )
                                  : state.articleDetailModel?.url != null? Container(
                                      alignment: Alignment.topCenter,
                                      height: size.height - 300,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        alignment: Alignment.center,
                                        fit: BoxFit.fitHeight,
                                        image: AssetImage(
                                            'assets/people/${getIdOrPage(state.articleDetailModel?.url ?? "0")}.jpg'),
                                      )),
                                    ):SizedBox(
                                child: Container(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        color: EpregnancyColors.grey)),
                              ) ;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: BodyDetailPeople(),
            ),
          ],
        ),
      ),
    );
  }
}

class TabTitle extends StatelessWidget {
  final String label;
  final bool selected;

  const TabTitle({
    Key? key,
    required this.label,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            label,
            style: AppStyle.text.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 4,
          ),
          if (selected)
            Container(
              width: 21,
              height: 2,
              decoration: const BoxDecoration(color: AppColor.primary),
            )
        ])
      ],
    );
  }
}

class Spacing extends StatelessWidget {
  const Spacing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}

class RectButtonSelected extends StatelessWidget {
  final String label;

  const RectButtonSelected({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9), gradient: AppColor.gradient),
      child: Center(
          child: Text(
        label,
        style: AppStyle.text,
      )),
    );
  }
}

class RectButton extends StatelessWidget {
  final String label;

  const RectButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
  builder: (context, state) {
    return  state.submitStatus ==
        FormzStatus.submissionInProgress
        ? SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.deepPurple,
        highlightColor: Colors.grey,
        child: Container(
            width: 70,
            height: 32,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(10.0),
                color: EpregnancyColors.grey)),
      ),
    ):Container(
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.only(right: 14, left: 14),
      height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: AppColor.primary)),
      child: Center(
          child: Text(
        label,
        style: AppStyle.text.copyWith(color: Colors.white),
      )),
    );
  },
);
  }
}

class NameAndProperties extends StatelessWidget {
  const NameAndProperties({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            state.submitStatus == FormzStatus.submissionInProgress
                ? SizedBox(
                    child: Shimmer.fromColors(
                      baseColor: Colors.deepPurple,
                      highlightColor: Colors.grey,
                      child: Container(

                          height: 50,
                          width: MediaQuery.of(context).size.width/2,
                          decoration:
                               BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: EpregnancyColors.grey)),
                    ),
                  )
                : Text(
                    state.articleDetailModel?.name ?? '',
                    style: AppStyle.h1Light,
                  ),
          ],
        );
      },
    );
  }
}


