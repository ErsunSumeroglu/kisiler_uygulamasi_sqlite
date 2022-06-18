import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/yapilacak_kayit_cubit.dart';

class YapilacakKayitSayfa extends StatefulWidget {
  const YapilacakKayitSayfa({Key? key}) : super(key: key);

  @override
  _KisiKayitSayfaState createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<YapilacakKayitSayfa> {
  var tfYapilacakIs = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yapılacak Kayıt"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfYapilacakIs,decoration: const InputDecoration(hintText: "Yapilacak"),),
              ElevatedButton(onPressed: (){
                context.read<YapilacakKayitCubit>().kayit(tfYapilacakIs.text);
              }, child: const Text("KAYDET"))
            ],
          ),
        ),
      ),
    );
  }
}
