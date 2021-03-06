part of domain;

abstract class PhotoGateway {
  const PhotoGateway();

  Future<PaginationResponse<PhotoEntity>> fetchPhoto({
    required TypePhoto typePhoto,
    required int page,
    required int limit,
  });
}
