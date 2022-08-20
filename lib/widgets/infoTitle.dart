import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfomationTitleWidget extends StatelessWidget {
  const InfomationTitleWidget({
    Key? key,
    required String value,
  })  : value = value,
        super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Text(
          value,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
