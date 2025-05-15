import '../../utils/services/web_services.dart';
import 'package:medpg/base/server_configs/config.dart';

abstract class IAuthRepository{
  Future<dynamic> login({required dynamic data});
  Future<dynamic> logout();
  Future<dynamic>getUserDetail();
  Future<dynamic>getAppSetting();
  Future<dynamic>csrfToken();
}

class AuthRepository extends IAuthRepository{
  @override
  Future login({required dynamic data}) async{
    final response = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.loginUrl,data: data,));
    return response;
  }

  @override
  Future logout() async{
    final response = await WebService.instance.post(request: NetworkRequest(url: ServerConfig.logoutUrl));
    return response;
  }

  @override
  Future getUserDetail() async{
    final response = await WebService.instance.get(request: NetworkRequest(url: ServerConfig.getUserUrl,));
    return response;
  }

  @override
  Future getAppSetting() async{
    final response = await WebService.instance.post(request: NetworkRequest(url:  ServerConfig.loginUrl,));
    return response;
  }

  @override
  Future csrfToken() async{
    final response = await WebService.instance.get(
        request: NetworkRequest(url:  ServerConfig.csrfTokenUrl,)
    );
    return response;
  }
}