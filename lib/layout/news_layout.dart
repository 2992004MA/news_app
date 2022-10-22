import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/news_cubit.dart';
import 'package:news_app/layout/cubit/news_states.dart';
import 'package:news_app/modules/search/search_news.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/cubit/cubit_app.dart';
import 'package:news_app/shared/cubit/states_app.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('نيوز بالعربي'),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeModeApp();
                  },
                  icon: AppCubit.get(context).isDark
                      ? Icon(Icons.brightness_6_outlined) : Icon(Icons.brightness_4)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeBottomNavBar(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'اقتصاد',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_soccer),
                  label: 'رياضة',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.science_outlined),
                  label: 'علوم',
                ),
              ]),
        );
      },
    );
  }
}
