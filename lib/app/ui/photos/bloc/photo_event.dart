part of 'photo_bloc.dart';

@immutable
abstract class PhotoEvent {}

class PhotoFetch extends PhotoEvent {}

class PhotoRefresh extends PhotoEvent {}

class PhotoItemClicked extends PhotoEvent {
  final PhotoEntity photo;

  PhotoItemClicked({required this.photo});
}
