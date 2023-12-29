
import 'package:get/get.dart';

import '../../../common/entities/msgcontent.dart';

class ChatState {
RxList<Msgcontent> msgContentList = <Msgcontent>[].obs;
var toUid = ''.obs;
var toName = ''.obs;
var toAvatar = ''.obs;
var toLocation = 'unknown'.obs;
}
