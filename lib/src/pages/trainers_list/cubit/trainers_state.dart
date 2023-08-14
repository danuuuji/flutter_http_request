part of 'trainers_cubit.dart';

@immutable
abstract class NewsState {}

class TrainersInitial extends NewsState {}

class TrainersLoadedState extends NewsState {
  final List<Trainer> trainers;

  TrainersLoadedState(this.trainers);
}

class TrainersErrorState extends NewsState {
  final String errorMessage;

  TrainersErrorState(this.errorMessage);
}
