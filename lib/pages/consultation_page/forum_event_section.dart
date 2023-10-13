import 'package:rxdart/rxdart.dart';
import 'package:social_media/common/injector/injector.dart';
import 'package:social_media/data/model/post_model/post_model.dart';
import 'package:social_media/pages/consultation_page/comment_bottom_sheet.dart';
import 'package:social_media/utils/epragnancy_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toast/toast.dart';

import 'bloc/post_page_bloc.dart';

class ForumEventSection extends StatefulWidget {
  const ForumEventSection(
      {Key? key,
      required this.postModel,
      required this.userId,
      this.psLikesCount})
      : super(key: key);
  final PostModel postModel;
  final String? userId;
  final PublishSubject<bool>? psLikesCount;

  @override
  State<ForumEventSection> createState() => _ForumEventSectionState();
}

class _ForumEventSectionState extends State<ForumEventSection> {
  PostModel? _postModel;
  late final bool _isLiked = false;
  late final int _likesCount = widget.postModel.likes ?? 0;

  // late final int _commentCounts = widget.postModel.commentsCount ?? 0;

  late ValueNotifier<bool> isLiked = ValueNotifier<bool>(_isLiked);
  late ValueNotifier<int> likesCount = ValueNotifier<int>(_likesCount);

  // late ValueNotifier<int> commentCounts = ValueNotifier<int>(_commentCounts);

  // late int commentCount = widget.postModel.commentsCount ?? 0;

  bool enableComment = true;

  int newCommentCount = 0;

  @override
  void initState() {
    setState(() {
      _postModel = widget.postModel;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    ToastContext().init(context);
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {

                        },
                        child: ValueListenableBuilder<int>(
                            valueListenable: likesCount,
                            builder: (context, value, child) {
                              return Container(
                                margin: EdgeInsets.only(right: 2),
                                child: SvgPicture.asset(
                                  'assets/like_logo.svg',
                                  fit: BoxFit.fitHeight,
                                  height: 17,
                                  width: 17,
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder<int>(
                              valueListenable: likesCount,
                              builder: (context, value, child) {
                                return Container(
                                    width: 200,
                                    child: Text(
                                      '$value Likes',
                                      maxLines: 3,
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ));
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // BlocBuilder<ConsultationPageBloc, ConsultationPageState>(
          //   builder: (context, state) {
          //     return Container(
          //       width: MediaQuery.of(context).size.width,
          //         child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         state.userModel?.imageUrl != null
          //             ? Container(
          //                 // width: 62,
          //
          //                 child: ClipRRect(
          //                   borderRadius: BorderRadius.circular(40),
          //                   child: FadeInImage(
          //                     placeholder:
          //                         const AssetImage('assets/ic_no_photo.png'),
          //                     image:
          //                         NetworkImage(state.userModel?.imageUrl ?? ""),
          //                     width: 40,
          //                     height: 40,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //               )
          //             : Container(
          //                 // width: 62,
          //
          //                 child: ClipRRect(
          //                   borderRadius: BorderRadius.circular(40),
          //                   child: const FadeInImage(
          //                     placeholder: AssetImage('assets/ic_no_photo.png'),
          //                     image: AssetImage('assets/ic_no_photo.png'),
          //                     width: 40,
          //                     height: 40,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //               ),
          //         // komentar
          //         Expanded(
          //           flex: 1,
          //           child: ValueListenableBuilder<bool>(
          //             valueListenable: isLiked,
          //             builder: (context, value, child) {
          //               return InkWell(
          //                 onTap: () {
          //                   if (value == false) {
          //                     Injector.resolve<ConsultationPageBloc>()
          //                         .add(ConsultationLikeSubmitted(
          //                         _postModel?.id ?? '',
          //                         true));
          //                     setState(() {
          //                       isLiked.value = true;
          //                       likesCount.value += 1;
          //                     });
          //                   } else {
          //                     Injector.resolve<ConsultationPageBloc>()
          //                         .add(ConsultationLikeSubmitted(
          //                         _postModel?.id ?? '',
          //                         false));
          //                     setState(() {
          //                       isLiked.value = false;
          //                       likesCount.value -= 1;
          //                     });
          //                   }
          //                 },
          //                 child: value == true
          //                     ? SvgPicture.asset(
          //                   'assets/ic_like_fill.svg',
          //                   fit: BoxFit.fitHeight,
          //                 )
          //                     : SvgPicture.asset(
          //                   'assets/like_logo.svg',
          //                   fit: BoxFit.fitHeight,
          //                 ),
          //               );
          //             }),)
          //       ],
          //     ));
          //   },
          // ),
        ],
      ),
    );
  }
}
