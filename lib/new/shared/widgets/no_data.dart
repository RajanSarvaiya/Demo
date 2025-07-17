import 'package:flutter/material.dart';
import 'package:traning/new/shared/utils/textstyles/bold_textstyles.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title ?? "No Data", style: text16Bold),
    );
  }
}
