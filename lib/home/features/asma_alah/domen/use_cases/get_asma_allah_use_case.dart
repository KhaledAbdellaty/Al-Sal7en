
import '../asma_repo/asma_allah_repo.dart';
import '../emtites/asma_alah.dart';

class GetAsmaAllahUseCase {
  final AsmaAllahRepo asmaAllahRepo;

  GetAsmaAllahUseCase({required this.asmaAllahRepo});
  Future<List<AsmaAllah>> getAsmaAllah()async {
    return await asmaAllahRepo.getAsmaAllah();
  }
}
