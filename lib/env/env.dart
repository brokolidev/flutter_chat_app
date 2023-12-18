import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.dev')
abstract class Env {
  @EnviedField(varName: 'UNSPLASH_API_KEY')
  static const String? unsplashApiKey = _Env.unsplashApiKey;
}
