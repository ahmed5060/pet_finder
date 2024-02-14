// ignore_for_file: non_constant_identifier_names, avoid_print
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/bloc/state.dart';
import 'package:pet_finder/dio/dio_helper.dart';
import 'package:pet_finder/models/animalsModel.dart';
import 'package:pet_finder/models/authModel.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  AuthModel? authModel;

  void GetToken() {
    emit(GetTokenLoadingState());
    DioHelper.postData(
      url: '/oauth2/token',
      data: {
        "grant_type": "client_credentials",
        "client_id": "BG6Wxl1kz6GecmPYuwMHAd8rySZiBPkmNPR9lxHvkk2hVY1OVo",
        "client_secret": "TsvbksmIUryMHZBQ8rgRabHeR9KYC0ioyPkKpJJJ"
      },
    ).then((value) {
      authModel = AuthModel.fromJson(value.data);
      emit(GetTokenSuccessState(authModel!));
    }).catchError((error) {
      emit(GetTokenErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }

  AnimalsModel? animalsModel;

  void GetTokenAnimals({
    required String token,
    required String page,
    required String type,
}) {
    emit(GetAnimalsLoadingState());
    DioHelper.getData(
      url: '/animals?type=${type}&page=${page}',
      token: token,
    ).then((value) {
      animalsModel = AnimalsModel.fromJson(value.data);
      emit(GetAnimalsSuccessState(animalsModel!));
    }).catchError((error) {
      emit(GetAnimalsErrorState(error.toString()));
      print("******************************");
      print(error.toString());
      print("******************************");
    });
  }

}
