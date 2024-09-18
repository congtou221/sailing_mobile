import 'package:flutter/material.dart';

// const MaterialColor primaryColor = MaterialColor(0xFF00d8c8, <int, Color>{
//   50: Color(0xFFeefffc),
//   100: Color(0xFFc6fff6),
//   200: Color(0xFF8effef),
//   300: Color(0xFF4dfbe6),
//   400: Color(0xFF19e8d5),
//   500: Color(0xFF00d8c8),
//   600: Color(0xFF00a49c),
//   700: Color(0xFF02837e),
//   800: Color(0xFF086764),
//   900: Color(0xFF0c5553),
//   950: Color(0xFF003334),
// });

Color transparentColor = const Color(0x00000000);
Color grayColor = const Color(0xFFF5F5F5);
Color whiteColor = const Color(0xFFFFFFFF);
Color blackColor = const Color(0xFF000000);
Color carbonBlackColor = const Color(0xFF141218);

// Color titleTextColor = const Color(0xFF2A292D);
// Color secondaryTitleTextColor = const Color(0xFF514C5D);
// Color thirdaryTitleTextColor = const Color(0xFF737374);
// Color fourtharyTitleTextColor = const Color(0xA6000000);

// Color titleTextColorDark = const Color(0xFFFFFFFF);
// Color secondaryTextColorDark = const Color(0xFFFFFFFF);
// Color thirdaryTextColorDark = const Color(0xFFFFFFFF);
// Color fourtharyTextColorDark = const Color(0xFFFFFFFF);

// double smallTitleTextSize = 16;
// double largeTextSize = 14;
// double mediumTextSize = 12;

// double smallTitleTextLineHeightSize = 22;
// double largeTextLineHeightSize = 20;
// double mediumTextLineHeightSize = 17;

double spacingExtraTight = 4;
double spacingTight = 8;
double spacingBaseTight = 12;
double spacingBase = 16;
double spacingExtraLoose = 32;
double spacingSuperLoose = 40;

double iconSize = 24;
double navigationBarHeight = 48;

double zeroSize = 0;

double borderRadius = 6;

double widthSmallItem = 64;

double heightSmallItem = 88;

// TextStyle titleTextStyle = TextStyle(
//     fontSize: largeTextSize,
//     color: titleTextColor,
//     height: largeTextLineHeightSize / largeTextSize);
// TextStyle secondaryTitleTextStyle = TextStyle(
//     fontSize: largeTextSize,
//     color: secondaryTitleTextColor,
//     height: largeTextLineHeightSize / largeTextSize);
// TextStyle thirdaryTitleTextStyle = TextStyle(
//     fontSize: mediumTextSize,
//     color: thirdaryTitleTextColor,
//     height: mediumTextLineHeightSize / mediumTextSize);
// TextStyle fourtharyTitleTextStyle = TextStyle(
//     fontSize: mediumTextSize,
//     color: fourtharyTitleTextColor,
//     height: mediumTextLineHeightSize / mediumTextSize);
// TextStyle smalleadLineTextStyle = TextStyle(
//     fontSize: smallTitleTextSize,
//     color: fourtharyTitleTextColor,
//     height: smallTitleTextLineHeightSize / smallTitleTextSize);

// TextStyle titleTextStyleDark = TextStyle(
//     fontSize: largeTextSize,
//     color: titleTextColorDark,
//     height: largeTextLineHeightSize / largeTextSize);
// TextStyle secondaryTitleTextStyleDark = TextStyle(
//     fontSize: largeTextSize,
//     color: secondaryTextColorDark,
//     height: largeTextLineHeightSize / largeTextSize);
// TextStyle thirdaryTitleTextStyleDark = TextStyle(
//     fontSize: mediumTextSize,
//     color: thirdaryTextColorDark,
//     height: mediumTextLineHeightSize / mediumTextSize);
// TextStyle fourtharyTitleTextStyleDark = TextStyle(
//     fontSize: mediumTextSize,
//     color: fourtharyTextColorDark,
//     height: mediumTextLineHeightSize / mediumTextSize);
// TextStyle smalleadLineTextStyleDark = TextStyle(
//     fontSize: smallTitleTextSize,
//     color: fourtharyTextColorDark,
//     height: smallTitleTextLineHeightSize / smallTitleTextSize);

