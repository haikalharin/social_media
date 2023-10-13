import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shimmer/shimmer.dart';
import '../../common/color/color.dart';
import '../../common/style/style.dart';
import '../../utils/epragnancy_color.dart';
import '../consultation_page/list_post_page.dart';
import '../user_page/bloc/user_page_bloc.dart';
import 'user_detail_page.dart';
import 'homeworld_people.dart';
import 'list_starships_horizontal.dart';
import 'list_vehicle_horizontal.dart';

class BodyDetailPeople extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<UserPageBloc, UserPageState>(
      builder: (context, state) {
        String? dob = "";
        if (state.articleDetailModel?.dateOfBirth != null) {
          DateTime dt = DateTime.parse(
              state.articleDetailModel?.dateOfBirth ?? "0000-00-00 00:00:00");
          final df = DateFormat('yyyy MMM dd, HH:mm');
          dob = df.format(dt);
        }

        String? joinDate = "";
        if (state.articleDetailModel?.registerDate != null) {
          DateTime dt = DateTime.parse(
              state.articleDetailModel?.registerDate ?? "0000-00-00 00:00:00");
          final df = DateFormat('yyyy MMM dd, HH:mm');
          joinDate = df.format(dt);
        }
        return SingleChildScrollView(
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
                // color: AppColor.accent_2,
                ),
            child: Column(
              children: [
                Padding(
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
                      const NameAndProperties(),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          RectButton(
                            label: state.articleDetailModel?.gender ?? "-",
                          ),
                        ],
                      ),
                      const Spacing(),
                      state.submitStatus == FormzStatus.submissionInProgress
                          ? SizedBox(
                              child: Shimmer.fromColors(
                                baseColor: Colors.deepPurple,
                                highlightColor: Colors.grey,
                                child: Container(
                                    width: 50,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: EpregnancyColors.grey)),
                              ),
                            )
                          : Text(
                              "Date of birth : $dob",
                              style: AppStyle.h3,
                            ),
                      const Spacing(),
                      state.submitStatus == FormzStatus.submissionInProgress
                          ? SizedBox(
                              child: Shimmer.fromColors(
                                baseColor: Colors.deepPurple,
                                highlightColor: Colors.grey,
                                child: Container(
                                    width: 50,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: EpregnancyColors.grey)),
                              ),
                            )
                          : Text(
                              "Join date : $joinDate",
                              style: AppStyle.h3,
                            ),
                      const Spacing(),
                      state.submitStatus == FormzStatus.submissionInProgress
                          ? SizedBox(
                              child: Shimmer.fromColors(
                                baseColor: Colors.deepPurple,
                                highlightColor: Colors.grey,
                                child: Container(
                                    width: 50,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: EpregnancyColors.grey)),
                              ),
                            )
                          : Text(
                              "Email: ${state.articleDetailModel?.email ?? "-"}",
                              style: AppStyle.h3,
                            ),
                      const Spacing(),
                      state.submitStatus == FormzStatus.submissionInProgress
                          ? SizedBox(
                              child: Shimmer.fromColors(
                                baseColor: Colors.deepPurple,
                                highlightColor: Colors.grey,
                                child: Container(
                                    width: 50,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: EpregnancyColors.grey)),
                              ),
                            )
                          : Text(
                              "Address : ${state.articleDetailModel?.location?.street ?? "-"},"
                              " ${state.articleDetailModel?.location?.city ?? "-"}, ${state.articleDetailModel?.location?.state ?? "-"},"
                              "${state.articleDetailModel?.location?.country ?? "-"}",
                              style: AppStyle.h3,
                            ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Spacing(),
                Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListPostPage(
                          isFromUser: true,
                          id: state.articleDetailModel?.id ?? '',
                        ),
                      ),

              ],
            ),
          ),
        );
      },
    );
  }
}
