import 'package:swapi/pages/first_page/bloc/article_bloc.dart';
import 'package:swapi/pages/first_page/list_article_vertical.dart';
import 'package:swapi/routes/routes.dart';
import 'package:swapi/utils/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/configurations/theme/my_theme.dart';
import 'common/injector/injector.dart';
import 'common/injector/injector_config.dart';
import 'env.dart' as config;

import 'common/configurations/configurations.dart';

Future<void> main() async {
  InjectorConfig.setup();
  WidgetsFlutterBinding.ensureInitialized();

  F.appFlavor = Flavor.DEVELOPMENT;

  await Configurations().setConfigurationValues(config.environment);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) { return  MultiBlocProvider(
          providers: _getProviders(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Games',
            home: ListArticleVertical(),
            // home: UkPage(UjiKelayakanModel()),
            onGenerateRoute: Routes.generateRoute,
            theme:  MyTheme.getThemeData(isLight: false),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          )); },
    );
  }

  List<BlocProvider> _getProviders() => [
    BlocProvider<ArticlePageBloc>(
        create: (context) =>
            Injector.container.resolve<ArticlePageBloc>()),  ];
}
