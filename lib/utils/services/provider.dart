
import 'package:medpg/app/bottom_nav/view_model/bottom_nav_provider.dart';
import 'package:medpg/app/home/usecases/home_usecase.dart';
import 'package:medpg/repository/home_repo/home_repo.dart';
import 'package:provider/provider.dart';

import '../../app/auth/usecases/auth_usecases.dart';
import '../../app/auth/view_model/auth_provider.dart';
import '../../app/home/view_model/home_provider.dart';
import '../../app/leading/usecases/leading_usecase.dart';
import '../../app/leading/view_model/leanding_provider.dart';
import '../../repository/auth_repo/auth_repo.dart';
import '../../repository/leanding_repo/lending_repo.dart';


class AppProviders {
  static AppProviders shared = AppProviders();

  // ============================= Repository
  get _authRepo => AuthRepository();
  get _lendingRepo => LendingRepository();
  get _homeRepo => HomeRepo();


  // ================================= useCases
  get _authUseCase => AuthUseCases(authRepository: _authRepo);
  get _lendingUseCase => LendingUseCase(repo: _lendingRepo);
  get _homeUseCase => HomeUseCases(homeRepository: _homeRepo);



  // ============================= Provider
  get authProvider => ChangeNotifierProvider(create: (context) => AuthProvider(authUseCases: _authUseCase));
  get lendingProvider => ChangeNotifierProvider(create: (context) => LendingProvider(useCase: _lendingUseCase));
  get homeProvider => ChangeNotifierProvider(create: (context) => HomeProvider(homeUseCases: _homeUseCase));
  get tabProvider => ChangeNotifierProvider(create: (context) => BottomNavProvider());


}