import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../data/default_values.dart';
import '../data/world_currency_symbols.dart';
Widget selectableList(String value, bool isFrom,
    Function(bool, String) changeCurr, ThemeData themeData) {

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 6.0),
    decoration: BoxDecoration(
      borderRadius: borderRadius1,
      color: themeData.backgroundColor,
      border: Border.all(
        color: themeData.primaryColor,
      ),
    ),
    width: 35.w,
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        hint: const Text('Select'),
        menuMaxHeight: 40.h,
        dropdownColor: themeData.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        style: GoogleFonts.poppins(color: themeData.primaryColor),
        value: value,
        items: currencyDetails.map(
              (item) {
            String currencyCode = item['Code'];
            String currencySymbol = item['Symbol'];
            String flagPng = item['Flag'];
            return DropdownMenuItem<String>(
              value: item['Code'],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    child: Image.network(flagPng, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 10),
                  Text(
                    currencyCode,
                    style: GoogleFonts.lato(
                      color: themeData.primaryColor,
                      fontSize: 12.sp,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    currencySymbol,
                    style: GoogleFonts.lato(
                      color: themeData.primaryColor,
                      fontSize: 12.sp,
                    ),
                  ),

                ],
              ),
            );
          },
        ).toList(),
        onChanged: (String? value) {
          changeCurr(isFrom, value.toString());
        },
      ),
    ),
  );
}


