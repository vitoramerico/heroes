import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchWidgetDart extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  static const _borderRadius = BorderRadius.all(Radius.circular(5));

  const SearchWidgetDart({
    Key? key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 14.0),
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: _getInputDecoration(context),
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }

  InputDecoration _getInputDecoration(BuildContext context) {
    return InputDecoration(
      filled: true,
      fillColor: getBackgroundColor(context),
      hintText: hintText,
      prefixIcon: prefixIcon,
      hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
      focusedBorder: const OutlineInputBorder(
        borderRadius: _borderRadius,
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide.none,
      ),
      border: const OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide.none,
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide(width: 2, color: Colors.redAccent),
      ),
    );
  }

  Color? getBackgroundColor(BuildContext context) {
    var colorLight = Colors.grey[200];
    var colorDark = Theme.of(context).backgroundColor.withOpacity(0.3);

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return isDarkMode ? colorDark : colorLight;
  }
}
