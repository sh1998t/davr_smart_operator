import 'package:davr_smart_operator/core/api_const.dart';
import 'package:davr_smart_operator/core/base_api_request.dart';

import '../model/operator_balance_model.dart';

  class OperatorBalanceApi extends BaseApiRequest{
  Future<OperatorBalanceModel> request()async{
  final response = await super.getRequest(ApiConst.operatorBalance);
  if(response.statusCode !=200){
    throw Exception(response.data['error']['message']);
  }
  return OperatorBalanceModel.fromJson(response.data['data']);
}
}