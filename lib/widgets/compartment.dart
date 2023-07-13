import 'package:flutter/material.dart';
import 'package:train_buddy/widgets/side.dart';

import 'berths.dart';

class Compartment extends StatelessWidget {
  const Compartment({
    super.key,
    required this.seatSize,
    required this.activeSeatNo,
    required this.startSeatNo,
  });

  final double seatSize;
  final int startSeatNo;

  // the seat no. which is currently being searched for
  final int activeSeatNo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Berths(
                seatSize: seatSize,
                isFacingSouth: true,
                startSeatNo: startSeatNo,
                activeSeatNo: activeSeatNo),
            const SizedBox(height: 40),
            Berths(
                seatSize: seatSize,
                isFacingSouth: false,
                startSeatNo: startSeatNo + 3,
                activeSeatNo: activeSeatNo),
          ],
        ),
        Column(
          children: [
            Side(
                seatSize: seatSize,
                isFacingSouth: true,
                seatNo: startSeatNo + 6,
                activeSeatNo: activeSeatNo),
            const SizedBox(height: 40),
            Side(
                seatSize: seatSize,
                isFacingSouth: false,
                seatNo: startSeatNo + 7,
                activeSeatNo: activeSeatNo),
          ],
        )
      ],
    );
  }
}
