import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklar_uygulamasi/entity/yapilacaklar.dart';

import '../cubit/anasayfa_cubit.dart';
import 'yapilacak_detay_sayfa.dart';
import 'yapilacak_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().YapilacaklarYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          },) :
        const Text("Yapilacaklar"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() { aramaYapiliyorMu = false; });
            context.read<AnasayfaCubit>().YapilacaklarYukle();
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() { aramaYapiliyorMu = true; });
          }, icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Yapilacaklar>>(
        builder: (context,yapilacaklarListesi){
          if(yapilacaklarListesi.isNotEmpty){
            return ListView.builder(
              itemCount: yapilacaklarListesi.length,
              itemBuilder: (context,indeks){
                var yapilacak = yapilacaklarListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => YapilacakDetaySayfa(yapilacaklar: yapilacak)))
                        .then((_) { context.read<AnasayfaCubit>().YapilacaklarYukle(); });
                    },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${yapilacak.yapilacak_is} "),
                          const Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("${yapilacak.yapilacak_is} silinsin mi?"),
                                    action: SnackBarAction(
                                      label: "Evet",
                                      onPressed: (){ context.read<AnasayfaCubit>().sil(yapilacak.yapilacak_id); },
                                    ),
                                ));
                          }, icon: const Icon(Icons.delete_outline,color: Colors.black45,))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const YapilacakKayitSayfa()))
              .then((_) { context.read<AnasayfaCubit>().YapilacaklarYukle();  });
        },
      ),
    );
  }
}


