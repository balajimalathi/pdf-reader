import 'package:flutter/material.dart';
import 'package:readstack/scaffold.dart';
import 'package:solar_icons/solar_icons.dart';

class ShelfView extends StatefulWidget {
  const ShelfView({super.key});

  @override
  State<ShelfView> createState() => _ShelfViewState();
}

class _ShelfViewState extends State<ShelfView> {
  final _searchController = TextEditingController();
  String _fileFilter = 'All files';
  String _sort = 'Most recent';
  bool _isGrid = true;

  static const _fileFilters = ['All files', 'Documents', 'Images'];
  static const _sortOptions = ['Most recent', 'Oldest', 'Name'];

  static const _items = [
    _ShelfItem(
      title: 'Cx Results',
      date: 'Mar 10, 2025',
      image: 'assets/books/1.jpg',
    ),
    _ShelfItem(
      title: 'Gut Microbiome',
      date: 'Mar 10, 2025',
      image: 'assets/books/2.jpg',
    ),
    _ShelfItem(
      title: 'Face Scan',
      date: 'Mar 4, 2025',
      image: 'assets/books/3.jpg',
    ),
    _ShelfItem(
      title: 'Clinical Test',
      date: 'Feb 28, 2025',
      image: 'assets/books/1.jpg',
    ),
    _ShelfItem(
      title: 'Lab Panel',
      date: 'Feb 12, 2025',
      image: 'assets/books/2.jpg',
    ),
    _ShelfItem(
      title: 'Scan History',
      date: 'Jan 30, 2025',
      image: 'assets/books/3.jpg',
    ),
    _ShelfItem(
      title: 'Follow Up',
      date: 'Jan 18, 2025',
      image: 'assets/books/1.jpg',
    ),
    _ShelfItem(
      title: 'Baseline',
      date: 'Jan 4, 2025',
      image: 'assets/books/2.jpg',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_ShelfItem> get _visibleItems {
    final query = _searchController.text.trim().toLowerCase();
    var items = _items.where((item) {
      if (query.isEmpty) return true;
      return item.title.toLowerCase().contains(query);
    }).toList();

    switch (_sort) {
      case 'Oldest':
        items = items.reversed.toList();
      case 'Name':
        items.sort((a, b) => a.title.compareTo(b.title));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final items = _visibleItems;

    return Scaffold(
      body: PageScaffold(
        title: 'Shelf',
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(112),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(SolarIconsOutline.magnifier, size: 18),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _FilterMenu(
                      value: _fileFilter,
                      options: _fileFilters,
                      onSelected: (value) {
                        setState(() => _fileFilter = value);
                      },
                    ),
                    const SizedBox(width: 16),
                    _FilterMenu(
                      value: _sort,
                      options: _sortOptions,
                      onSelected: (value) {
                        setState(() => _sort = value);
                      },
                    ),
                    const Spacer(),
                    _ViewToggle(
                      icon: SolarIconsOutline.widget_4,
                      selected: _isGrid,
                      onTap: () => setState(() => _isGrid = true),
                    ),
                    const SizedBox(width: 4),
                    _ViewToggle(
                      icon: SolarIconsOutline.hamburgerMenu,
                      selected: !_isGrid,
                      onTap: () => setState(() => _isGrid = false),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        child: items.isEmpty
            ? CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'No files found',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : _isGrid
            ? GridView.builder(
                key: const PageStorageKey('shelf-grid'),
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _ShelfCard(item: items[index]);
                },
              )
            : ListView.separated(
                key: const PageStorageKey('shelf-list'),
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                itemCount: items.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _ShelfListTile(item: items[index]);
                },
              ),
      ),
    );
  }
}

class _ShelfItem {
  final String title;
  final String date;
  final String image;

  const _ShelfItem({
    required this.title,
    required this.date,
    required this.image,
  });
}

class _FilterMenu extends StatelessWidget {
  final String value;
  final List<String> options;
  final ValueChanged<String> onSelected;

  const _FilterMenu({
    required this.value,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopupMenuButton<String>(
      initialValue: value,
      padding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: onSelected,
      itemBuilder: (context) => options
          .map((option) => PopupMenuItem(value: option, child: Text(option)))
          .toList(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: textTheme.bodyMedium),
          const Icon(SolarIconsOutline.altArrowDown, size: 14),
        ],
      ),
    );
  }
}

class _ViewToggle extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ViewToggle({
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: selected
          ? colorScheme.surfaceContainerHighest
          : Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 18,
            color: selected
                ? colorScheme.onSurface
                : colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class _ShelfCard extends StatelessWidget {
  final _ShelfItem item;

  const _ShelfCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.date,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_horiz,
                size: 18,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShelfListTile extends StatelessWidget {
  final _ShelfItem item;

  const _ShelfListTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item.image,
              width: 56,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.date,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.more_horiz, size: 18, color: colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }
}
