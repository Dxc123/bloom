import 'package:flutter/material.dart';

class BlEmptyView extends StatelessWidget {
  const BlEmptyView({
    super.key,
    required this.onRefresh,
    this.top = 180,
  });

  final Function onRefresh;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          onRefresh.call();
        },
        child: Padding(
          padding: EdgeInsets.only(top: top),
          child: Column(
            children: [
              Image.asset(
                "assets/images/app/wi_home_empty.webp",
                fit: BoxFit.cover,
              ),
              const Text(
                'No data',
                style: TextStyle(
                  color: Color(0xFF181818),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
