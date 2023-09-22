import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swapi/data/model/planet_model/planet_model.dart';
import 'package:swapi/pages/first_page/bloc/article_bloc.dart';

import '../../utils/epragnancy_color.dart';

class HomeworldPeople extends StatefulWidget {
  PlanetModel? planetModel = PlanetModel();
  bool? isMovie = false;

  HomeworldPeople({this.planetModel, this.isMovie});

  @override
  State<HomeworldPeople> createState() => _HomeworldPeopleState();
}

class _HomeworldPeopleState extends State<HomeworldPeople> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
      builder: (context, state) {
        return Container(
          height: 150.h,
          width: 170.w,
          child: widget.planetModel == null
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
                  : InkWell(
                      onTap: () {
                        // Injector.resolve<ArticlePageBloc>()
                        //     .add(ArticleReadDetailEvent(
                        //     listArticle![index].id ?? 0, isMovie: isMovie ?? true));
                      },
                      child: Container(
                        height: 150.h,
                        margin: EdgeInsets.only(left: 16, right: 16, top: 10),
                        decoration: widget.planetModel?.url != null &&
                                widget.planetModel?.url != ""
                            ? BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://dafunda.com/wp-content/uploads/2022/02/10-more-star-wars-planets-as-countries.jpg"),
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
                              color: EpregnancyColors.primer.withAlpha(110)),
                          child: Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                Container(
                                    width: 200,
                                    margin: EdgeInsets.only(),
                                    child: Text(
                                      widget.planetModel?.name ?? '',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                Container(
                                    width: 200,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Population: ${widget.planetModel?.population ?? ''}",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    )),
                                Container(
                                    width: 200,
                                    margin: EdgeInsets.only(top: 70),
                                    child: Text(
                                      widget.planetModel?.climate ?? '',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ])),
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
