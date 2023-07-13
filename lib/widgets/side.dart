import 'package:flutter/material.dart';
import 'package:train_buddy/widgets/seat.dart';
import 'package:train_buddy/widgets/seat_background.dart';

class Side extends StatelessWidget {
  const Side({
    super.key,
    required this.seatSize,
    required this.isFacingSouth,
    required this.seatNo,
    required this.activeSeatNo,
  });

  final double seatSize;
  final bool isFacingSouth;
  final int seatNo;
  final int activeSeatNo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SeatBackground(
            seatSize: seatSize, seatCount: 1, isFacingSouth: isFacingSouth),
        Transform.translate(
          offset: Offset(10, isFacingSouth ? 10 : -10),
          child: Seat(
            activeSeatNo: activeSeatNo,
            isFacingSouth: isFacingSouth,
            seatLabel: isFacingSouth ? "SIDE LOWER" : "SIDE UPPER",
            seatNo: seatNo,
            seatSize: seatSize,
          ),
        ),
      ],
    );
  }
}
