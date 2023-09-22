import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swapi/data/model/starship_model/starship_model.dart';
import 'package:swapi/pages/first_page/bloc/article_bloc.dart';

import '../../utils/epragnancy_color.dart';

class ListStarshipsHorizontal extends StatefulWidget {
  List<StarshipModel>? listStarship = [];
  bool? isMovie = false;

  ListStarshipsHorizontal({this.listStarship, this.isMovie});

  @override
  State<ListStarshipsHorizontal> createState() => _ListStarshipsHorizontalState();
}

class _ListStarshipsHorizontalState extends State<ListStarshipsHorizontal> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
      builder: (context, state) {
        return Container(
          height: 150.h,
          width: 170.w,
          child: widget.listStarship == null
              ? state.submitStatus == FormzStatus.submissionInProgress
                  ? SizedBox(
                      child: Shimmer.fromColors(
                      baseColor: Colors.deepPurple,
                      highlightColor: Colors.grey,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: EpregnancyColors.grey)),
                    ))
                  : Container(margin: EdgeInsets.only(), child: Container())
              : state.submitStatus == FormzStatus.submissionInProgress
                  ? SizedBox(
                      child: Shimmer.fromColors(
                      baseColor: Colors.deepPurple,
                      highlightColor: Colors.grey,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: EpregnancyColors.grey)),
                    ))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String outputDate = "";
                        var outputFormat = DateFormat.yMMMMd('id');
                        outputDate =
                            widget.listStarship?[index].created != '' &&
                                    widget.listStarship?[index].created != null
                                ? outputFormat.format(DateTime.parse(
                                    widget.listStarship?[index].created ??
                                        "0000-00-00"))
                                : "0000-00-00";
                        // 12/3
                        return InkWell(
                          onTap: () {
                            // Injector.resolve<ArticlePageBloc>()
                            //     .add(ArticleReadDetailEvent(
                            //     listArticle![index].id ?? 0, isMovie: isMovie ?? true));
                          },
                          child: Container(
                            height: 150.h,
                            margin:
                                EdgeInsets.only(left: 16, right: 16, top: 10),
                            decoration: widget.listStarship?[index].url !=
                                        null &&
                                    widget.listStarship?[index].url != ""
                                ? BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://imgix.ranker.com/user_node_img/50047/1000931279/original/1000931279-photo-u2?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=375"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: EpregnancyColors.primer)
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: EpregnancyColors.primer),
                            child: Container(
                              height: 150.h,
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color:
                                      EpregnancyColors.primer.withAlpha(110)),
                              child: Container(
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                            width: 300,
                                            margin: EdgeInsets.only(),
                                            child: Text(
                                              widget.listStarship?[index].model ??
                                                  '',
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                        Container(
                                            width: 300,
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              "Class: ${widget.listStarship?[index].starshipClass ??
                                                  ''}",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            )),
                                        Container(
                                            width: 300,
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              "Rate: ${widget.listStarship?[index].hyperdriveRating ??
                                                  ''}",
                                              maxLines: 4,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            )),
                                        Container(
                                            width: 300,
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              "USD ${widget.listStarship?[index].costInCredits ??
                                                  ''}",
                                              maxLines: 4,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                        Expanded(
                                          child: Container(
                                              width: 300,
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text(
                                                widget.listStarship?[index].manufacturer ??
                                                    '',
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ])),
                            ),
                          ),
                        );
                      },
                      itemCount: widget.listStarship?.length,
                    ),
        );
      },
    );
  }
}
