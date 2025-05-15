import 'package:flutter/foundation.dart';
import '../../utils/utils.dart';
import 'api_response.dart';

class BaseNotifier extends ChangeNotifier{

  resIsLoading(AppResponse res){

    res.state = Status.LOADING;

    notifyListeners();
  }

  resIsSuccess<T>(AppResponse res,T data){

    res.state = Status.COMPLETED;

    res.data = data;

    notifyListeners();
  }

  resIsFailed(AppResponse res,Object e){

    res.state = Status.ERROR;

    res.msg = e.toString();

    res.data = null;

    notifyListeners();
  }

  resIsUnauthorized(AppResponse res){

    res.state = Status.UNAUTHORISED;

    res.data = null;

    notifyListeners();
  }


}