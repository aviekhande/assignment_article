import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mockito/mockito.dart';

import '../theme/app_colors.dart';
import '../theme/textstyles.dart';

class Utils {
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
  }
}
