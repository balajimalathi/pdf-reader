import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:readstack/dd/lib/design/model/book.dart';
import 'package:readstack/dd/lib/design/shelf.dart';
import 'package:readstack/dd/lib/design/ui2.dart';
import 'package:solar_icons/solar_icons.dart';

class UI1 extends StatefulWidget {
  const UI1({super.key});

  @override
  State<UI1> createState() => _UI1State();
}

class _UI1State extends State<UI1> {
  PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.6,
    keepPage: true,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // appBar: AppBar(title: Text('UI1')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UI2()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          TopSlider(
            title: "Wow! 25 Days without a break",
            subTitle: "You're ahead of 81% of readers",
            steps: 3,
          ),
          Header(textTheme: textTheme),
          // TODO: Learn orientiation builder, bitch!
          OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              _controller = PageController(
                initialPage: 0,
                viewportFraction: orientation == Orientation.portrait
                    ? 0.6
                    : 0.0,
                keepPage: true,
              );
              return BookCarousel(
                height: height,
                controller: _controller,
                width: width,
                textTheme: textTheme,
              );
            },
          ),

          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Want to Read",
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            SizedBox(width: 56, height: 56),
                            Positioned(
                              right: 0,
                              child: Container(
                                width: 24,
                                height: 36,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/books/1.jpg'),
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            Container(
                              width: 36,
                              height: 48,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/books/2.jpg'),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "3",
                            style: textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListItem(
            textTheme: textTheme,
            title: "Finished",
            value: "3 Books",
            onTap: () {},
          ),
          ListItem(
            textTheme: textTheme,
            title: "Bookmarks",
            value: "49 Items",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.textTheme,
    required this.title,
    required this.value,
    required this.onTap,
  });

  final TextTheme textTheme;
  final String title;
  final String value;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                title,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: onTap,
              child: Row(
                children: [
                  Text(value),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, size: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookCarousel extends StatelessWidget {
  const BookCarousel({
    super.key,
    required this.height,
    required PageController controller,
    required this.width,
    required this.textTheme,
  }) : _controller = controller;

  final double height;
  final PageController _controller;
  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.38,
      child: PageView(
        padEnds: false,
        controller: _controller,
        scrollDirection:
            Axis.horizontal, // Change to Axis.vertical for TikTok/Shorts layout
        onPageChanged: (int index) {
          print('Active page index changed to: $index');
        },
        children: books
            .map(
              (book) => BookCard(
                width: width,
                height: height,
                textTheme: textTheme,
                book: book,
              ),
            )
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Shelf',
              style: textTheme.headlineLarge?.copyWith(
                letterSpacing: -0.2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ShelfBookButton(text: "18"),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
    required this.book,
  });

  final double width;
  final double height;
  final TextTheme textTheme;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.5,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(book.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(bottom: 0, left: 0, child: ReadingProgress()),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(book.author, style: textTheme.labelMedium),
                  ],
                ),
              ),
              book.isAudio
                  ? InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(SolarIconsBold.headphonesRound, size: 16),
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(width: 4),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(SolarIconsBold.menuDots, size: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReadingProgress extends StatelessWidget {
  @Preview()
  const ReadingProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 12,
            width: 12,
            child: CircularProgressIndicator(
              value: 0.34,
              strokeWidth: 2,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
          SizedBox(width: 4),
          Text("34%", style: textTheme.labelLarge),
        ],
      ),
    );
  }
}

class TopSlider extends StatelessWidget {
  final String title, subTitle;
  final int steps;

  const TopSlider({
    super.key,
    required this.title,
    required this.subTitle,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(radius: 16, child: Text("$steps")),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subTitle,
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(SolarIconsBold.headphonesRound, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class ShelfBookButton extends StatelessWidget {
  final String text;

  const ShelfBookButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShelfView()),
        );
      },
      child: Row(
        children: [
          Text("$text Books"),
          SizedBox(width: 4),
          Icon(Icons.arrow_forward_ios, size: 12),
        ],
      ),
    );
  }
}

@Preview()
Widget topSliderPreview() => const TopSlider(
  title: 'Wow! 25 Days without a break',
  subTitle: "You're ahead of 81% of readers",
  steps: 3,
);

@Preview()
Widget shelfBookButtonPreview() => const ShelfBookButton(text: '18');
