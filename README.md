

Please Using flutter version 2.10.5

HOW TO RUNING THIS PROJECT

install flutter 2.10.5
pub get
run this code in terminal -> flutter packages pub run build_runner build --delete-conflicting-outputs
run apps

Naming convention
To reduce the effort needed to read and understand source code
1. variable : camelCase
2. class name: (upper) CamelCase
3. Folder name: snake_case
4. Use english!

Data Flow 
1. View -> PageEvent -> Bloc -> Repository -> Network/Sqlite or Both -> Bloc -> PageState -> View 
2. View -> PageEvent -> Bloc -> Repository -> Network/Sqlite or Both -> Bloc -> PageState -> Future -> View

Basic rules: 
1. lib/pages: ui only, no logic app allowed 
2. lib/bloc: logic only: no widget, no context, no access data directly.
3. lib/data: maintain and access data. 
4. lib/data/repositories/ : I/O data that needed in this repository
5. lib/data/repositories_impl/ : providing data. (can be fake repository)

 

Network
- File config url remote_constant.dart
- File penghubung http ke repository remote_datasource.dart
- Custom httpnya di http_client.dart

Database(Sqlite)
1. create script table in database.dart
2. create class Dao extending BaseDao
3. add dao di injector_config.dartk
4. run common.injector generator
5. implement di repository


Kiwi Injector
note:
-Add class in injector_config.dart
///////////////////////////////////////////////////
flutter packages pub run build_runner build
///////////////////////////////////////////////////
Note: On first attempt to run this command you might encounter a conflict error. If so, please add the --delete-conflicting-outputs argument to your command:
/////////////////////////////////////////////////////////////////////////////////////
flutter packages pub run build_runner build --delete-conflicting-outputs
/////////////////////////////////////////////////////////////////////////////////////

-json to model : https://javiercbk.github.io/json_to_dart/

HOW TO RUNING THIS PROJECT

install flutter 2.10.5
pub get
run this code in terminal -> flutter packages pub run build_runner build --delete-conflicting-outputs
run apps








# swapi
