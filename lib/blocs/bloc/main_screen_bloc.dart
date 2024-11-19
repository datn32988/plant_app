import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitial()) {
    final List imageSlider = [
      "https://hips.hearstapps.com/hmg-prod/images/indoor-plants-for-mental-health-669e9b7da1772.jpg",
      "https://berkiepalms.com.au/wp-content/uploads/2024/04/Benefit-Of-Indoor-Palm-Plants.jpg",
      "https://m.media-amazon.com/images/I/61oh79mgSJL._AC_UF894,1000_QL80_.jpg",
      "https://hips.hearstapps.com/hmg-prod/images/high-angle-view-of-variety-of-succulent-plants-royalty-free-image-1584462052.jpg"
    ];
    on<MainScreenLoadSlider>((event, emit) {
      emit(MainScreenLoading());

      // ignore: unnecessary_null_comparison
      if (imageSlider != null) {
        emit(MainScreenLoadinged(imageSliderItem: imageSlider));
      } else {
        emit(MainScreenError(error: 'Slider list null'));
      }
    });
  }
}
