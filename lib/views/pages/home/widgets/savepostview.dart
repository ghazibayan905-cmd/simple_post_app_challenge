import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLines;

  final String hintText;

  const CustomTextField({Key? key, this.maxLines, this.hintText = "Title"})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        maxLines: maxLines,
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.white,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 22),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
