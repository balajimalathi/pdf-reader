import 'dart:math';

import 'package:flutter/material.dart';

/// Created by Balaji Malathi on 4/23/2025 at 12:26.
class PageScaffold extends StatefulWidget {
  final String title;
  final List<Widget>? actions;
  final Widget child;
  final Widget? bottom;

  const PageScaffold({
    super.key,
    required this.title,
    this.actions,
    required this.child,
    this.bottom,
  });

  @override
  State<PageScaffold> createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold>
    with TickerProviderStateMixin {
  static const _kBasePadding = 12.0;
  static const kExpandedHeight = 140.0;

  final ValueNotifier<double> _titlePaddingNotifier = ValueNotifier(
    _kBasePadding,
  );

  final _scrollController = ScrollController();

  double get _horizontalTitlePadding {
    const kCollapsedPadding = 56.0;

    if (_scrollController.hasClients) {
      return min(
        _kBasePadding + kCollapsedPadding,
        _kBasePadding +
            (kCollapsedPadding * _scrollController.offset) /
                (kExpandedHeight - kToolbarHeight),
      );
    }

    return _kBasePadding > 56 ? _kBasePadding : 56;
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      _titlePaddingNotifier.value = _horizontalTitlePadding;
      print(_horizontalTitlePadding);
    });
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: kExpandedHeight,
            floating: true,
            pinned: true,
            actions: widget.actions,
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: false,
              titlePadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 0,
              ),
              title: ValueListenableBuilder<double>(
                valueListenable: _titlePaddingNotifier,
                builder: (context, value, child) {
                  print('value: $value');
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: value),
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            letterSpacing: -1,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                    ),
                  );
                },
              ),
            ),
          ),
        ];
      },
      body: widget.child,
    );
  }
}
