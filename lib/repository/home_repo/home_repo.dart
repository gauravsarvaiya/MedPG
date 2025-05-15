import '../../base/server_configs/config.dart';
import '../../utils/services/web_services.dart';

abstract class IHomeRepository{
  Future<dynamic> getNotification();
  Future<dynamic> getRecommendation();
}

class HomeRepo implements IHomeRepository{
  @override
  Future getNotification() async{
    final response = await WebService.instance.get(request: NetworkRequest(url: ServerConfig.getNotificationUrl));
    return response;
  }

  @override
  Future getRecommendation() async{
    final response = await WebService.instance.get(request: NetworkRequest(url: ServerConfig.getRecommendUrl));
    return response;
  }

}