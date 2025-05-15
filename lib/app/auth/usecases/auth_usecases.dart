import 'package:medpg/app/auth/domin/response/csrf_res_model.dart';
import 'package:medpg/app/auth/domin/response/logout_response_model.dart';
import 'package:medpg/app/auth/domin/response/user_res_model.dart';
import 'package:medpg/repository/auth_repo/auth_repo.dart';
import 'package:medpg/app/auth/domin/request/login_req_model.dart';
import 'package:medpg/app/auth/domin/response/login_response_model.dart';

abstract class IAuthUseCases{
  Future<LoginResModel> loginUseCase({required LoginReqModel loginReqModel});
  Future<CsrfResModel> getCSRFUseCase();
  Future<LogoutResModel> logOutUseCase();
  Future<UserResModel> userUseCase();
}

class AuthUseCases implements IAuthUseCases {
  final IAuthRepository authRepository;

  AuthUseCases({required this.authRepository});

  @override
  Future<LoginResModel> loginUseCase({required LoginReqModel loginReqModel}) async{
    final response = await authRepository.login(data: loginReqModel.toJson());
    return LoginResModel.fromJson(response);
  }

  @override
  Future<CsrfResModel> getCSRFUseCase() async{
    final response = await authRepository.csrfToken();
    return CsrfResModel.fromJson(response);
  }

  @override
  Future<LogoutResModel> logOutUseCase() async{
    final response = await authRepository.logout();
    return LogoutResModel.fromJson(response);
  }

  @override
  Future<UserResModel> userUseCase() async{
    final response = await authRepository.getUserDetail();
    return UserResModel.fromJson(response);
  }

}