import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingInitial(index: 0));

  void onPageChanged(int index) {
    emit(OnboardingState(index: index));
  }
}
