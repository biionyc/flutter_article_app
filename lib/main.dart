import 'package:article_app/common/routes/app_router.dart';
import 'package:article_app/features/articlesCrud/bloc/article_bloc.dart';
import 'package:article_app/features/articlesCrud/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ArticleBloc(),
        ),
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: AppRouter().router.routeInformationParser,
        routeInformationProvider: AppRouter().router.routeInformationProvider,
        routerDelegate: AppRouter().router.routerDelegate,
      ),
    );
  }
}
