part of 'edit_screen_cubit.dart';

abstract class EditScreenState extends Equatable {
  const EditScreenState();

  @override
  List<Object> get props => [];
}

class EditScreenInitial extends EditScreenState {}

class ChangeToggle extends EditScreenState {}

class LoadindEditData extends EditScreenState {}

class SuccessEditData extends EditScreenState {}

class FaulierEditData extends EditScreenState {
  final String errMessage;
  const FaulierEditData(this.errMessage);
}
