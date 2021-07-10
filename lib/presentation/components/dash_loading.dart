import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class DashLoading extends StatelessWidget {
  const DashLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
          child: Container(
            width: 30,
            height: 30,
            child: LoadingIndicator(
              indicatorType: Indicator.ballBeat,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
      ),
    );
  }
}
