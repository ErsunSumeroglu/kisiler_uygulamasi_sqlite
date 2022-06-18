import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklar_uygulamasi/entity/yapilacaklar.dart';
import 'package:yapilacaklar_uygulamasi/repo/yapilacaklardao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yapilacaklar>> {
  AnasayfaCubit():super(<Yapilacaklar>[]);

  var krepo = YapilacaklarDaoRepository();

  Future<void> YapilacaklarYukle() async {
    var liste = await krepo.tumYapilacaklariAl();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await krepo.yapilacakAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int kisi_id) async {
    await krepo.yapilacakSil(kisi_id);
    await YapilacaklarYukle();
  }
}