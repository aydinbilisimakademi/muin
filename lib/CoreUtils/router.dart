import 'package:flutter/material.dart';
import 'routing_constants.dart';
import 'package:muin/pages/page_login.dart';
import 'package:muin/pages/page_home.dart';
import 'package:muin/pages/page_error.dart';
import 'package:muin/pages/page_result.dart';
import 'package:muin/pages/page_quiz.dart';
import 'package:muin/pages/page_quiz_list.dart';
import 'package:muin/pages/page_match.dart';
import 'package:muin/pages/page_palacement.dart';
import 'package:muin/pages/page_findout.dart';
//import 'package:muin/pages/page_game_color_number.dart';
import 'package:muin/pages/page_game_colors_numbers.dart';

/*
* kullanim
* Navigator.of(context).pushNamed(PageErrorRoute, arguments: "mail adresi giristen gelen");
  Navigator.pushReplacementNamed(context, PageHomeRoute);
* */


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){


    switch(settings.name){
      case PageRouteLogin : {
        /*
        if(args is String){
          return MaterialPageRoute(builder: (_) => PageHome(
            email: args,
          ));
        }
        */
        return MaterialPageRoute(builder: (_) => PageLogin());
      }

      case PageRouteHome : {
        return MaterialPageRoute(builder : (_) => PageHome());
      }

      case PageRouteQuiz : {
        return MaterialPageRoute(builder : (_) => PageQuiz());
      }

      case PageRouteResult : {
        return MaterialPageRoute(builder: (_) => PageResult(sonuc : settings.arguments));
      }

      case PageRouteQuizList: {
        return MaterialPageRoute(builder: (_) => PageQuizList());
      }

      case PageRouteMatch: {
        return MaterialPageRoute(builder: (_) => PageMatch());
      }

      case PageRoutePlacement: {
        return MaterialPageRoute(builder: (_) => PagePlacement());
      }

      case PAgeRouteFindOut: {
        return MaterialPageRoute(builder: (_) => PageFindOut());
      }

      case PageRouteGameColorNumber: {
        return MaterialPageRoute(builder: (_) => PageGameColorsNumbers());
      }







      case PageErrorRoute : {
        return MaterialPageRoute(builder: (_) => PageError());
      }

      default : {
        return MaterialPageRoute(builder: (_) => PageError());
      }
    }


  }

}

