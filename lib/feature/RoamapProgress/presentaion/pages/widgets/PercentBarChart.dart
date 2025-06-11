import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_bloc.dart';

class PercentBarChart extends StatelessWidget {
// مثل [75, 60, 40, 90, 50]

  const PercentBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<GetUserProgressRoadmapBloc>(context).percentages;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: BarChart(
        BarChartData(
          maxY: 100,
          minY: 0,
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'S ${value.toInt() + 1}',
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                },
                interval: 1,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 20,
                getTitlesWidget: (value, _) => Text(
                  '${value.toInt()}',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          barGroups: List.generate(bloc.length, (index) {
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: bloc[index],
                  color: Colors.greenAccent,
                  width: 20,
                  borderRadius: BorderRadius.circular(4),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: 100,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            );
          }),
        ),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ),
    );
  }
}
