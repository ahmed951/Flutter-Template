import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/bloc/homepage/home_page_cubit.dart';
import 'package:template/presentation/shared/app_bar.dart';

import '../../shared/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: defaultAppBar(
            context,
          ),
          key: cubit.scaffoldKey,
          body: cubit.bottomScreens[cubit.currentIndex],
          drawer: SafeArea(
            child: Container(
              width: 250,
              color: Colors.white,
              child: const CustomDrawer(),
            ),
          ),
          /* bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: mainColor,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.group), label: "Users"),
              ]), */
        );
      },
    );
  }
}
