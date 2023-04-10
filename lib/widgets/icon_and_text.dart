import 'package:app_compras/constant/text_widget.dart';
import 'package:flutter/material.dart';

Row IconAndTextWidget(String label, IconData icon, Color? iconColor,
    {double? size}) {
  return Row(
    children: [
      Icon(
        icon,
        color: iconColor,
        size: size ?? 16,
      ),
      SizedBox(width: 5),
      smallText(label),
    ],
  );
}
