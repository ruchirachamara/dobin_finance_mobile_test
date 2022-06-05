import 'package:flutter/foundation.dart';

import 'package:dobin_finance_mobile_test/domain/user.dart';

class UserProvider with ChangeNotifier {
  User _user = new User();

  User get user => _user;
}
