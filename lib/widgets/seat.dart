import 'package:flutter/material.dart';

class Seat extends StatefulWidget {
  const Seat({
    super.key,
    required this.isFacingSouth,
    required this.seatNo,
    required this.seatLabel,
    required this.seatSize,
    required this.activeSeatNo,
  }) : active = seatNo == activeSeatNo;

  // the seats are facing south or not
  // (to incorporate different design acc to design specs)
  final bool isFacingSouth;

  final int seatNo;
  final String seatLabel;
  final double seatSize;

  // the seat no. which is currently being searched for
  final int activeSeatNo;
  final bool active;

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.activeSeatNo == widget.seatNo
            ? const Color.fromARGB(255, 0, 150, 255)
            : const Color.fromARGB(255, 206, 234, 255),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(8),
      width: widget.seatSize,
      height: widget.seatSize,
      child: Column(
        children: [
          if (!widget.isFacingSouth)
            Text(
              widget.seatLabel,
              textScaleFactor: .75,
              style:
                  widget.active ? const TextStyle(color: Colors.white) : null,
            ),
          const Spacer(),
          Text(
            widget.seatNo.toString(),
            textScaleFactor: 2,
            style: widget.active ? const TextStyle(color: Colors.white) : null,
          ),
          const Spacer(),
          if (widget.isFacingSouth)
            Text(
              widget.seatLabel,
              textScaleFactor: .75,
              style:
                  widget.active ? const TextStyle(color: Colors.white) : null,
            ),
        ],
      ),
    );
  }
}
