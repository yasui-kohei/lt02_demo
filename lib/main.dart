import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lt02_demo/constants/signin_page_constants.dart';
import 'package:lt02_demo/firebase_options.dart';
import 'package:lt02_demo/presentation/signin/signin_page.dart';
import 'package:lt02_demo/presentation/signin/signup_page.dart';
import 'package:lt02_demo/presentation/top/top_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  // ウェブの URL　から # を除く
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/signup',
  routes: [
    /// SigninPageのタブに表示される情報の切り替えを行うためのGoRouteの設定
    ///
    /// ex.) /signupの場合は、signup.dartのウィジェットが表示される。
    GoRoute(
        name: 'signin',
        path: '/:signinPageId',
        pageBuilder: (context, state) {
          final signinPageId = state.params['signinPageId'];
          final currentTab = SigninPageTabs.data.firstWhere((tab) => tab.tabId == signinPageId);
          final index = SigninPageTabs.data.indexWhere((t) => t.tabId == currentTab.tabId);
          print(index);
          return MaterialPage(
            key: state.pageKey,
            child: SigninPage(
              tabIndex: index,
            ),
          );
        }
    ),
    GoRoute(
      name: 'Home',
      path: '/LT/home',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const TopPage(),
      ),
    ),
  ],
  // redirect
  //redirect: (state) {
    //return state.subloc == '/signup' ? null : '/signup';
  //},

  //遷移ページがないなどのエラーが発生した時に、このページに行く
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);


