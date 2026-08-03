import 'package:moviereviewapp/core/app_strings.dart';
import 'package:moviereviewapp/data/services/api_services.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: () => {
      'Accept': 'application/json',
      'Authorization': AppStrings.authorizationToken,
    },
  );
}
