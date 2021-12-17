import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_state.freezed.dart';

@freezed
abstract class PhotoState with _$PhotoState {
  const factory PhotoState.initial() = PhotoInitial;

  const factory PhotoState.loading() = PhotoLoading;

  factory PhotoState.itemOpen({required PhotoEntity photo}) = PhotoItemOpen;

  factory PhotoState.success({
    required List<PhotoEntity> photos,
    @Default(false) bool isPaginationLoading,
    @Default(false) bool isRefresh,
  }) = PhotoSuccess;

  factory PhotoState.error({
    String? title,
    String? description,
    @Default(false) bool loadInternetConnect,
  }) = _PhotoError;
}
