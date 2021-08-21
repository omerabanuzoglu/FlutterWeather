import 'package:flutter/material.dart';

Widget get bottomSpace => const SizedBox(height: 10);
Widget get betweenSpace => const SizedBox(width: 10);
Widget get line => const Divider(thickness: 2, height: 10);
Widget get timeText => const Divider(thickness: 2, height: 10);

class Widgets {
  String substringTime(String text) {
    return text.substring(0, 5);
  }

  String substringLocalTime(String text) {
    return text.substring(0, 10);
  }

  String cut(String text) {
    var firstCut = text.substring(1);
    int length = firstCut.length;
    return firstCut.substring(0, length - 1);
  }

  Color whatColor(String status) {
    if (status == "Partly cloudy") {
      return Colors.grey;
    } else if (status == "Clear") {
      return Colors.blue;
    } else if (status == "Sunny") {
      return Colors.yellow;
    } else if (status == "Patchy rain possible") {
      return Colors.blueGrey;
    }
    return Colors.white;
  }

  static List<String> cities = [
    "Adana",
    "Adiyaman",
    "Afyonkarahisar",
    "Agri",
    "Amasya",
    "Ankara",
    "Antalya",
    "Artvin",
    "Aydin",
    "Balikesir",
    "Bilecik",
    "Bingol",
    "Bitlis",
    "Bolu",
    "Burdur",
    "Bursa",
    "Canakkale",
    "Cankiri",
    "Corum",
    "Denizli",
    "Diyarbakir",
    "Edirne",
    "Elazig",
    "Erzincan",
    "Erzurum",
    "Eskisehir",
    "Gaziantep",
    "Giresun",
    "Gumushane",
    "Hakkari",
    "Hatay",
    "Isparta",
    "Mersin",
    "Istanbul",
    "Izmir",
    "Kars",
    "Kastamonu",
    "Kayseri",
    "Kirklareli",
    "Kirsehir",
    "Kocaeli",
    "Konya",
    "Kutahya",
    "Malatya",
    "Manisa",
    "Kahramanmaras",
    "Mardin",
    "Mugla",
    "Mus",
    "Nevsehir",
    "Nigde",
    "Ordu",
    "Rize",
    "Sakarya",
    "Samsun",
    "Siirt",
    "Sinop",
    "Sivas",
    "Tekirdag",
    "Tokat",
    "Trabzon",
    "Tunceli",
    "Sanliurfa",
    "Usak",
    "Van",
    "Yozgat",
    "Zonguldak",
    "Aksaray",
    "Bayburt",
    "Karaman",
    "Kirikkale",
    "Batman",
    "Sirnak",
    "Bartin",
    "Ardahan",
    "Igdir",
    "Yalova",
    "Karabuk",
    "Kilis",
    "Osmaniye",
    "Duzce"
  ];
}
