import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'auth/supabase_auth/supabase_user_provider.dart';
import 'auth/supabase_auth/auth_util.dart';

import '/backend/supabase/supabase.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await SupaFlow.initialize();

  await FlutterFlowTheme.initialize();

  await FFLocalizations.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = FFLocalizations.getStoredLocale();

  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  late Stream<BaseAuthUser> userStream;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = dashboardmophong2SupabaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
    FFLocalizations.storeLocale(language);
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'dashboardmophong2',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home': HomeWidget(),
      'Main_customerList': MainCustomerListWidget(),
      'Main_Contracts': MainContractsWidget(),
      'myTeam': MyTeamWidget(),
      'Main_profilePage': MainProfilePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          selectedItemColor: FlutterFlowTheme.of(context).primary,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard_outlined,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.dashboard_rounded,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'mlg01kw6' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle_outlined,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.supervised_user_circle_sharp,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'tsu41wgg' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_work_outlined,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.home_work_rounded,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                '69sucl8g' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.stream,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.stream,
                size: 24.0,
              ),
              label: FFLocalizations.of(context).getText(
                'p3buwlts' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 24.0,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'x96fv5gx' /* __ */,
              ),
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
