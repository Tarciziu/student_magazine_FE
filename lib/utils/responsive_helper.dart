import 'package:flutter/material.dart';

EdgeInsetsGeometry responsivePadding(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;
  if (deviceWidth < 700) {
    return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0);
  } else if (deviceWidth < 1200) {
    return const EdgeInsets.symmetric(horizontal: 50.0, vertical: 25.0);
  } else if (deviceWidth < 1650) {
    return const EdgeInsets.symmetric(horizontal: 80.0, vertical: 40.0);
  }
  return const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0);
}

int responsiveNumGridTiles(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;
  if (deviceWidth < 700) {
    return 1;
  } else if (deviceWidth < 1200) {
    return 2;
  } else if (deviceWidth < 1650) {
    return 3;
  }
  return 4;
}

double responsiveImageHeight(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;
  if (deviceWidth < 700) {
    return 150.0;
  } else if (deviceWidth < 1200) {
    return mediaQuery.size.width * 0.15;
  } else if (deviceWidth < 1650) {
    return mediaQuery.size.width * 0.1;
  }
  return mediaQuery.size.width * 0.05;
}

double responsiveTitleHeight(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;
  if (deviceWidth < 700) {
    return 120.0;
  } else if (deviceWidth < 1200) {
    return mediaQuery.size.width * 0.1;
  } else if (deviceWidth < 1650) {
    return mediaQuery.size.width * 0.07;
  }
  return mediaQuery.size.width * 0.05;
}

double responsiveWordsNum(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;
  if (deviceWidth < 700) {
    return 30;
  } else if (deviceWidth < 1200) {
    return 120;
  } else if (deviceWidth < 1650) {
    return 200;
  }
  return 300;
}

String firstFewWords(MediaQueryData mediaQuery, String bigSentence){

  int startIndex = 0, indexOfSpace = 0;

  for(int i = 0; i < responsiveWordsNum(mediaQuery); i++){
    indexOfSpace = bigSentence.indexOf(' ', startIndex);
    if(indexOfSpace == -1){     //-1 is when character is not found
      return bigSentence;
    }
    startIndex = indexOfSpace + 1;
  }

  return bigSentence.substring(0, indexOfSpace) + '...';
}

double responsiveHtmlEditorHeight(MediaQueryData mediaQuery) {
  return mediaQuery.size.height * 0.3;
}