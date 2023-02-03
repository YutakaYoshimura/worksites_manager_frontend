import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worksites_manager/views/worksitesDetailPage/worksites_detail_page.dart';
import 'package:worksites_manager/views/worksitesInputPage/worksites_input_page.dart';
import 'package:worksites_manager/views/worksitesListPage/worksites_list_page.dart';

Future<void> main() async {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const WorksitesListPage(),
        routes: [
          GoRoute(
            path: "worksites_add",
            builder: (BuildContext context, GoRouterState state) => const WorksitesInputPage(id: 0),
          ),
          GoRoute(
            path: "worksites_detail",
            builder: (BuildContext context, GoRouterState state) {
              return WorksitesDetailPage(id: state.extra as int);
            },
            routes: [
              GoRoute(
                path: "worksites_edit",
                builder: (BuildContext context, GoRouterState state) {
                  return WorksitesInputPage(id: state.extra as int);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      locale: const Locale('ja', 'JP'),
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}