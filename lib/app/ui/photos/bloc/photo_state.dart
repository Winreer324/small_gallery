part of 'photo_bloc.dart';

@immutable
abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}
class PhotoSuccess extends PhotoState {
  final List<PhotoEntity> photos;

  PhotoSuccess({required this.photos});
}

class PhotoError extends PhotoState {
  final String? title;
  final String? description;

  PhotoError({this.title, this.description});
}
