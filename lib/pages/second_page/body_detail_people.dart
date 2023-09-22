import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shimmer/shimmer.dart';
import '../../common/color/color.dart';
import '../../common/style/style.dart';
import '../../utils/epragnancy_color.dart';
import '../first_page/bloc/article_bloc.dart';
import 'article_detail_page.dart';
import 'homeworld_people.dart';
import 'list_starships_horizontal.dart';
import 'list_vehicle_horizontal.dart';

class BodyDetailPeople extends StatelessWidget {
  const BodyDetailPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
              color: AppColor.secondary,
            ),
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
                  const NameAndProperties(),
                   SizedBox(
                    height: 16,
                  ),
                  state.submitStatus ==
                      FormzStatus.submissionInProgress
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
                  ):Text("Height : ${state.articleDetailModel?.height??"-"}",
                      style: AppStyle.text.copyWith(
                          color: Colors.white.withOpacity(.8))),
                  const Spacing(),
                  Row(
                    children:  [

                      RectButton(
                        label: state.articleDetailModel?.gender??"-",
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                 Row(
                    children: const [
                      TabTitle(label: 'Starships', selected: true),
                    ],
                  ),
                  const Spacing(),
                  state.listStarship != null && state.listStarship!.isNotEmpty?Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListStarshipsHorizontal(
                      listStarship: state.listStarship,
                    ),
                  ):Container(child: Text("-"),),
                  const Spacing(),
                  Row(
                    children: const [
                      TabTitle(label: 'Vehicle', selected: true),
                    ],
                  ),
                  const Spacing(),
                  state.listVehicle != null && state.listVehicle!.isNotEmpty?Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListVehicleHorizontal(
                      listVehicle: state.listVehicle,
                    ),
                  ):Container(child: Text("-"),),
                  const Spacing(),
                  Row(
                    children: const [
                      TabTitle(label: 'Homeworld', selected: true),
                    ],
                  ),
                  const Spacing(),
                  state.articleDetailModel != null?Container(
                    width: MediaQuery.of(context).size.width,
                    child:HomeworldPeople(planetModel: state.planetModel),
                  ):Container(child: Text("-"),),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
