import 'package:flutter/material.dart';
import 'package:readstack/scaffold.dart';
import 'package:solar_icons/solar_icons.dart';

class ShelfView extends StatefulWidget {
  const ShelfView({super.key});

  @override
  State<ShelfView> createState() => _ShelfViewState();
}

class _ShelfViewState extends State<ShelfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageScaffold(
        title: 'Shelf',
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  FlutterLogo(),
                  FlutterLogo(),
                  Spacer(),
                  FlutterLogo(),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return FlutterLogo();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Shelf',
    //       style: Theme.of(
    //         context,
    //       ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
    //     ),
    //   ),

    //   body: ,
    // );
  }
}
