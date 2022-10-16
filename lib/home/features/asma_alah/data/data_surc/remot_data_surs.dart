

import '../asma_alah_json.dart';
import '../model/asma_allah_model.dart';

abstract class AsmaAllahRemotahDataSurc {
  Future<List<AsmaAllahModel>> getAsmaAllah();
}

class  AsmaAllahRemotdataSurcWithLocl implements AsmaAllahRemotahDataSurc {
  @override
  Future<List<AsmaAllahModel>> getAsmaAllah() async {
    final List<AsmaAllahModel> allData =
        await asmaAlahAlhosna.map((e) => AsmaAllahModel.fromJson(e)).toList();
    return allData;
  }
}
