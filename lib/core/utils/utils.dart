import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mockito/mockito.dart';

import '../config/app_config.dart';
import '../constants/app_fonts_size.dart';
import '../constants/app_icons.dart';
import '../theme/app_colors.dart';
import '../theme/textstyles.dart';

class Utils {
  // static Future<String> authHeader() async {
  //   String basicAuth =
  //       'Basic ${base64Encode(utf8.encode('${AppConfig.username}:${AppConfig.password}'))}';
  //   return basicAuth;
  // }

  // static Future<String> getAppVersion() async {
  //   PackageInfo? info = await PackageInfo.fromPlatform();
  //   return info.version.toString();
  // }

  // Future<String?> getDeviceId() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   String? deviceId;
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     deviceId = androidInfo.id.toString();
  //   } else if (Platform.isIOS) {
  //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //     deviceId = iosInfo.identifierForVendor.toString();
  //   }
  //   return deviceId;
  // }

  // static Future<void> openDialer(String phoneNumber) async {
  //   Uri callUrl = Uri.parse('tel:$phoneNumber');
  //   if (await canLaunchUrl(callUrl)) {
  //     await launchUrl(callUrl);
  //   } else {
  //     throw 'Could not open the dialler.';
  //   }
  // }

  static InterceptorsWrapper getLoggingInterceptor() {
    int count = 0;
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        count++;

        debugPrint(
          '${AppColors.cyan}Request[${options.method}] => PATH: ${options.path}$reset',
        );
        debugPrint(
          '${AppColors.white}Request HEADERS: ${options.headers}$reset',
        );
        debugPrint('${AppColors.yellow}Request DATA: ${options.data}$reset');
        debugPrint('${AppColors.magenta}API call count: $count');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint(
          '${AppColors.green}Response[${response.statusCode}] => DATA: ${response.data}$reset',
        );
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        debugPrint("test error:}");
        debugPrint(
          '${AppColors.red}Error[${e.response?.statusCode}] => MESSAGE: ${e.message}$reset',
        );
        debugPrint('${AppColors.red}Error DATA: ${e.response?.data}$reset');
        return handler.next(e);
      },
    );
  }

  // static String maskPhoneNumber({
  //   required String phoneNumber,
  //   required int digitsToMask,
  // }) {
  //   String maskedNum = '';
  //   for (int i = 0; i < phoneNumber.length; i++) {
  //     //     print(number[i]);
  //     if (i <= digitsToMask - 1) {
  //       maskedNum = '${maskedNum}x';
  //     } else {
  //       maskedNum = maskedNum + phoneNumber[i];
  //     }
  //   }

  //   return maskedNum;
  // }

  // DateTime? parseDate(String? dateStr) {
  //   if (dateStr == null || dateStr.isEmpty) {
  //     return null;
  //   }
  //   return DateFormat('dd-MM-yyyy').parse(dateStr);
  // }

  // static void showDateRangeBottomSheet({
  //   required BuildContext context,
  //   required DateTime? initialStartDate,
  //   required DateTime? initialEndDate,
  //   required Function(DateTime? start, DateTime? end) onSubmit,
  // }) {
  //   DateTime? startDate = initialStartDate;
  //   DateTime? endDate = initialEndDate;
  //   curvedBottomSheet(
  //     context: context,
  //     children: [
  //       StatefulBuilder(
  //         builder: (context, setState) {
  //           return Padding(
  //             padding: EdgeInsets.fromLTRB(
  //               0,
  //               0,
  //               0,
  //               MediaQuery.of(context).viewInsets.bottom + 24,
  //             ),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 dateField(
  //                   context: context,
  //                   label: "Start Date",
  //                   date: startDate,
  //                   onTap: () async {
  //                     final picked = await showDatePicker(
  //                       context: context,
  //                       initialDate: startDate ?? DateTime.now(),
  //                       firstDate: DateTime(2000),
  //                       lastDate: DateTime(2100),
  //                       builder: (context, child) {
  //                         return Theme(
  //                           data: Theme.of(context).copyWith(
  //                             colorScheme: ColorScheme.light(
  //                               primary: AppColors.kColorPrimary,
  //                               onPrimary: Colors.white,
  //                               onSurface: Colors.black,
  //                             ),
  //                             textButtonTheme: TextButtonThemeData(
  //                               style: TextButton.styleFrom(
  //                                 foregroundColor: AppColors.kColorPrimary,
  //                               ),
  //                             ),
  //                           ),
  //                           child: child!,
  //                         );
  //                       },
  //                     );
  //                     if (picked != null) setState(() => startDate = picked);
  //                   },
  //                 ),
  //                 const SizedBox(height: 12),
  //                 dateField(
  //                   context: context,
  //                   label: "End Date",
  //                   date: endDate,
  //                   onTap: () async {
  //                     final picked = await showDatePicker(
  //                       context: context,
  //                       initialDate: endDate ?? DateTime.now(),
  //                       firstDate: DateTime(2000),
  //                       lastDate: DateTime(2100),
  //                       builder: (context, child) {
  //                         return Theme(
  //                           data: ThemeData(
  //                             colorScheme: ColorScheme.light(
  //                               primary: Colors.green,
  //                               onPrimary: Colors.white,
  //                               onSurface: Colors.green,
  //                             ),
  //                           ),
  //                           child: child!,
  //                         );
  //                       },
  //                     );
  //                     if (picked != null) setState(() => endDate = picked);
  //                   },
  //                 ),
  //                 const SizedBox(height: 20),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Expanded(
  //                       child: GestureDetector(
  //                         onTap: () {
  //                           context.maybePop();
  //                         },
  //                         child: Container(
  //                           padding: EdgeInsets.symmetric(
  //                             vertical: 12.h,
  //                             horizontal: 8.w,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             color: AppColors.kColorCircleIssue,
  //                             borderRadius: BorderRadius.circular(12.r),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               "Cancel",
  //                               style: kTextStyleDMSans600.copyWith(
  //                                 fontSize: AppFontSize.f18,
  //                                 color: AppColors.kColorWhite,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(width: 24.w),
  //                     Expanded(
  //                       child: GestureDetector(
  //                         onTap: () => onSubmit(startDate, endDate),
  //                         child: Container(
  //                           padding: EdgeInsets.symmetric(
  //                             vertical: 12.h,
  //                             horizontal: 8.w,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             color: AppColors.kColorPrimary,
  //                             borderRadius: BorderRadius.circular(12.r),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               "Submit",
  //                               style: kTextStyleDMSans600.copyWith(
  //                                 fontSize: AppFontSize.f18,
  //                                 color: AppColors.kColorWhite,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  // static InputDecoration customInputDecoration(
  //   String hintText, {
  //   Widget? suffixIcon,
  // }) {
  //   return InputDecoration(
  //     hintText: hintText,
  //     hintStyle: kTextStyleDMSans500.copyWith(
  //       fontSize: AppFontSize.f16,
  //       color: AppColors.kColorblack75,
  //     ),
  //     filled: true,
  //     fillColor: AppColors.kColorWhite,
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(12),
  //       borderSide: BorderSide(color: AppColors.kColorblack10),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(12),
  //       borderSide: BorderSide(color: AppColors.kColorblack10),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(12),
  //       borderSide: BorderSide(color: AppColors.kColorblack10),
  //     ),
  //     suffixIcon: suffixIcon,
  //   );
  // }

  // static Widget dateField({
  //   required BuildContext context,
  //   required String label,
  //   required DateTime? date,
  //   required VoidCallback onTap,
  // }) {
  //   final formatted =
  //       date != null ? DateFormat('dd-MMM-yyyy').format(date) : "";

  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
  //       decoration: BoxDecoration(
  //         border: Border.all(color: AppColors.kColorblack10),
  //         borderRadius: BorderRadius.circular(12.r),
  //       ),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: Text(
  //               formatted.isNotEmpty ? formatted : label,
  //               style: kTextStyleDMSans500.copyWith(
  //                 fontSize: AppFontSize.f16,
  //                 color: AppColors.kColorblack75,
  //               ),
  //             ),
  //           ),
  //           Center(
  //             child: SvgPicture.asset(
  //               AppIcons.calenderIc,
  //               height: 24.h,
  //               width: 24.h,
  //               colorFilter: ColorFilter.mode(
  //                 AppColors.kColorblack75,
  //                 BlendMode.srcIn,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Future<String?> openDatePicker(
  //   BuildContext context,
  //   int isValue,
  //   String startDate,
  //   String endDate,
  // ) async {
  //   String date = "";
  //   DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate:
  //         (startDate == "Start date" || endDate == "End date")
  //             ? DateTime.now()
  //             : isValue == 0
  //             ? parseDate(startDate)
  //             : parseDate(endDate),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );

  //   date = DateFormat('dd-MM-yyyy').format(pickedDate!);
  //   return date;
  // }

  // static Future<bool> checkInternet(BuildContext context) async {
  //   final internetState = BlocProvider.of<NetworkBloc>(context).state;
  //   if (internetState is! NetworkFailure) {
  //     return true;
  //   } else {
  //     FToast fToast = FToast();
  //     fToast.init(context);

  //     // Remove any previous toasts before showing a new one
  //     fToast.removeQueuedCustomToasts();
  //     fToast.showToast(
  //       child: Container(
  //         padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(25.r),
  //           color: AppColors.kColorWhite,
  //           boxShadow: const [
  //             BoxShadow(
  //               color: Colors.black26,
  //               blurRadius: 10.0,
  //               offset: Offset(0, 3),
  //             ),
  //           ],
  //         ),
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             SizedBox(width: 8.w),
  //             Text(
  //               "No internet connection found.",
  //               style: kTextStyleDMSans500.copyWith(
  //                 fontSize: 10.sp,
  //                 color: AppColors.kColorPrimaryBg,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       fadeDuration: const Duration(milliseconds: 200),
  //       gravity: ToastGravity.BOTTOM,
  //       toastDuration: const Duration(seconds: 2),
  //     );
  //     return false;
  //   }
  // }

  static void showSnackBar(
    BuildContext context,
    String? message, {
    bool? isSuccess,
    SnackBarBehavior? snackBarBehavior = SnackBarBehavior.fixed,
  }) {
    if (message == null) return;

    if (true) {
      final overlay = Overlay.of(context, rootOverlay: true);

      final overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          bottom: 40.0,
          left: 16.0,
          right: 16.0,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: isSuccess == true
                    ? AppColors.kColorPrimary
                    : AppColors.kColorHighFull,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12.0.sp,
                vertical: 18.0.sp,
              ),
              child: Text(
                message,
                style: kTextStyleDMSans500.copyWith(
                  fontSize: 16.0.sp,
                  color: CupertinoColors.white,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );

      overlay.insert(overlayEntry);

      Future.delayed(const Duration(milliseconds: 2000), () {
        if (overlayEntry.mounted) overlayEntry.remove();
      });
    }
    //   //  else {
    //   //   ScaffoldMessenger.of(context).showSnackBar(
    //   //     SnackBar(
    //   //       content: SizedBox(
    //   //         child: Align(
    //   //           alignment: Alignment.centerLeft,
    //   //           child: Text(
    //   //             message,
    //   //             style: kTextStyleDMSans500.copyWith(fontSize: 16.sp),
    //   //           ),
    //   //         ),
    //   //       ),
    //   //       backgroundColor: isSuccess == true ? Colors.green : Colors.red,
    //   //       duration: const Duration(milliseconds: 2000),
    //   //       behavior: SnackBarBehavior.fixed,
    //   //       shape: RoundedRectangleBorder(
    //   //         borderRadius: BorderRadius.circular(10.r),
    //   //       ),
    //   //     ),
    //   //   );
    //   // }
    // }
  }
}
