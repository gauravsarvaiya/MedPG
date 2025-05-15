import 'package:medpg/app/home/domin/response/notification_response_model.dart';
import 'package:medpg/app/home/usecases/home_usecase.dart';
import 'package:medpg/base/domin/base_notifier.dart';

import '../../../base/domin/api_response.dart';
import '../domin/response/recommand_res_model.dart';

abstract class IHomeProvider{
  Future notificationCall();
  Future getRecommendCall();
}

class HomeProvider extends BaseNotifier implements IHomeProvider {
  final IHomeUseCases homeUseCases;

  HomeProvider({required this.homeUseCases}){
    _notificationAppResponse = AppResponse();
    _getRecommendAppResponse = AppResponse();
  }
  late AppResponse<List<NotificationResModel>> _notificationAppResponse;
  AppResponse<List<NotificationResModel>> get notificationAppResponse => _notificationAppResponse;

  late AppResponse<List<RecommendationResModel>>  _getRecommendAppResponse;
  AppResponse<List<RecommendationResModel>> get getRecommendAppResponse => _getRecommendAppResponse;


  @override
  Future notificationCall() async{
    resIsLoading(_notificationAppResponse);
    try {
      final response = await homeUseCases.getNotificationUseCase();
      resIsSuccess(_notificationAppResponse,response);
    } catch (e) {
      resIsFailed(_notificationAppResponse, e);
      rethrow;
    }
  }

  @override
  Future getRecommendCall() async{
    resIsLoading(_getRecommendAppResponse);
    try {
      final response = await homeUseCases.getRecommendUseCase();
      resIsSuccess(_getRecommendAppResponse,response);
    } catch (e) {
      resIsFailed(_getRecommendAppResponse, e);
      rethrow;
    }
  }


}