import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lt02_demo/firebase_options.dart';
import 'package:lt02_demo/presentation/signin/signin_page.dart';
import 'package:lt02_demo/presentation/top/top_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  // ウェブの URL　から # を除く
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(const MyApp());
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
  //Todo developにpush前に/topに変更すること。
  //initialLocation: '/',
  initialLocation: '/signin',
  routes: [
    GoRoute(
      name: 'top',
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const TopPage(),
      ),
    ),
    GoRoute(
      name: 'signin',
      path: '/singin',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SigninPage(),
      ),
    ),
  ],
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


