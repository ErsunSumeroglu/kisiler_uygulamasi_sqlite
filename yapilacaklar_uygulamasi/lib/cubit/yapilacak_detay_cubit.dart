import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklar_uygulamasi/repo/yapilacaklardao_repository.dart';

class YapilacakDetayCubit extends Cubit<void> {
  YapilacakDetayCubit():super(0);

  var krepo = YapilacaklarDaoRepository();

  Future<void> guncelle(int yapilacak_id,String yapilacak_is) async {
    await krepo.yapilacakGuncelle(yapilacak_id, yapilacak_is);
  }
}