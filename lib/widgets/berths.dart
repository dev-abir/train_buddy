import 'package:flutter/material.dart';
import 'package:train_buddy/widgets/seat.dart';
import 'package:train_buddy/widgets/seat_background.dart';

class Berths extends StatelessWidget {
  const Berths({
    super.key,
    required this.seatSize,
    required this.isFacingSouth,
    required this.startSeatNo,
    required this.activeSeatNo,
  });

  final double seatSize;
  final int startSeatNo;
  final int activeSeatNo;
  final bool isFacingSouth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SeatBackground(
            seatSize: seatSize, seatCount: 3, isFacingSouth: isFacingSouth),
        Transform.translate(
          offset: Offset(10 - 2, isFacingSouth ? 10 : -10),
          child: Row(
            children: [
              Seat(
                activeSeatNo: activeSeatNo,
                isFacingSouth: isFacingSouth,
                seatLabel: "LOWER",
                seatNo: startSeatNo,
                seatSize: seatSize,
              ),
              const SizedBox(width: 2),
              Seat(
                activeSeatNo: activeSeatNo,
                isFacingSouth: isFacingSouth,
                seatLabel: "MIDDLE",
                seatNo: startSeatNo + 1,
                seatSize: seatSize,
              ),
              const SizedBox(width: 2),
              Seat(
                activeSeatNo: activeSeatNo,
                isFacingSouth: isFacingSouth,
                seatLabel: "UPPER",
                seatNo: startSeatNo + 2,
                seatSize: seatSize,
              )
            ],
          ),
        ),
      ],
    );
  }
}
