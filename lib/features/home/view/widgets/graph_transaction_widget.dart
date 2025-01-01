import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smoney/core/common/common.export.dart';

class GraphTransactionWidget extends StatefulWidget {
  const GraphTransactionWidget({super.key});

  @override
  State<GraphTransactionWidget> createState() => _GraphTransactionWidgetState();
}

class _GraphTransactionWidgetState extends State<GraphTransactionWidget> {
  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];
  late final List<DateTime> dates;

  @override
  void initState() {
    super.initState();
    _generateDates();
  }

  void _generateDates() {
    DateTime now = DateTime.now();
    // Lấy ngày đầu tháng hiện tại
    DateTime firstDayCurrentMonth = DateTime(now.year, now.month, 1);
    // Lấy ngày đầu tháng trước
    DateTime firstDayLastMonth = DateTime(now.year, now.month - 1, 1);
    // Lấy ngày cuối tháng trước (bằng cách lấy ngày liền trước ngày đầu tháng này)
    DateTime lastDayLastMonth =
        firstDayCurrentMonth.subtract(const Duration(days: 1));
    // Tính số ngày cần chia
    int totalDays = lastDayLastMonth.day; // Số ngày của tháng trước
    // Tạo 5 mốc thời gian
    dates = [];
    // Thêm ngày đầu tháng trước
    dates.add(firstDayLastMonth);
    // Thêm 3 mốc ở giữa
    int interval = (totalDays / 4).round(); // Chia đều tháng làm 4 phần
    for (int i = 1; i <= 3; i++) {
      dates.add(firstDayLastMonth.add(Duration(days: interval * i)));
    }
    // Thêm ngày đầu tháng hiện tại
    dates.add(firstDayCurrentMonth);
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card.filled(
        color: context.colorScheme.primaryContainer,
        margin: EdgeInsets.all(Dimens.size12),
        child: AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: Dimens.size18,
              left: Dimens.size12,
              top: Dimens.size24,
              bottom: Dimens.size12,
            ),
            child: LineChart(
              LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: 1,
                    verticalInterval: 1,
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                          color: context.colorScheme.primary,
                          width: Dimens.size2),
                      left: BorderSide(
                          color: context.colorScheme.primary,
                          width: Dimens.size2),
                    ),
                  ),
                  minX: 0,
                  maxX: 4,
                  minY: 0,
                  maxY: 5,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 0),
                        FlSpot(1, 2),
                        FlSpot(2, 4),
                        FlSpot(3, 1),
                        FlSpot(4, 4),
                      ],
                      gradient: LinearGradient(
                        colors: gradientColors,
                      ),
                      barWidth: Dimens.size2,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(
                        show: false,
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: gradientColors
                              .map((color) => color.withValues(alpha: 0.3))
                              .toList(),
                        ),
                      ),
                    )
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: bottomTitleWidgets,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 42,
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = context.textTheme.bodySmall;
    final dates = this.dates;
    final text = DateFormat('d MMM', 'vi_VN').format(dates[value.toInt()]);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = context.textTheme.bodySmall;
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0đ';
        break;
      case 1:
        text = '10đ';
        break;
      case 2:
        text = '20đ';
        break;
      case 3:
        text = '30đ';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
