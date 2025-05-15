import 'package:medpg/app/home/domin/response/notification_response_model.dart';
import 'package:medpg/app/home/domin/response/recommand_res_model.dart';
import '../../../repository/home_repo/home_repo.dart';

abstract class IHomeUseCases{
  Future<List<NotificationResModel>> getNotificationUseCase();
  Future<List<RecommendationResModel>> getRecommendUseCase();
}

class HomeUseCases implements IHomeUseCases{
  final IHomeRepository homeRepository;

  HomeUseCases({required this.homeRepository});

  @override
  Future<List<NotificationResModel>> getNotificationUseCase() async{
    final response = await homeRepository.getNotification();
    return notificationResModelFromJsonDynamic(response);
  }

  @override
  Future<List<RecommendationResModel>> getRecommendUseCase() async{
    final response = await homeRepository.getRecommendation();
    return recommendationResModelFromJsonDynamic(response);
  }

}