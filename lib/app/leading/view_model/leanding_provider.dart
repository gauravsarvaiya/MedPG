import 'package:flutter/foundation.dart';
import '../../../base/domin/base_notifier.dart';
import '../../../utils/utils.dart';
import '../usecases/leading_usecase.dart';


abstract class ILendingProvider {
  Future getAppState();
  Future setAppState({required AppState state});
  Future clearAppState();
}

class LendingProvider extends BaseNotifier implements ILendingProvider {
  late final ILendingUseCase useCase;

  AppState? appState;

  bool isOnBoarding = false;

  bool isUnderMaintenance = false;
  bool isMajorUpdate = false;
  bool isMinorUpdate = false;

  int selectedIndex = 0;

  LendingProvider({required this.useCase}) {
    getAppState();
    onBoardingUpdate();
  }


  Future updateOnBoardingTab(int index)async{
    selectedIndex = index;
    notifyListeners();
  }

  Future onBoardingUpdate()async{
    final isOnBoarding  = UserPrefs.shared.getOnBoarding;
    this.isOnBoarding = await isOnBoarding;
    notifyListeners();
  }

  @override
  Future getAppState() async {

    try {
      appState = await useCase.getAppState();
      print(appState?.memberID);
    } catch (e) {
      debugPrint("${e}");
      appState = AppState(isLogin: false);
    } finally {
      notifyListeners();
    }

  }

  @override
  Future setAppState({required AppState state}) async {

    try {
      await useCase.setAppState(state: state);
      await getAppState();
    } catch (e) {
      debugPrint("${e}");
    }

  }

  @override
  Future clearAppState() async {
    await useCase.clearAppState();
    appState = AppState(isLogin: false);
    notifyListeners();
  }

}


class AppState {
  bool? isLogin;
  String? userID;
  String? memberID;
  String? token;

  AppState({
    this.isLogin,
    this.userID,
    this.memberID,
    this.token,
  });
}