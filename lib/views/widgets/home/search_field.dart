import 'package:flutter/material.dart';
import 'package:mini_e_commerce/core/colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: TextField(
        cursorColor: AppColors.secondaryColor,
        decoration: InputDecoration(
            prefixIconConstraints: const BoxConstraints(maxHeight: 40),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Icon(
                Icons.search,
                size: 20,
              ),
            ),
            filled: true,
            fillColor: AppColors.whiteColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            isCollapsed: true,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
