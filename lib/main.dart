import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widgets/compartment.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 3,
              color: Color.fromARGB(255, 128, 203, 255),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 3,
              color: Color.fromARGB(255, 128, 203, 255),
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 0, 150, 255),
          ),
          titleLarge: TextStyle(
            color: Color.fromARGB(255, 0, 150, 255),
            fontSize: 35,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _seatSize = 75;
  final int _totalNoOfSeats = 72;

  // seat no. which is currently being searched for
  int _activeSeatNo = 0;

  // for auto-scroll
  final ItemScrollController _scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Seat Finder',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: false,
                  decimal: false,
                ),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: "Enter Seat Number...",
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                onChanged: (String value) {
                  // on searching for a seat
                  // 1. Check whether it is a proper no. and within range
                  int? selectedSeatNo = int.tryParse(value);
                  if (selectedSeatNo != null &&
                      selectedSeatNo > 0 &&
                      selectedSeatNo <= _totalNoOfSeats) {
                    // 2. Update state
                    setState(() {
                      _activeSeatNo = selectedSeatNo;
                    });
                    // 3. Scroll to the highlighted seat
                    _scrollController.scrollTo(
                      // (see below, the ScrollablePositionedList's builder
                      // has direct children which are Compartments,
                      // so even if we have 72 seats, direct children for
                      // ScrollablePositionedList is 9(= 72 / 8))
                      index: ((selectedSeatNo - 1) / 8).floor(),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutQuad,
                    );
                  }
                }),
            const SizedBox(height: 5),
            Expanded(
              child: ScrollablePositionedList.builder(
                itemScrollController: _scrollController,
                // (again, ScrollablePositionedList builder's
                // direct children are Compartments,
                // so even if we have 72 seats, direct children for
                // ScrollablePositionedList is 9(= 72 / 8))
                itemCount: (_totalNoOfSeats / 8).round(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Compartment(
                      seatSize: _seatSize,
                      activeSeatNo: _activeSeatNo,
                      // each compartment has 8 seats,
                      // naturally start seat no. will
                      // increment by 8
                      startSeatNo: index * 8 + 1,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
