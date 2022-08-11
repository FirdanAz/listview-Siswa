import 'package:flutter/material.dart';

class ListSiswa extends StatefulWidget {
  const ListSiswa({Key? key}) : super(key: key);

  @override
  State<ListSiswa> createState() => _ListSiswaState();
}

class _ListSiswaState extends State<ListSiswa> {
  List<User> users= [
    User(name: 'Muhammad Firdan Azhari', kelas: '11 PPLG 1', image: 'image/firdanImage.jpg'),
    User(name: 'Muhammad Zumar Ramadhan', kelas: '11 PPLG 1', image: 'image/zumarRamadhan.jpg'),
    User(name: 'Bayu Septian', kelas: '11 PPLG 1', image: 'image/bayu.jpg'),
    User(name: 'Muhammad Nur Wahid', kelas: '11 PPLG 1', image: 'image/bimawan.jpg'),
    User(name: 'Javier Gavra Abhinaya', kelas: '11 PPLG 1', image: 'image/javierGavra.jpg'),
    User(name: 'Kalam Ismail', kelas: '11 PPLG 1', image: 'image/kalamIsmail.jpg'),
    User(name: 'Muh Wahyu Ageng', kelas: '11 PPLG 1', image: 'image/wahyuAgeng.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('List Siswa'),
      // ),
      body:
      ListView.builder(
          padding: EdgeInsets.only(bottom: 20),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            final User list = users[index];
            return Card(
              child: Padding(
                padding: EdgeInsets.all(0.0),
                child: ListTile(
                  onLongPress: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Hapus Item'),
                        content: const Text('Tekan Ok untuk Menghapus'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context,'ok');
                              setState(() {
                                users.remove(list);
                              });
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    foregroundImage: AssetImage(list.image),
                  ),
                  title: Text(list.name),
                  subtitle: Text(list.kelas),
                ),
              ),
            );
          }),
    );
  }
}
class User{
  String name, kelas, image;
  User({required this.name, required this.kelas, required this.image});
}

