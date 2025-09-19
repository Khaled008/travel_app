// lib/cubit/app_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/data_model.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }

  // Local data - no API calls needed
  late final places;

  void getData() {
    try {
      emit(LoadingState());

      // Mock data - replace with your actual local data
      places = [
        DataModel(
          name: "Yosemite",
          img: "assets/images/mountain.jpeg",
          price: 250,
          people: 4,
          stars: 5,
          description:
              "Yosemite National Park is in California's Sierra Nevada mountains. It's famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.",
          location: "USA, California",
        ),
        DataModel(
          name: "Lake Louise",
          img: "assets/images/lake_louise.jpeg",
          price: 320,
          people: 3,
          stars: 4,
          description:
              "Lake Louise is a hamlet in Alberta, Canada, within Banff National Park. Named after Princess Louise, Caroline Alberta, it's known for its turquoise, glacier-fed lake ringed by high peaks.",
          location: "Canada, Alberta",
        ),
        DataModel(
          name: "Camping",
          img: "assets/images/camping_mountains.png",
          price: 150,
          people: 5,
          stars: 5,
          description:
              "Mountain camping has long held a magnetic pull for those looking to escape the hum of modern life and reconnect with the raw beauty of nature.",
          location: "Mountain, USA",
        ),
      ];

      emit(LoadedState(places));
    } catch (e) {
      emit(LoadedState([])); // Empty list on error
    }
  }

  void goToDetailPage(DataModel data) {
    emit(DetailState(data));
  }

  void goHome() {
    emit(LoadedState(places));
  }

  void goToWelcomePage() {
    emit(WelcomeState());
  }
}
