import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:marketinya/core/enums/go_router_paths.dart';
import 'package:marketinya/core/utils/image_utils.dart';
import 'package:marketinya/website/widgets/appBar/widgets/marketiniya_logo.dart';

class TabNavigationScreen extends StatefulWidget {

  const TabNavigationScreen({super.key, required this.child});
  final Widget child;

  @override
  State<TabNavigationScreen> createState() => _TabNavigationScreenState();
}

class _TabNavigationScreenState extends State<TabNavigationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const double _fontSize = 20;
  static const double _toolbarHeight = 180;
  static const double _logoHeight = 100;
  static const double _logoWidth = 126;
  static const double _dividerHeight = 2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTabIndex();
  }

  void _updateTabIndex() {
    final location = GoRouterState.of(context).uri.path;
    int index = 0;
    if (location.startsWith(GoRouterPaths.home.path)) {
      index = 0;
    } else if (location.startsWith(GoRouterPaths.blog.path)) {
      index = 1;
    } else if (location.startsWith(GoRouterPaths.services.path)) {
      index = 2;
    } else if (location.startsWith(GoRouterPaths.connectWithUs.path)) {
      index = 3;
    }

    if (_tabController.index != index) {
      _tabController.index = index;
    }
  }

  void _onTabTapped(int index) {
    switch (index) {
      case 0:
        context.go(GoRouterPaths.home.path);
        break;
      case 1:
        context.go(GoRouterPaths.blog.path);
        break;
      case 2:
        context.go(GoRouterPaths.services.path);
        break;
      case 3:
        context.go(GoRouterPaths.connectWithUs.path);
        break;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomAppBar(context),
      body: TabBarView(
        controller: _tabController,
        children: [
          widget.child,
          widget.child,
          widget.child,
          widget.child,
        ],
      ),
    );
  }

  PreferredSizeWidget _buildCustomAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: _toolbarHeight,
      title: _buildAppBarContent(context),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Column(
          children: [
            _buildCustomTabBar(context),
            _buildBottomDividerAndLabel(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBarContent(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MarketiniyaLogo(width: _logoWidth, height: _logoHeight),
      ],
    );
  }

  Widget _buildCustomTabBar(BuildContext context) {
    return  SizedBox(
      height: 50,
      child: Row(
        children: [
          // Left tabs (Начало, Блог)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildTabButton('Начало', 0)),
                Expanded(child: _buildTabButton('Блог', 1)),
              ],
            ),
          ),

          const SizedBox(width: _logoWidth ),
          // Right tabs (Услуги, Contact button)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildTabButton('Услуги', 2)),
                Expanded(child: _buildContactButton(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isActive = _tabController.index == index;

    return _TabButtonWrapper(
      isActive: isActive,
      onTap: () {
        _tabController.animateTo(index);
        _onTabTapped(index);
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: _fontSize,
          color: isActive
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildContactButton(BuildContext context) {
    final isActive = _tabController.index == 3;

    return _TabButtonWrapper(
      isActive: isActive,
      onTap: () {
        _tabController.animateTo(3);
        _onTabTapped(3);
      },
      isContactButton: true,
      child: Text(
        'Свържи се с нас',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isActive
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBottomDividerAndLabel(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Calculate divider width to stop at logo boundaries
    final logoAreaWidth = _logoWidth + 40; // logo width + padding
    final availableWidth = screenWidth - logoAreaWidth;
    final sideWidth = availableWidth / 2;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              // Left divider line
              Container(
                width: sideWidth,
                height: _dividerHeight,
                color: Theme.of(context).colorScheme.secondary,
              ),
              // Center area with logo space and label
              SizedBox(
                width: logoAreaWidth,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SvgPicture.asset(ImageUtils.marketinyaLabelPath),
                  ),
                ),
              ),
              // Right divider line
              Container(
                width: sideWidth,
                height: _dividerHeight,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              'По-добър маркетинг – по-добри резултати!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                fontFamily: 'GothamPro',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

}

class _TabButtonWrapper extends StatefulWidget {
  const _TabButtonWrapper({
    required this.isActive,
    required this.onTap,
    required this.child,
    this.isContactButton = false,
  });

  final bool isActive;
  final VoidCallback onTap;
  final Widget child;
  final bool isContactButton;

  @override
  State<_TabButtonWrapper> createState() => _TabButtonWrapperState();
}

class _TabButtonWrapperState extends State<_TabButtonWrapper> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: _isHovered
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
            borderRadius: BorderRadius.circular(
              widget.isContactButton ? 16 : 8
            ),
            border: _isHovered
              ? Border.all(
                  color: Colors.grey,
                  width: 2,
                )
              : widget.isActive
                  ? Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    )
                  : null,
          ),
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
