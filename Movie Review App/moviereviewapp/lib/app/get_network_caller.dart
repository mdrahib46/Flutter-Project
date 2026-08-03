import 'package:moviereviewapp/core/app_strings.dart';

import '../data/network_services/network_caller.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: () => {
      'Accept': 'application/json',
      'Authorization': AppStrings.authorizationToken,
    },
  );
}
