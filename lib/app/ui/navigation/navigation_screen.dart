part of navigation;

class NavigationScreen extends StatefulWidget {
  final int? routeToPageIndex;

  const NavigationScreen({Key? key, this.routeToPageIndex}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedTab = 0;

  late final List<Widget> _screensList;

  final Map<int, GlobalKey<NavigatorState>> _navKeys = {};

  @override
  void initState() {
    super.initState();

    _screensList = [
      BlocProvider(
        create: (_) => PhotoBloc(photoGateway: injection(), typePhoto: TypePhoto.newPhoto)..add(PhotoFetch()),
        child: const PhotoScreen(
          typePhoto: TypePhoto.newPhoto,
        ),
      ),
      BlocProvider(
        create: (_) => PhotoBloc(photoGateway: injection(), typePhoto: TypePhoto.popularPhoto)..add(PhotoFetch()),
        child: const PhotoScreen(
          typePhoto: TypePhoto.popularPhoto,
        ),
      ),
    ];

    _initNavigationKeys();

    if (widget.routeToPageIndex != null) {
      _selectedTab = widget.routeToPageIndex!;
    }
  }

  void _initNavigationKeys() {
    _screensList.asMap().forEach((i, element) {
      _navKeys.putIfAbsent(i, () => GlobalKey<NavigatorState>());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: WillPopScope(
          onWillPop: () async => !await _navKeys[_selectedTab]!.currentState!.maybePop(),
          child: IndexedStack(
            index: _selectedTab,
            children: List.generate(
              _screensList.length,
              (index) => Navigator(
                key: _navKeys[index],
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => _screensList[index],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _selectedTab,
        onTap: (newSelectedTab) {
          if (_selectedTab == newSelectedTab) {
            _navKeys[_selectedTab]!.currentState!.popUntil((route) => route.isFirst);
          }

          setState(() => _selectedTab = newSelectedTab);
        },
      ),
    );
  }
}
