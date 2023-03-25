import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuispraktpm/disease_data.dart';
import 'package:kuispraktpm/Halaman_Detail.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Plant Diseases'),
        ),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: listDisease.length,
          itemBuilder: (context, index) {
            final Diseases diseases = listDisease[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HalamanDetail(diseases: diseases);
                }));
              },
              child: Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 250,
                          child: Image.network(diseases.imgUrls,
                            fit: BoxFit.fitWidth,),
                        ),
                        Text(
                          diseases.name, textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ]
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}







