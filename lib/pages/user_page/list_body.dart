import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:social_media/data/model/people_model/people_model.dart';

import '../../routes/route_name.dart';
import '../../utils/epragnancy_color.dart';
import 'bloc/user_page_bloc.dart';

class ListArticleBody extends StatelessWidget {
  ListArticleBody();



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPageBloc, UserPageState>(
        builder: (context, state) {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16, crossAxisCount: 2),
            itemBuilder: (context, index) {
              String outputDate = "";
              var outputFormat = DateFormat.yMMMMd('id');
              outputDate = outputFormat.format(DateTime.parse(
                  state.listPeople![index].registerDate ?? "0000-00-00"));
              // 12/3
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteName.secondPage, arguments: {
                    "people_detail": state.listPeople?[index].id??'0'
                  });
                  // Injector.resolve<ArticlePageBloc>()
                  //     .add(ArticleReadDetailEvent(getIdOrPage( state.listArticle![index].url??'0')));
                },
                child: Container(
                  height: 300,
                  // padding: EdgeInsets.,
                  decoration: BoxDecoration(
                    image: state.listPeople != null &&
                        state.listPeople![index].picture != null
                        ? DecorationImage(
                      image: new NetworkImage(
                          state.listPeople?[index].picture ?? ""),
                      fit: BoxFit.cover,
                    )
                        : DecorationImage(
                      image: new AssetImage('assets/images/userImage.png'),
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black26,
                  ),
                  // color: Colors.greenAccent,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, top: 20, bottom: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: EpregnancyColors.primer.withAlpha(50)),
                    child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomLeft,
                                    // width: 80.w,
                                    margin: EdgeInsets.only(),
                                    child: Text(
                                     "${ state.listPeople?[index].title ??"-"}. "
                                         "${state.listPeople?[index].firstName ?? ''} "
                                         " ${state.listPeople?[index].lastName ?? ''}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ),
                            ])),
                  ),
                ),
              );
            },
            itemCount: state.listPeople!.length,
          );
        });
  }
}