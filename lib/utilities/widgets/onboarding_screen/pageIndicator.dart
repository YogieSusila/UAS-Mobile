import 'package:flutter/material.dart';

List<Widget> pageIndicator(
  int numOfPages,
  int currentPage,
  bool isPageIndicatorCircle,
) {
  List<Widget> list = [];

  for (int i = 0; i < numOfPages; i++) {
    list.add(i == currentPage
        ? currentPageIndicator(true, isPageIndicatorCircle)
        : currentPageIndicator(false, isPageIndicatorCircle));
  }
  return list;
}

Widget currentPageIndicator(bool isActive, bool isPageIndicatorCircle) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height: 5,
    width: isPageIndicatorCircle ? 8 : 12,
    decoration: pageIndicatorBoxDecoration(isActive, isPageIndicatorCircle),
  );
}

Decoration pageIndicatorBoxDecoration(isActive, isPageIndicatorCircle) {
  return BoxDecoration(
    color: isActive ? Colors.white : Colors.grey[300],
    borderRadius: BorderRadius.all(
      Radius.circular(
        isPageIndicatorCircle ? 5 : 20,
      ),
    ),
  );
}
