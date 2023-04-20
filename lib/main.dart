import 'package:base_app_new/pages/firstPage/bloc/article_bloc.dart';
import 'package:base_app_new/pages/firstPage/list_article_vertical.dart';
import 'package:base_app_new/routes/routes.dart';
import 'package:base_app_new/utils/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
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
    return MultiBlocProvider(
        providers: _getProviders(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Games',
          home: ListArticleVertical(),
          // home: UkPage(UjiKelayakanModel()),
          onGenerateRoute: Routes.generateRoute,
          theme: ThemeData(
            fontFamily: 'Sora',
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        ));
  }

  List<BlocProvider> _getProviders() => [
    BlocProvider<ArticlePageBloc>(
        create: (context) =>
            Injector.container.resolve<ArticlePageBloc>()),  ];
}
