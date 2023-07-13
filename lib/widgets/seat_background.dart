import 'package:flutter/material.dart';

class SeatBackground extends StatelessWidget {
  const SeatBackground(
      {super.key,
      required this.seatSize,
      required this.seatCount,
      required this.isFacingSouth});

  final double seatSize;
  final int seatCount;
  final bool isFacingSouth;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      // offset is mainly for seats towards north
      offset: Offset(0, isFacingSouth ? 0 : seatSize / 2 - 5),
      child: Container(
        // background decoration + translation of seats
        height: seatSize / 2 + (isFacingSouth ? 10 : 5),
        // seats total width + translation of seats
        width: seatSize * seatCount + 20,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 128, 203, 255),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
