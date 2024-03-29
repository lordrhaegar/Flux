import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:unicons/unicons.dart';

import '../data/default_values.dart';
import 'number_button.dart';

Padding buttonsGrid(
  Function(String) changeAmount,
  Function() backspace,
  ThemeData themeData,
) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 5.w,
      vertical: 5.h,
    ),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 12,
      itemBuilder: (BuildContext context, int i) {
        if (i == 9) {
          return numberButton(',', changeAmount, themeData);
        } else if (i == 10) {
          return numberButton(0.toString(), changeAmount, themeData);
        } else if (i == 11) {
          return Center(
            child: GestureDetector(
              onTap: () => backspace(),
              child: Container(
                width: 20.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: themeData.secondaryHeaderColor,
                ),
                child: Center(
                  child: Padding(
                    padding: paddingAll1,
                    child: Icon(
                      UniconsLine.backspace,
                      size: 22.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return numberButton(
            (i + 1).toString(),
            changeAmount,
            themeData,
          );
        }
      },
    ),
  );
}
