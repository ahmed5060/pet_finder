import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/bloc/bloc_observer.dart';
import 'package:pet_finder/bloc/cubit.dart';
import 'package:pet_finder/bloc/state.dart';
import 'package:pet_finder/dio/dio_helper.dart';
import 'package:pet_finder/helper/Cache_helper.dart';
import 'package:pet_finder/view/home_screen.dart';
import 'package:pet_finder/view/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool loading = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AppCubit()
        ..GetToken(),
      child: BlocListener<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is GetTokenSuccessState) {
            CacheHelper.saveData(
              key: 'access_token',
              value: state.authModel.accessToken,
            ).then((value) {
              log("done");
            }).catchError((error) {
              log(error.toString());
            });
            setState(() {
              loading = false;
            });
          }
        },
        child: ScreenUtilInit(
          designSize: const Size(414, 736),
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Pet Finder',
                home: loading? const LoadingScreen() : const HomeScreen(),
              ),
        ),
      ),
    );
  }
}