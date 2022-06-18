import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapilacaklar_uygulamasi/entity/yapilacaklar.dart';

import '../cubit/yapilacak_detay_cubit.dart';

class YapilacakDetaySayfa extends StatefulWidget {
  Yapilacaklar yapilacaklar;
  YapilacakDetaySayfa({required this.yapilacaklar});

  @override
  _YapilacakDetaySayfaState createState() => _YapilacakDetaySayfaState();
}

class _YapilacakDetaySayfaState extends State<YapilacakDetaySayfa> {
  var tfYapilacak = TextEditingController();

  @override
  void initState() {
    super.initState();
    var yapilacak = widget.yapilacaklar;
    tfYapilacak.text = yapilacak.yapilacak_is;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yapilacaklar Detay"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfYapilacak,decoration: const InputDecoration(hintText: "Yapilacak"),),
              ElevatedButton(onPressed: (){
                context.read<YapilacakDetayCubit>().guncelle(widget.yapilacaklar.yapilacak_id, tfYapilacak.text);
              }, child: const Text("GÜNCELLE"))
            ],
          ),
        ),
      ),
    );
  }
}
