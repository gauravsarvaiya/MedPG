import '../usecases/auth_usecases.dart';
import '../../../base/domin/api_response.dart';
import '../domin/response/csrf_res_model.dart';
import 'package:medpg/base/domin/base_notifier.dart';
import 'package:medpg/utils/services/secure_storage.dart';
import 'package:medpg/app/auth/domin/response/user_res_model.dart';
import 'package:medpg/app/auth/domin/request/login_req_model.dart';
import 'package:medpg/app/auth/domin/response/logout_response_model.dart';
import 'package:medpg/app/auth/domin/response/login_response_model.dart';

abstract class IAuthProvider{
  Future login({required LoginReqModel loginReqModel});
  Future getCSRF();
  Future logOut();
  Future getUser();
}

class AuthProvider extends BaseNotifier  implements IAuthProvider{

  final IAuthUseCases authUseCases;

  AuthProvider({required this.authUseCases}){
    _loginAppResponse = AppResponse();
    _csrfResponse = AppResponse();
    _logOutResponse = AppResponse();
    _userResponse = AppResponse();
  }

  late AppResponse<LoginResModel> _loginAppResponse;
  AppResponse<LoginResModel> get loginAppResponse => _loginAppResponse;

  late AppResponse<CsrfResModel> _csrfResponse;
  AppResponse<CsrfResModel> get csrfResponse => _csrfResponse;

  late AppResponse<LogoutResModel> _logOutResponse;
  AppResponse<LogoutResModel> get logOutResponse => _logOutResponse;

  late AppResponse<UserResModel> _userResponse;
  AppResponse<UserResModel> get userResponse => _userResponse;

  @override
  Future login({required LoginReqModel loginReqModel}) async{
    resIsLoading(_loginAppResponse);
    try {
      final response = await authUseCases.loginUseCase(loginReqModel: loginReqModel);
      resIsSuccess(_loginAppResponse,response);
    } catch (e) {
      resIsFailed(_loginAppResponse, e);
      rethrow;
    }

  }

  @override
  Future getCSRF() async {
    resIsLoading(_csrfResponse);
    try {
      final response = await authUseCases.getCSRFUseCase();
      await SecureStorage().setToken(token: response.csrfToken);
      await SecureStorage().setTokenExpiry(expiresAt: response.expiresAt);
      await SecureStorage().setStaticValues();
      resIsSuccess(_csrfResponse,response);
    } catch (e) {
      resIsFailed(_csrfResponse, e);
      rethrow;
    }
  }

  @override
  Future logOut() async{
    resIsLoading(_logOutResponse);
    try {
      final response = await authUseCases.logOutUseCase();
      resIsSuccess(_logOutResponse,response);
    } catch (e) {
      resIsFailed(_logOutResponse, e);
      rethrow;
    }
  }

  @override
  Future getUser() async{
    resIsLoading(_userResponse);
    try {
      final response = await authUseCases.userUseCase();
      resIsSuccess(_userResponse,response);
    } catch (e) {
      resIsFailed(_userResponse, e);
      rethrow;
    }
  }

  Future<void> ensureValidCsrfToken() async {
    final expiry = await SecureStorage().getTokenExpiry(); // implement this
    final now = DateTime.now().millisecondsSinceEpoch;

    if (expiry == null || now > expiry) {
      await getCSRF();
    }
  }


}