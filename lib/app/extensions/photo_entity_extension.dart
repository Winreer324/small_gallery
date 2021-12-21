import 'package:domain/domain.dart';
import 'package:gateway/gateway.dart';

extension PhotoEntityX on PhotoEntity {
  String get imageUrl => '${GatewayConstants.basePathMedia}${image.name}';
}
