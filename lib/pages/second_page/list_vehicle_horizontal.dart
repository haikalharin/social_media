import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:social_media/data/model/starship_model/starship_model.dart';
import 'package:social_media/data/model/vehicle_model/vehicle_model.dart';
import 'package:social_media/pages/user_page/bloc/user_page_bloc.dart';

import '../../utils/epragnancy_color.dart';

class ListVehicleHorizontal extends StatefulWidget {
  List<VehicleModel>? listVehicle = [];
  bool? isMovie = false;

  ListVehicleHorizontal({this.listVehicle, this.isMovie});

  @override
  State<ListVehicleHorizontal> createState() => _ListVehicleHorizontalState();
}

class _ListVehicleHorizontalState extends State<ListVehicleHorizontal> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPageBloc, UserPageState>(
      builder: (context, state) {
        return Container(
          height: 150.h,
          width: 170.w,
          child: widget.listVehicle == null
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
                            widget.listVehicle?[index].created != '' &&
                                    widget.listVehicle?[index].created != null
                                ? outputFormat.format(DateTime.parse(
                                    widget.listVehicle?[index].created ??
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
                            decoration: widget.listVehicle?[index].url !=
                                        null &&
                                    widget.listVehicle?[index].url != ""
                                ? BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://i.pinimg.com/originals/4d/b5/60/4db5606186aef55767e388c176984e53.jpg"),
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
                                        width: 200,
                                        margin: EdgeInsets.only(),
                                        child: Text(
                                          widget.listVehicle?[index].name ??
                                              '',
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
                                              widget.listVehicle?[index].model ??
                                                  '',
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
                                              "USD ${widget.listVehicle?[index].costInCredits ??
                                                  ''}",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                  ])),
                            ),
                          ),
                        );
                      },
                      itemCount: widget.listVehicle?.length,
                    ),
        );
      },
    );
  }
}
