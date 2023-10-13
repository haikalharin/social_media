import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/injector/injector.dart';
import '../../data/model/post_model/post_model.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/post_page_bloc.dart';
import 'forum_event_section.dart';

class ListPostBody extends StatefulWidget {
  bool isFilter = false;
  bool isFromUser = false;
  ListPostBody({Key? key, required this.isFilter, required this.isFromUser}) : super(key: key);

  @override
  State<ListPostBody> createState() => _ListPostBodyState();
}

class _ListPostBodyState extends State<ListPostBody> {
  final PublishSubject<bool> psLikesCount = PublishSubject();
  String? tag;

  Future<void> onLike() async {
    psLikesCount.sink.add(true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostPageBloc, PostPageState>(
      builder: (context, state) {
        return ListView.builder(
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
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
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
                                        // widget image profile komentar
                                        state.listArticle?[index].owner?.picture !=
                                                null
                                            ? Container(
                                                // width: 62,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: FadeInImage(
                                                    placeholder: AssetImage(
                                                        'assets/ic_no_photo.png'),
                                                    image: NetworkImage(state
                                                            .listArticle?[index]
                                                            .owner
                                                            ?.picture ??
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
                                                      BorderRadius.circular(40),
                                                  child: const FadeInImage(
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
                                                margin: EdgeInsets.only(bottom: 10),
                                                child: Text(
                                                  // widget.listConsul[index].user?.name ?? "",
                                                  state.listArticle?[index].owner
                                                          ?.firstName ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold),
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
                                                            color: Colors.grey),
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
                                      placeholder:
                                          AssetImage('assets/ic_no_photo.png'),
                                      image: NetworkImage(
                                          state.listArticle?[index].image ?? ''),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(),
                            Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (BuildContext context, int indexTag) {
                                  return InkWell(
                                    onTap: () {
                                      if(!widget.isFromUser) {
                                        setState(() {
                                          widget.isFilter = true;
                                          tag = state.listArticle?[index]
                                              .tags?[indexTag];
                                        });
                                        Injector.resolve<PostPageBloc>()
                                            .add(PostFetchEvent(
                                            page: 1,
                                            isFilter: true,
                                            tag: tag));
                                      }
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(top: 20, left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                              EdgeInsets.only(top: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(10.0),
                                                  color: EpregnancyColors
                                                      .primer),
                                              height: 32,
                                              width: 100,
                                              child: Center(
                                                  child: Text(
                                                    state.listArticle?[index]
                                                        .tags?[
                                                    indexTag] ??
                                                        "-",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  )),
                                            ),
                                          ],
                                        )),
                                  );
                                },
                                itemCount: state.listArticle?[index]
                                    .tags?.length,
                              ),
                            ),

                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, right: 20),
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
                                            child: Text(
                                                state.listArticle?[index].text ??
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
                        postModel: state.listArticle?[index] ?? PostModel(),
                        userId: '',
                        psLikesCount: psLikesCount,
                      )
                    ],
                  ),
                );
              },
              itemCount: state.listArticle?.length,
            );

      },
    );
  }
}
