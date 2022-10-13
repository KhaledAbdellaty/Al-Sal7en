

import '../../domen/asma_repo/asma_allah_repo.dart';
import '../../domen/emtites/asma_alah.dart';
import '../data_surc/remot_data_surs.dart';

class AsmaAllahRepoImp implements AsmaAllahRepo {
  final AsmaAllahRemotahDataSurc remotahDataSurc;

  AsmaAllahRepoImp({required this.remotahDataSurc});
  @override
  Future<List<AsmaAllah>> getAsmaAllah() async {
    final data = remotahDataSurc.getAsmaAllah();
    return data;
  }
}
