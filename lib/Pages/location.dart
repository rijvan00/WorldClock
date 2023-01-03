import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime('India', 'india.png', 'Asia/India', '', true),
    WorldTime('London', 'uk.png', 'Europe/London', '', true),
    WorldTime('Athens', 'greece.png', 'Europe/Berlin', '', true),
    WorldTime('Cairo', 'egypt.jpeg', 'Africa/Cairo', '', true),
    WorldTime('Nairobi', 'kenya.png', 'Africa/Nairobi', '', true),
    WorldTime('Chicago', 'usa.png', 'America/Chicago', '', true),
    WorldTime('New York', 'usa.png', 'America/New_York', '', true),
    WorldTime('Seoul', 'southKorea.jpg', 'Asia/Seoul', '', true),
    WorldTime('Jakarta', 'indonesia.jpeg', 'Asia/Jakarta', '', true),

  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: (
      ListView.builder(
          itemCount: locations.length,
        itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
          child: Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          ),
        );
        }
      )
      ),

    );
  }
}
