// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  final Function(String) onChange;
  final Function(String)? onSubmit;
  final String? lable;
  final String? hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialValue;
  final int? maxLines;
  final Color? backgroundColor;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final bool unFocusOnTapOutside;
  AppTextField({
    Key? key,
    required this.onChange,
    this.onSubmit,
    this.lable,
    this.hint = "",
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.initialValue,
    this.maxLines,
    this.backgroundColor,
    this.readOnly = false,
    this.inputFormatters,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.unFocusOnTapOutside = true,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String val = '';

  @override
  void initState() {
    val = widget.initialValue ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.lable != null) ...[
          Text(
            widget.lable!,
          ),
          const SizedBox(height: 8),
        ],
        SizedBox(
          height: widget.maxLines == null ? 60 : null,
          child: TextFormField(
            expands: widget.maxLines == null ? true : false,
            onTapOutside: widget.unFocusOnTapOutside
                ? (v) => FocusManager.instance.primaryFocus!.unfocus()
                : null,
            onChanged: (v) {
              setState(() {
                val = v;
              });
              widget.onChange(v);
            },
            controller: widget.controller,
            decoration: InputDecoration(
              fillColor: widget.backgroundColor,
              filled: widget.backgroundColor == null ? null : true,
              hintText: widget.hint,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
            ),
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            initialValue: widget.initialValue,
            maxLines: widget.maxLines,
            readOnly: widget.readOnly,
            autofocus: widget.autofocus,
            inputFormatters: widget.inputFormatters,
            onFieldSubmitted: widget.onSubmit,
            textCapitalization: widget.textCapitalization,
          ),
        ),
      ],
    );
  }
}
