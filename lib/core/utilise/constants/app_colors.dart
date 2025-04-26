import 'package:flutter/material.dart';

class AppColors {
  //grey shades
  static const Color grey = Color(0xFF8e8e8e);
  static const Color grey1 = Color(0xFFEFEFEF);
  static const Color grey2 = Color(0xFF969696);
  static const Color grey3 = Color(0xFFAFAFAF);
  static const Color grey4 = Color(0xFFB6B2B2);
  static const Color grey5 = Color(0xFFF1F1F1);
  static const Color grey6 = Color(0xFFFAFAFA);
  static const Color grey7 = Color(0xFFDEDEDE);
  static const Color grey8 = Color(0xFF9D9D9D);
  static const Color calenderHourIndicatorColor = Color(0xFFCFCAE4);
  static const Color headingAndDisplayTxt = Color(0xFF5E5873);

  static const Color grey9 = Color(0xFFF7F7F7);
  static const Color grey10 = Color(0xFFE3E3E3);
  static const Color grey11 = Color(0xffe4e4e4);
  static const Color grey12 = Color(0xffD8D8D8);
  static const Color grey13 = Color(0xff959595);
  static const Color grey14 = Color(0xff777777);
  static const Color grey15 = Color(0xFF5A5A5A);

  static const Color greyBG = Color(0xFFDFDFDF);
  static const Color blackBG = Color(0xFF171C26);
  static const Color greenBG = Color(0xFF28C76F);
  static const Color greenDark = Color(0xFF075E07);
  static const Color greyLight = Color(0xFF1F4C6B);
  static const Color greyMain = Color(0xFFEAE9E9);
  static const Color faceBookBlue = Color(0xFF0C86E1);
  static const Color themeColorBody = Color(0xff6E6B7B);
  static const Color textColorChat = Color(0xFFEEEEEE);
  static const Color onLight800 = Color(0xFF252B41);
  static const Color transparent = Colors.transparent;
  static const Color themeSwitchActive = Color(0xFF24272C);

  // shades of primay
  static const Color primary = Color(0XFFc1a355);
  static const Color lighterPrimary = Color(0XFFFFCC90);
  static const Color darkerPrimary = Color(0XFFBD6C0C);
  static const Color secondary = Color(0XFF48525B);
  static const Color backGround = Color(0xFF252525);
  static const Color greyMedium = Color(0xFF53587A);
  static const Color greyBarelyMedium = Color(0xFFA1A5C1);
  static const Color typeOnProperty = Color(0xFF234F68);
  static const Color greySoft = Color(0xFFF5F4F8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xff252525);
  static const Color greenCyan = Color(0xFF337E89);

  // static const Color blackBG = Color(0xFF171C26);

  static const Color dateGrey = Color(0xFF747474);
  static const Color splashGradientColor = Color(0xFF001749);
  static const Color splashGradientColor2 = Color(0xFF21628A);

  //community
  static const Color postTextColor = Color(0xFF10141A);
  static const Color postTextLighterColor = Color(0xFF526875);
  static const Color postCommentTextColor = Color(0xFFBBB8B8);
  static const Color onSurfaceHighEmphasis = Color(0xFF212121);
  static const Color profileHeaderBlack = Color(0xFF262626);
  static const Color comGrayOne = Color(0xFF959595);
  static const Color title = Color(0xFF07142E);
  static const Color body = Color(0xFF6F7F92);
  static const Color redOne = Color(0xFFF1416C);
  static const Color redTwo = Color(0xFFEA5455);
  static const Color instaColor = Color(0xFFFB2877);
  static const Color purpleOne = Color(0xFFD500B3);

  static const Color textColor = Color(0xFF3A3F67);
  static const Color skipTextColor = Color(0xFF2A2A2A);
  static const Color onboardingSecondaryText = Color(0xFF292929);
  static const Color starColor = Color(0xFFFFC42D);
  static const Color shadowColorCircle = Color(0xFFc7bfde);

  static const Color disabled = Color(0xFF9DB2CE);
  static const Color formTextStyleColor = Color(0xff444150);
  static const Color whatsappGreen = Color(0xff25D366);
  static const Color darkGreen = Color(0xFF007700);

  // dashboard
  static const Color bg1 = Color(0xffEA5455);
  static const Color bg2 = Color(0xffD500B3);
  static const Color bg3 = Color(0xff00CFE8);
  static const Color bg4 = Color(0xff28C76F);
  static const Color bg5 = Color(0xff2DD4BF);
  static const Color bg6 = Color(0xffA855F7);

  static const Color barChartGradientColor1 = Color(0xFFFDA800);
  static const Color barChartGradientColor2 = Color(0xFF001749);

  static const Color pieChartGreen = Color(0xFF51C878);
  static const Color pieChartRed = Color(0xFFC40101);
  static const Color pieChartBlue = Color(0xFF0086FF);

  static MaterialStateProperty<Color?> checkboxActiveColor =
      MaterialStateProperty.resolveWith<Color>((states) {
    if (!states.contains(MaterialState.selected)) {
      return AppColors.backGround;
    }
    return AppColors.backGround;
  });
}

RadialGradient createRadialGradient(Color color1, Color color2,
    {AlignmentGeometry alignment = Alignment.topCenter,
    double radius = 1.8,
    double focalRadius = 0.0}) {
  return RadialGradient(
    colors: [color1, color2],
    center: alignment,
    radius: radius,
  );
}

RadialGradient differentRadialGradient(
  Color color1,
  Color color2,
) {
  return RadialGradient(
    colors: [color1, color2],
    focal: Alignment.topLeft,
    center: Alignment.bottomRight,
    radius: .2,
    focalRadius: 1,
    tileMode: TileMode.repeated,
  );
}
