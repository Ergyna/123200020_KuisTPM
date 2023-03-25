import 'package:flutter/material.dart';
import 'package:kuispraktpm/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  const HalamanDetail({Key? key, required this.diseases}) : super(key: key);
  final Diseases? diseases;
  Future<void> _launchUrl() async {
    final url = diseases!.imgUrls;
    if (await canLaunch(url)) {
      await launch(url);
    }
    else{
      throw 'Cloud not launch $url';
    }
  }
  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Detail diseases'),
        ),
        actions: <Widget> [
          IconButton(
            onPressed: () {
              SnackBar snackBar = SnackBar(
                content: fav
                    ? Text('Menghapus dari favorite')
                    : Text('Menambahkan ke favorite'),
                duration: const Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {
                fav = !fav;
              });
            },
            icon: fav
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)  ,
            tooltip: 'Favorite',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.height/3,
                height: MediaQuery.of(context).size.width/5,
                child: GestureDetector(
                  onTap: widget._launchUrl,
                  child: Image.network(widget.diseases!.imgUrls, fit: BoxFit.fitWidth,),
                )
              ),
              Text(widget.diseases!.name,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 20,),
              Text('Diseases name',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.diseases!.name),
              SizedBox(height: 20,),
              Text('Plant name',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.diseases!.plantName),
              SizedBox(height: 20,),
              Text('Ciri-ciri',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              for(var i=0; i<widget.diseases!.nutshell.length; i++)
                Text(widget.diseases!.nutshell[i]),
              SizedBox(height: 20,),
              Text('Disease ID',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.diseases!.id),
              SizedBox(height: 20,),
              Text('Symptom',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.diseases!.symptom),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          widget._launchUrl();
        },
        child: const Icon(Icons.image),
        backgroundColor: Colors.green,
      ),

    );


  }

}