// ThemeData lightTheme = ThemeData.light().copyWith(
//   colorScheme: ColorScheme.fromSwatch(
//     primarySwatch: primaryColor, // 选择一个颜色主题
//   ).copyWith(surface: whiteColor),
//   splashColor: transparentColor, // 设置水波纹颜色为透明
//   highlightColor: transparentColor,
//   hoverColor: transparentColor,
//   focusColor: transparentColor,
//   buttonTheme: ButtonThemeData(
//     splashColor: transparentColor, // 设置水波纹颜色为透明
//     highlightColor: transparentColor,
//     hoverColor: transparentColor,
//     focusColor: transparentColor,
//   ),
//   scaffoldBackgroundColor: whiteColor,
//   appBarTheme: AppBarTheme(
//       centerTitle: true,
//       titleTextStyle: smalleadLineTextStyle,
//       backgroundColor: whiteColor,
//       toolbarHeight: 56.0),
//   drawerTheme: DrawerThemeData(
//       backgroundColor: grayColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(borderRadius),
//           bottomRight: Radius.circular(borderRadius),
//         ),
//       )),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: whiteColor,
//   ),
//   // 文字主题
//   textTheme: TextTheme(
//     headlineSmall: smalleadLineTextStyle,
//     titleLarge: titleTextStyle,
//     titleMedium: secondaryTitleTextStyle,
//     titleSmall: thirdaryTitleTextStyle,
//     bodyLarge: fourtharyTitleTextStyle,
//   ),
//   // iconTheme: const IconThemeData(color: primaryColor),
//   // dividerTheme: DividerThemeData(
//   //   color: transparentColor, // 设置分割线的颜色为透明
//   //   thickness: 0.0, // 设置分割线的厚度为0，使其不可见
//   // ),
// );

// ThemeData darkTheme = ThemeData.dark().copyWith(
//   colorScheme: ColorScheme.fromSwatch(
//     primarySwatch: primaryColor, // 选择一个颜色主题
//   ).copyWith(surface: blackColor),
//   splashColor: transparentColor, // 设置水波纹颜色为透明
//   highlightColor: transparentColor,
//   hoverColor: transparentColor,
//   focusColor: transparentColor,
//   buttonTheme: ButtonThemeData(
//     splashColor: transparentColor, // 设置按钮水波纹颜色为透明
//     highlightColor: transparentColor, // 设置按钮高亮颜色为透明
//     hoverColor: transparentColor,
//     focusColor: transparentColor,
//   ),
//   appBarTheme: AppBarTheme(
//       centerTitle: true,
//       titleTextStyle: smalleadLineTextStyleDark,
//       foregroundColor: whiteColor,
//       backgroundColor: carbonBlackColor,
//       toolbarHeight: 56.0),
//   drawerTheme: DrawerThemeData(
//       backgroundColor: carbonBlackColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(borderRadius),
//           bottomRight: Radius.circular(borderRadius),
//         ),
//       )),
//   // 文字主题
//   textTheme: TextTheme(
//     headlineSmall: smalleadLineTextStyleDark,
//     titleLarge: titleTextStyleDark,
//     titleMedium: secondaryTitleTextStyleDark,
//     titleSmall: thirdaryTitleTextStyleDark,
//     bodyLarge: fourtharyTitleTextStyleDark,
//   ),
//   // iconTheme: const IconThemeData(color: primaryColor)
//   // dividerTheme: DividerThemeData(
//   //   color: transparentColor, // 设置分割线的颜色为透明
//   //   thickness: 0.0, // 设置分割线的厚度为0，使其不可见
//   // ),
// );
