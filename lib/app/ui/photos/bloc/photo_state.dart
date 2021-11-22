part of 'photo_bloc.dart';

@immutable
abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoItemOpen extends PhotoState {
  final PhotoEntity photo;

  PhotoItemOpen({required this.photo});
}

class PhotoSuccess extends PhotoState {
  final List<PhotoEntity> photos;

  PhotoSuccess({required this.photos});
}

class PhotoError extends PhotoState {
  final String? title;
  final String? description;
  final bool loadInternetConnect;

  PhotoError({this.title, this.description, this.loadInternetConnect = false});
}
