import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/data_model.dart';

import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices data;
  late final List<DataModel> places;

  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      // you can emit an error state here
      print(e);
    }
  }

  void detailPage(DataModel data) {
    emit(DetailPageState(data));
  }

  void goHome() {
    emit(LoadedState(places));
  }
}
