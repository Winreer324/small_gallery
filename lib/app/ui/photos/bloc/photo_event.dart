import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_event.freezed.dart';

@freezed
abstract class PhotoEvent with _$PhotoEvent {
  const factory PhotoEvent.fetch() = _PhotoFetch;

  const factory PhotoEvent.refresh() = _PhotoRefresh;

  const factory PhotoEvent.itemClicked({required PhotoEntity photo}) = _PhotoItemClicked;
}
