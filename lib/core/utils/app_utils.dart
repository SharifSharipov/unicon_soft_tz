import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

sealed class AppUtils {
  AppUtils._();

  /// box
  static const Gap kGap = Gap(0);
  static const Gap kGap2 = Gap(2);
  static const Gap kGap3 = Gap(3);
  static const Gap kGap4 = Gap(4);
  static const Gap kGap5 = Gap(5);
  static const Gap kGap6 = Gap(6);
  static const Gap kGap8 = Gap(8);
  static const Gap kGap10 = Gap(10);
  static const Gap kGap12 = Gap(12);
  static const Gap kGap16 = Gap(16);
  static const Gap kGap18 = Gap(18);
  static const Gap kGap20 = Gap(20);
  static const Gap kGap24 = Gap(24);
  static const Gap kGap32 = Gap(32);
  static const Gap kGap40 = Gap(40);
  static const Gap kGap48 = Gap(48);

  /// Padding
  static const EdgeInsets kPaddingAll4 = EdgeInsets.all(4);
  static const EdgeInsets kPaddingAll6 = EdgeInsets.all(6);
  static const EdgeInsets kPaddingAll8 = EdgeInsets.all(8);
  static const EdgeInsets kPaddingAll9 = EdgeInsets.all(9);
  static const EdgeInsets kPaddingAll10 = EdgeInsets.all(10);
  static const EdgeInsets kPaddingAll12 = EdgeInsets.all(12);
  static const EdgeInsets kPaddingAll14 = EdgeInsets.all(14);
  static const EdgeInsets kPaddingAll16 = EdgeInsets.all(16);
  static const EdgeInsets kPaddingHor4 = EdgeInsets.symmetric(horizontal: 4);
  static const EdgeInsets kPaddingHor6 = EdgeInsets.symmetric(horizontal: 6);
  static const EdgeInsets kPaddingHor10 = EdgeInsets.symmetric(horizontal: 10);
  static const EdgeInsets kPaddingHor12 = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets kPaddingHor16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets kPaddingHor20 = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets kPaddingHor16Ver14 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
  );
  static const EdgeInsets kPaddingHor10Ver20 = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 20,
  );
  static const EdgeInsets kPaddingHor32Ver20 = EdgeInsets.symmetric(
    horizontal: 32,
    vertical: 20,
  );
  static const EdgeInsets kPaddingHor16Ver20 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 20,
  );
  static const EdgeInsets kPaddingHor16Ver12 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );
  static const EdgeInsets kPaddingHor16Ver4 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 4,
  );
  static const EdgeInsets kPaddingHor16Ver8 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );
  static const EdgeInsets kPaddingHor16Ver40 = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 40,
  );
  static const EdgeInsets kPaddingLeft16Right16Top45 = EdgeInsets.only(
    left: 16,
    top: 45,
    right: 16,
  );

  /// border radius
  static const Radius kRadius = Radius.zero;
  static const Radius kRadius8 = Radius.circular(8);
  static const Radius kRadius12 = Radius.circular(12);
  static const Radius kRadius14 = Radius.circular(16);
  static const Radius kRadius22 = Radius.circular(22);
  static const Radius kRadius24 = Radius.circular(24);
  static const BorderRadius kBorderRadius = BorderRadius.zero;
  static const BorderRadius kBorderRadius2 = BorderRadius.all(
    Radius.circular(2),
  );
  static const BorderRadius kBorderRadius4 = BorderRadius.all(
    Radius.circular(4),
  );
  static const BorderRadius kBorderRadius6 = BorderRadius.all(
    Radius.circular(6),
  );
  static const BorderRadius kBorderRadius8 = BorderRadius.all(
    Radius.circular(8),
  );
  static const BorderRadius kBorderRadius9 = BorderRadius.all(
    Radius.circular(9),
  );
  static const BorderRadius kBorderRadius10 = BorderRadius.all(
    Radius.circular(10),
  );
  static const BorderRadius kBorderRadius12 = BorderRadius.all(
    Radius.circular(12),
  );
  static const BorderRadius kBorderRadius14 = BorderRadius.all(
    Radius.circular(14),
  );
  static const BorderRadius kBorderRadius16 = BorderRadius.all(
    Radius.circular(16),
  );
  static const BorderRadius kBorderTopRadius14 = BorderRadius.only(
    topLeft: Radius.circular(14),
    topRight: Radius.circular(14),
  );
  static const BorderRadius kBorderTopRadius30 = BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  );
  static const BorderRadius kBorderBottomRadius14 = BorderRadius.only(
    bottomLeft: Radius.circular(14),
    bottomRight: Radius.circular(14),
  );
  static const BorderRadius kBorderBottomRadius16 = BorderRadius.only(
    bottomLeft: Radius.circular(16),
    bottomRight: Radius.circular(16),
  );
  static const BorderRadius kBorderBottomRadius18 = BorderRadius.only(
    bottomLeft: Radius.circular(18),
    bottomRight: Radius.circular(18),
  );
  static const BorderRadius kBorderBottomRadius20 = BorderRadius.only(
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );

  // /// Toast

  // static void showToast(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.black,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }
}
