

import 'package:pet_finder/models/animalsModel.dart';
import 'package:pet_finder/models/authModel.dart';

abstract class AppStates {}

class InitialState extends AppStates {}

class GetTokenLoadingState extends AppStates {}

class GetTokenSuccessState extends AppStates {
  final AuthModel authModel;
  GetTokenSuccessState(this.authModel);
}

class GetTokenErrorState extends AppStates {
  final String error;
  GetTokenErrorState(this.error);
}

class GetAnimalsLoadingState extends AppStates {}

class GetAnimalsSuccessState extends AppStates {
  final AnimalsModel animalsModel;
  GetAnimalsSuccessState(this.animalsModel);
}

class GetAnimalsErrorState extends AppStates {
  final String error;
  GetAnimalsErrorState(this.error);
}