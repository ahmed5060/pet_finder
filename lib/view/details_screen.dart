import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/models/animalsModel.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final Animals animals;
  const DetailsScreen({super.key, required this.animals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Pet Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250.h,
              decoration: BoxDecoration(
                image: animals.photos!.isNotEmpty? DecorationImage(
                    image: NetworkImage(
                      "${animals.photos![0].medium}",
                    ),
                    fit: BoxFit.cover) : const DecorationImage(
                    image: AssetImage(
                      "assets/photo-1575936123452-b67c3203c357.png",
                    ),
                    fit: BoxFit.cover),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("Name: ", style: TextStyle(fontSize: 20.sp),),
                  SizedBox(
                    width: 200.w,
                    child: Text(animals.name?? "NA", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("Size: ", style: TextStyle(fontSize: 20.sp),),
                  SizedBox(
                    width: 200.w,
                    child: Text(animals.size?? "NA", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("Color: ", style: TextStyle(fontSize: 20.sp),),
                  SizedBox(
                    width: 200.w,
                    child: Text(animals.colors!.primary?? "NA", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("Address: ", style: TextStyle(fontSize: 20.sp),),
                  SizedBox(
                    width: 200.w,
                    child: Text("${animals.contact!.address!.city!}, ${animals.contact!.address!.state!}, ${animals.contact!.address!.country!}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){

                  launchUrl(Uri.parse(animals.url!));
                },
                child: Container(
                  width: double.infinity,
                  height: 40.h,
                  color: Colors.blue,
                  child: Center(child: Text("Pet's Website", style: TextStyle(color: Colors.white, fontSize: 20.sp),)),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
