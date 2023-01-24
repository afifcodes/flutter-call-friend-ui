import 'package:flutter/material.dart';
import 'package:flutter_call_friend_ui/screens/call_screen.dart';
import 'package:flutter_call_friend_ui/screens/home_screen.dart';
import 'package:flutter_call_friend_ui/utils/route_animation.dart';
import 'package:flutter_call_friend_ui/utils/route_arguments.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/call') {
          var arguments = settings.arguments as CallScreenArguments;
          return RouteAnimation.slide(
              settings,
              CallScreen(
                name: arguments.name,
                imageUrl: arguments.imageUrl,
              ));
        }
        return RouteAnimation.slide(settings, const HomeScreen());
      },
    ));
