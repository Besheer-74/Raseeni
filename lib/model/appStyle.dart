import 'package:flutter/material.dart';

class appStyles {
  //Color
  static const Color yellowColor = Color(0xffFDC613);
  static const Color blueColor = Color(0xff3C62DD);
  static const Color greenColor = Color(0xff00B232);
  static const Color orangeColor = Color(0xffFF7427);
  static const Color roseColor = Color(0xffFF017E);
  static const Color indigoColor = Color(0xff6338FE);
  static const Color whiteColor = Color(0xffF7F9F8);
  static const Color blackColor = Color(0xff050505);

  //Text Style
  static const TextStyle headlineBlack = TextStyle(
    fontFamily: 'IBM Plex Sans',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Color(0xff050505),
  );
  static const TextStyle headlineWhhite = TextStyle(
    fontFamily: 'IBM Plex Sans',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: Color(0xffF7F9F8),
  );

  static const TextStyle titleBlack = TextStyle(
    fontFamily: 'IBM Plex Sans',
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Color(0xff050505),
  );

  static const TextStyle titleWhite = TextStyle(
    fontFamily: 'IBM Plex Sans',
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Color(0xff050505),
  );

  static const TextStyle subTitleWhite = TextStyle(
    fontFamily: 'IBM Plex Sans',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color(0xffF7F9F8),
  );

  static const TextStyle subTitleBlack = TextStyle(
    fontFamily: 'IBM Plex Sans',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color(0xff050505),
  );

  // images
  static const String logo = 'assets/images/logo/Rasseni-removebg-preview.png';

  //Icons
  static const IconData home = Icons.home_filled;
  static const IconData profile = Icons.person_rounded;
  static const IconData dashboard = Icons.dashboard_rounded;
  static const IconData logout = Icons.logout_rounded;
  static const IconData chat = Icons.chat_rounded;
  static const IconData search = Icons.search_rounded;
  static const IconData notification_active =
      Icons.notifications_active_rounded;
  static const IconData notification_none = Icons.notifications_none_rounded;
  static const IconData menu = Icons.menu_rounded;
  static const IconData add = Icons.add_rounded;
  static const IconData edit = Icons.edit_rounded;
  static const IconData delete = Icons.delete_rounded;
  static const IconData save = Icons.save_rounded;
  static const IconData back = Icons.arrow_back_rounded;
}
