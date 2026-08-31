import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:solar_icons/solar_icons.dart';

class UI2 extends StatefulWidget {
  const UI2({super.key});

  @override
  State<UI2> createState() => _UI2State();
}

class _UI2State extends State<UI2> {
  String _analyticsPeriod = '1W';

  static const _periodLabels = {
    '1W': '1 week',
    '1M': '1 month',
    '3M': '3 months',
    '1Y': '1 year',
  };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final textTheme = Theme.of(context).textTheme;
    const weekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    var data = [82.0, 98.0, 110.0, 91.0, 124.0, 68.0, 88.0];
    final axisLabelStyle =
        (textTheme.labelSmall ?? const TextStyle(fontSize: 10)).copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          StreakCard(
            asset: 'assets/anim/fire.json',
            title: "Streak",
            icon: SolarIconsOutline.fire,
            rightWidget: CircleAvatar(radius: 48, child: Text("A")),
            stats: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "25",
                        style: textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " days",
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Text("Your habit is taking shape"),
              ],
            ),
          ),
          StreakCard(
            asset: 'assets/anim/target.json',
            title: "Daily Goals",
            icon: SolarIconsOutline.archive,
            rightWidget: Text(
              "Almost there",
              style: textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            stats: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "13",
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: " 15 min",
                    style: textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          StreakCard(
            asset: 'assets/anim/hour.json',
            title: "Reading Speed",
            icon: SolarIconsOutline.speedometerMax,
            rightWidget: Text("+6 today"),
            stats: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "104",
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: " wpm",
                    style: textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: LottieWidget(
                                      asset: 'assets/anim/chart.json',
                                    ),
                                  ),
                                  Text("Analytics"),
                                  Icon(
                                    SolarIconsOutline.altArrowRight,
                                    size: 16,
                                  ),
                                  Spacer(),
                                  PopupMenuButton<String>(
                                    initialValue: _analyticsPeriod,
                                    tooltip: 'Select period',
                                    padding: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    onSelected: (value) {
                                      setState(() => _analyticsPeriod = value);
                                    },

                                    itemBuilder: (context) => _periodLabels
                                        .entries
                                        .map(
                                          (entry) => PopupMenuItem(
                                            value: entry.key,
                                            child: Text(entry.value),
                                          ),
                                        )
                                        .toList(),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.surfaceContainerHighest,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            _analyticsPeriod,
                                            style: textTheme.labelSmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          const Icon(
                                            Icons.unfold_more,
                                            size: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              SizedBox(height: 8),
                              Text(
                                "Your reading speed went up by 6 wpm this week, and you cut your reading time from 24 to 19 minutes.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Avg. Speed"),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "104",
                                  style: textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: " wpm",
                                  style: textTheme.bodySmall?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text("Detailed"),
                              Icon(SolarIconsOutline.altArrowRight, size: 16),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width * 0.5,
                        height: 120.0,
                        child: Sparkline(
                          data: data,
                          min: 0,
                          lineWidth: 3.0,
                          pointsMode: PointsMode.all,
                          pointSize: 8.0,
                          pointColor: Theme.of(context).colorScheme.primary,
                          lineGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).colorScheme.primaryContainer,
                              Theme.of(context).colorScheme.primary,
                            ],
                          ),
                          xLabels: weekdays,
                          xLabelsStyle: axisLabelStyle,
                          gridLinesEnable: true,
                          gridLineAmount: 3,
                          gridLineWidth: 0.5,
                          gridLineColor: Theme.of(
                            context,
                          ).colorScheme.outlineVariant,
                          gridLineLabelFixed: true,
                          gridLineLabelPrecision: 0,
                          gridLinelabel: (value) => value.round().toString(),
                          gridLineLabelStyle: axisLabelStyle,
                          averageLine: true,
                          averageLabel: false,
                          averageLineColor: Theme.of(
                            context,
                          ).colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StreakCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget stats;
  final Widget rightWidget;
  final String asset;
  const StreakCard({
    super.key,
    required this.title,
    required this.icon,
    required this.stats,
    required this.rightWidget,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: LottieWidget(asset: asset),
                        ),
                        Text(title),
                        Icon(SolarIconsOutline.altArrowRight, size: 16),
                      ],
                    ),
                    Spacer(),
                    SizedBox(height: 8),
                    stats,
                  ],
                ),
              ),
              rightWidget,
            ],
          ),
        ),
      ),
    );
  }
}

class LottieWidget extends StatelessWidget {
  final String asset;
  const LottieWidget({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(asset, width: 16, height: 16);
  }
}
