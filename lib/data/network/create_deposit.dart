import 'package:davr_smart_operator/core/base_api_request.dart';
import 'package:dio/dio.dart';

import '../../core/api_const.dart';


class DepositSend extends BaseApiRequest {
  Future<bool> request(
      int? stage,
      int? amount,
      int? amountType,
      int? bankId,
      String? comment,
      String? chekPhoto,
      String? courierCode
      ) async {
    var formMap = {
      'stage': stage ?? '',
      'amount': amount ?? 0,
      'amount_type': amountType ?? 0,
      'bank_id': bankId ?? 0,
      'comment': comment ?? 0,
      'courier_code': courierCode ?? 0,
    };
    if (chekPhoto != null && chekPhoto.isNotEmpty) {
      print(chekPhoto);
      formMap['operator_photo'] = [
        await MultipartFile.fromFile(chekPhoto, filename: chekPhoto)
      ];
    }

    var data = FormData.fromMap(formMap);
    final endpoint = "${ApiConst.depositSend}";
    try {
      final response = await super.postMultipartRequest(endpoint, data);
      print(response);

      if (response != null && response.data != null) {
        if (response.data['success'] == false) {
          // Xato xabarini olish
          String errorMessage =
              response.data['error']['message'] ?? "Noma'lum xatolik";
          throw Exception(errorMessage); // Exceptionni chiqarish
        }
      }
    } catch (e) {
      // API so'rovidagi xatolikni tutib, xabarni chiqarish
      print("Xatolik: ${e.toString()}");
      throw Exception(e.toString());
    }
    return true;
  }
}