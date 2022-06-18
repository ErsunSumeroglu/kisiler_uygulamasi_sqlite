import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklar_uygulamasi/repo/yapilacaklardao_repository.dart';

class YapilacakKayitCubit extends Cubit<void> {
  YapilacakKayitCubit():super(0);

  var krepo = YapilacaklarDaoRepository();

  Future<void> kayit(String yapilacak_is) async {
    await krepo.yapilacakKayit(yapilacak_is);
  }
}