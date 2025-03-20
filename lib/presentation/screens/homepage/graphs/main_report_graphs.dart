import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:template/constants/text_styles.dart';

import '../../../../bloc/homepage/home_page_cubit.dart';

LineChartData orderCount(HomePageCubit cubit) {
  var data = cubit.mainReportModel!.data!.ordersInfo!;
  return LineChartData(
    gridData: FlGridData(show: true, drawVerticalLine: false),
    titlesData: FlTitlesData(
      bottomTitles: AxisTitles(
        axisNameWidget: Text(
          "Daily Orders Count Chart",
          style: CustomTextStyle().black16w600,
        ),
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) {
            int index = value.toInt();
            if (index >= 0 && index < data.length) {
              return Text(data[index].dateFormatted!,
                  style: const TextStyle(fontSize: 10));
            }
            return const Text('');
          },
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTitlesWidget: (value, _) => Text(value.toInt().toString(),
              style: const TextStyle(fontSize: 10)),
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(color: Colors.black, width: 1),
        left: BorderSide(color: Colors.black, width: 1),
        right: BorderSide.none,
        top: BorderSide.none,
      ),
    ),
    minX: 0,
    maxX: (data.length - 1).toDouble(),
    minY: 0,
    maxY: data
        .map((d) => d.count as int)
        .reduce((a, b) => a > b ? a : b)
        .toDouble(),
    lineBarsData: [
      LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 3,
        isStrokeCapRound: true,
        spots: List.generate(
          data.length,
          (index) => FlSpot(
            index.toDouble(),
            (data[index].count as int).toDouble(),
          ),
        ),
        belowBarData: BarAreaData(show: false),
      ),
    ],
  );
}

LineChartData orderCost(HomePageCubit cubit) {
  var data = cubit.mainReportModel!.data!.ordersInfo!;
  return LineChartData(
    gridData: FlGridData(show: true, drawVerticalLine: false),
    titlesData: FlTitlesData(
      bottomTitles: AxisTitles(
        axisNameWidget: Text(
          "Daily Costs Chart",
          style: CustomTextStyle().black16w600,
        ),
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) {
            int index = value.toInt();
            if (index >= 0 && index < data.length) {
              return Text(data[index].dateFormatted!,
                  style: const TextStyle(fontSize: 10));
            }
            return const Text('');
          },
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        /* axisNameWidget: Text(
          "Daily Costs Chart",
          style: CustomTextStyle().black16w600,
        ), */
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          getTitlesWidget: (value, _) => Text(value.toInt().toString(),
              style: const TextStyle(fontSize: 10)),
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(color: Colors.black, width: 1),
        left: BorderSide(color: Colors.black, width: 1),
        right: BorderSide.none,
        top: BorderSide.none,
      ),
    ),
    minX: 0,
    maxX: (data.length - 1).toDouble(),
    minY: 0,
    maxY: data
        .map((d) => d.amount as num)
        .reduce((a, b) => a > b ? a : b)
        .toDouble(),
    lineBarsData: [
      LineChartBarData(
        isCurved: false,
        color: Colors.blue,
        barWidth: 3,
        isStrokeCapRound: true,
        spots: List.generate(
          data.length,
          (index) => FlSpot(
            index.toDouble(),
            (data[index].amount as num).toDouble(),
          ),
        ),
        belowBarData: BarAreaData(show: false),
      ),
    ],
  );
}
