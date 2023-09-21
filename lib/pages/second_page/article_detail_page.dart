import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/color/color.dart';
import '../../common/injector/injector.dart';
import '../../common/style/style.dart';
import '../../common/utils/substring_util.dart';
import '../../utils/epragnancy_color.dart';
import '../first_page/bloc/article_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
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
                        Container(
                          alignment: Alignment.topCenter,
                          height: size.height - 300,
                          width: size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.bottomRight,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://media.timeout.com/images/105863223/image.jpg'),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              //   Positioned(
              //   top: 0,
              //   child: Container(
              //     alignment: Alignment.topCenter,
              //     height: size.height - 300,
              //     width: size.width,
              //     decoration: const BoxDecoration(
              //         image: DecorationImage(
              //           alignment: Alignment.bottomRight,
              //           fit: BoxFit.cover,
              //           image: NetworkImage(
              //               'https://media.timeout.com/images/105863223/image.jpg'),
              //         )),
              //   ),
              // )
              ];
            }, body:  SingleChildScrollView(
              child:   Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColor.secondary,),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          height: 5,
                          width: 32 * 1.5,
                          decoration: BoxDecoration(
                            gradient: AppColor.gradient,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      const ProductNameAndPrice(),
                      const SizedBox(
                        height: 16,
                      ),
                      Text('Size',
                          style: AppStyle.text
                              .copyWith(color: Colors.white.withOpacity(.8))),
                      const Spacing(),
                      Row(
                        children: const [
                          RectButtonSelected(
                            label: 'S',
                          ),
                          RectButton(
                            label: 'M',
                          ),
                          RectButton(
                            label: 'L',
                          ),
                          RectButton(
                            label: 'XL',
                          ),
                        ],
                      ),
                      const Spacing(),
                      Row(
                        children: const [
                          TabTitle(label: 'Details', selected: true),
                          SizedBox(width: 8),
                          TabTitle(label: 'Review', selected: false),
                        ],
                      ),
                      const Spacing(),
                      Text(
                        'This is weekdays design-your go-to for all the latest trends, no matter who you are.',
                        style: AppStyle.bodyText.copyWith(color: Colors.white),
                      ),
                      const Spacing(),
                      Center(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColor.primary),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(16))),
                                  minimumSize: MaterialStateProperty.all(
                                      Size(size.width / 1.4, 37))),
                              onPressed: () {},
                              child: Text('Add To Cart',
                                  style: AppStyle.h3
                                      .copyWith(color: Colors.white))))
                    ],
                  ),
                ),
              ),
            ),


          // Positioned(
          //     bottom: 0,
          //     child: Container(
          //       height: size.height / 2.2,
          //       width: size.width,
          //       decoration: BoxDecoration(
          //         color: AppColor.secondary,
          //         borderRadius: BorderRadius.circular(34),
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.all(24.0),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Center(
          //               child: Container(
          //                 margin: const EdgeInsets.only(bottom: 16),
          //                 height: 5,
          //                 width: 32 * 1.5,
          //                 decoration: BoxDecoration(
          //                   gradient: AppColor.gradient,
          //                   borderRadius: BorderRadius.circular(3),
          //                 ),
          //               ),
          //             ),
          //             const ProductNameAndPrice(),
          //             const SizedBox(
          //               height: 16,
          //             ),
          //             Text('Size',
          //                 style: AppStyle.text
          //                     .copyWith(color: Colors.white.withOpacity(.8))),
          //             const Spacing(),
          //             Row(
          //               children: const [
          //                 RectButtonSelected(
          //                   label: 'S',
          //                 ),
          //                 RectButton(
          //                   label: 'M',
          //                 ),
          //                 RectButton(
          //                   label: 'L',
          //                 ),
          //                 RectButton(
          //                   label: 'XL',
          //                 ),
          //               ],
          //             ),
          //             const Spacing(),
          //             Row(
          //               children: const [
          //                 TabTitle(label: 'Details', selected: true),
          //                 SizedBox(width: 8),
          //                 TabTitle(label: 'Review', selected: false),
          //               ],
          //             ),
          //             const Spacing(),
          //             Text(
          //               'This is weekdays design-your go-to for all the latest trends, no matter who you are.',
          //               style: AppStyle.bodyText.copyWith(color: Colors.white),
          //             ),
          //             const Spacing(),
          //             Center(
          //                 child: ElevatedButton(
          //                     style: ButtonStyle(
          //                         backgroundColor: MaterialStateProperty.all(
          //                             AppColor.primary),
          //                         shape: MaterialStateProperty.all(
          //                             RoundedRectangleBorder(
          //                                 borderRadius:
          //                                 BorderRadius.circular(16))),
          //                         minimumSize: MaterialStateProperty.all(
          //                             Size(size.width / 1.4, 37))),
          //                     onPressed: () {},
          //                     child: Text('Add To Cart',
          //                         style: AppStyle.h3
          //                             .copyWith(color: Colors.white))))
          //           ],
          //         ),
          //       ),
          //     )),

          ),

        ],
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
      width: 32,
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
    return Container(
      margin: const EdgeInsets.only(right: 14),
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: AppColor.primary)),
      child: Center(
          child: Text(
        label,
        style: AppStyle.text.copyWith(color: Colors.white),
      )),
    );
  }
}

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
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


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._widget);

  final Widget _widget;

  @override
  double get minExtent => 120.h;

  @override
  double get maxExtent => 180.h;

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

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        builder: (context, state) {
      if (state.submitStatus == FormzStatus.submissionInProgress &&
          state.type == 'fetching-detail') {
        return Container(
            color: Colors.white.withAlpha(90),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return Container();
      }
    });
  }
}
