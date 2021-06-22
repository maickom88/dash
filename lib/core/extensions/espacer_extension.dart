import 'package:flutter/material.dart';

extension EspacerExtension on Widget {
  Padding withPaddingVertical({double size = 20}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size),
      child: this,
    );
  }

  SizedBox withSpaceHeight({double size = 20}) {
    return SizedBox(height: size);
  }

  SizedBox withSpaceWidth({double size = 10}) {
    return SizedBox(width: size);
  }
}
