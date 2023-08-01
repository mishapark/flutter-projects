import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_state.dart';

const generalFailureMessage = 'Something went wrong';
const serverFailureMessage = 'Server error';
const cacheFailureMessage = 'Cache error';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit({required this.adviceUseCases}) : super(AdvicerInitial());

  final AdviceUseCases adviceUseCases;

  void requestAdvice() async {
    emit(AdvicerStateLoading());

    final adviceOrFailure = await adviceUseCases.getAdvice();

    adviceOrFailure.fold(
      (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
      (failure) =>
          emit(AdvicerStateError(message: _mapFailureToMessage(failure))),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
