import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/cubit/news_cubit.dart';
import 'package:news_app/layout/cubit/news_states.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/cubit/cubit_app.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  style: TextStyle(
                    color: AppCubit.get(context).isDark ? Colors.white : Colors.black,
                  ),
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color:AppCubit.get(context).isDark ? HexColor('#BB86FC') : Colors.grey,
                    ),

                    labelStyle: TextStyle(
                      color: AppCubit.get(context).isDark ? HexColor('#BB86FC') : Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:AppCubit.get(context).isDark ? HexColor('#BB86FC') : Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(child: articleBuilder(list , isSearch : true)),
              ],
            ),
          ),
        );
      },
    );
  }
}
