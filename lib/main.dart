import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/layout/cubit/news_cubit.dart';
import 'package:news_app/shared/cubit/cubit_app.dart';
import 'package:news_app/shared/cubit/states_app.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/theme.dart';

import 'layout/news_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');
  isDark??=false;
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool isDark;

  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()..getBusiness()..getSports()..getScience()),
        BlocProvider(create: (context) => AppCubit()..changeModeApp(fromShared: isDark),),
      ],
        child: BlocConsumer<AppCubit , AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: Directionality(
                textDirection: TextDirection.rtl,
                child: NewsLayout(),
              ),
              debugShowCheckedModeBanner: false,
            );
          },
        ),
    );
  }
}