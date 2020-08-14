import 'package:flutter/material.dart';

class BookAnalysis extends StatefulWidget {
  final String url;
  BookAnalysis(this.url);

  @override
  _BookAnalysis createState() => _BookAnalysis(url);
}

class _BookAnalysis extends State<BookAnalysis> {
  int _currentIndex = 0;
  final String url;
  _BookAnalysis(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitap Analizi'),
      ),
      body: Stack(
        children: <Widget>[
          Container(alignment: Alignment.topCenter, child: Image.network(url)),
          SafeArea(
              child: Column(
            children: <Widget>[
              Spacer(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 10.0),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "Suç ve Ceza",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () {},
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  "Suç ve Ceza; Rodion Romanoviç Raskolnikov adındaki bir gencin işlediği çifte cinayet üzerine yaşadıklarını konu alıyor.",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ),
                              ExpansionTile(
                                title: Text(
                                  "Detayları Göster",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topCenter,
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                        "Raskolnikov, bir yandan hukuk öğrenimi görürken diğer yandan yoksullukla boğuşan bir genç. Para ihtiyacını ise tefeci bir kadına eşyalarını bırakarak karşılıyor. Yoksulluğuna çare bulamadığı gibi tefeciden yakasını da kurtaramayan Raskolnikov, bu kadının toplumun iyiliği için ölmesi gerektiğini düşünmeye başlıyor.Bir gün Raskolnikov, kendi maddi problemlerinin yanı sıra ailesinden de kötü bir haber alıyor. Kız kardeşinin kendisinden yaşça çok büyük biriyle evleneceğini duyması, ona yeni bir darbe indiriyor. Bunun üzerine Raskolnikov, tefeciyi öldürmeyi aklına koyarak kendini evden dışarı atıyor. Tefeci kadını öldürüp mücevherleri alıyor ancak işlediği cinayete kimsenin tanıklık etmemesi için onun kız kardeşini de öldürmek zorunda kalıyor.Raskolnikov’un ruh hali, bu çifte cinayetle birlikte yerle bir oluyor. İşlediği suçu kimse görmemiş olmasına rağmen korkusu ve vicdanı onu büyük bir mahkumiyete sürüklüyor. Bir yandan mağdur, diğer yandan katil… Raskolnikov’u cinayete iten sebepler, onun alt üst olan iç dünyası ve sonrası ile siz de onun yeniden doğuşuna şahit olacaksınız. Bu kitabı okurken, kalp atışınızın arttığını duyumsayacaksınız."),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Anasayfa'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Arama'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Listem'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text('Tavsiyeler'),
              backgroundColor: Colors.blue)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
    //body: Image.network(url, width: double.infinity));
  }
}
