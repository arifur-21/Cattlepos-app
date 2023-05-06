

import 'package:cattle_pos_app/resources/routes/routes_name.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../screens/login_screen/login_screen.dart';

class AppRoutes{
 static appRoutes()=>[
   GetPage(name: RoutesName.loginScreen, page: ()=>LoginScreen(), transition: Transition.leftToRightWithFade,
       transitionDuration: Duration(milliseconds: 250)),
 ];
}