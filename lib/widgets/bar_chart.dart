import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  //const BarChart({super.key});

  final List<double> expenses;
  BarChart(this.expenses);
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const Text(
            'Weekly expense',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_double_arrow_left,
              ),
              iconSize: 25,
            ),
            const Text(
              'Nov 1, 2023  -  Nov 7, 2023',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w300, letterSpacing: 1),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_double_arrow_right,
              ),
              iconSize: 25,
            )
          ]),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label: 'Sun',
                amountSpent: 80,
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Mon',
                amountSpent: 50,
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Tue',
                amountSpent: 30,
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Wed',
                amountSpent: 25,
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Thurs',
                amountSpent: 28,
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Fri',
                amountSpent: 35,
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Sat',
                amountSpent: 98,
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  // const Bar({super.key});
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150;

  Bar(
      {required this.label,
      required this.amountSpent,
      required this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\u{20B9}${amountSpent.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
