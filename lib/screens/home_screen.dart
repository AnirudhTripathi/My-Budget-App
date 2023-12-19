import 'package:budget_app/data/data.dart';
import 'package:budget_app/expense/category_model.dart';
import 'package:budget_app/expense/expense_model.dart';
import 'package:budget_app/helpers/color_helper.dart';
import 'package:budget_app/widgets/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCategory(Category category, double totalAmountSpent) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.lightGreenAccent.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 10)
          ] // BoxShadow
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '\u{20B9}${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)} / \u{20B9}${(category.maxAmount).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            final double maxbarWidth = constraints.maxWidth;
            final double percent =
                (category.maxAmount - totalAmountSpent) / category.maxAmount;
            double barWidth = percent * maxbarWidth;
            if (barWidth < 0) {
              barWidth = 0;
            }
            return Stack(
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  height: 20,
                  width: barWidth,
                  decoration: BoxDecoration(
                    color: getColor(context, percent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            elevation: 20,
            pinned: true,
            //scrolledUnderElevation: 50,
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
            floating: true,
            snap: true,
            expandedHeight: 90.0,
            backgroundColor: Colors.lightGreenAccent.shade200,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Color.fromARGB(255, 130, 192, 59),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.settings,
                size: 28,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Budget app',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.black,
                    size: 28,
                  ))
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 0) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              color: Colors.lightGreenAccent.withOpacity(.1),
                              spreadRadius: 1,
                              blurRadius: 10)
                        ] // BoxShadow
                        ),
                    child: BarChart(weeklySpending),
                  );
                } else {
                  final Category category = categories[index - 1];
                  double totalAmountSpent = 0;
                  category.expenses.forEach((Expense expense) {
                    totalAmountSpent += expense.cost;
                  });
                  return _buildCategory(category, totalAmountSpent);
                }
              },
              childCount: 1 + categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
