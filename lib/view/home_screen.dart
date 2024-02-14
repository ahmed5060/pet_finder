import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder/bloc/cubit.dart';
import 'package:pet_finder/bloc/state.dart';
import 'package:pet_finder/helper/Cache_helper.dart';
import 'package:pet_finder/models/animalsModel.dart';

import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var access_token = CacheHelper.getData(key: 'access_token');
  final ScrollController scrollController = ScrollController();
  AnimalsModel? animalsModel;
  List<Animals> data = [];
  List<String> typesList = ["All", "Cat", "Horse", "Bird", "Rabbit"];
  String type = "";
  int page = 1;
  bool loading = false;

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    BlocProvider.of<AppCubit>(context).GetTokenAnimals(token: access_token, page: page.toString(), type: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is GetAnimalsSuccessState){
          animalsModel = state.animalsModel;
          data.addAll(animalsModel!.animals!);
          loading = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Pets"),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: typesList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            if(typesList[index] == "All"){
                              type = '';
                            }else{
                              type = typesList[index];
                            }
                            page = 1;
                            data.clear();
                            BlocProvider.of<AppCubit>(context).GetTokenAnimals(token: access_token, page: page.toString(), type: type);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                            child: Text(typesList[index]),
                          ),
                        ),
                      ),
                    ),
                ),
              ),
              SizedBox(height: 10.h,),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    controller: scrollController,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                      if(index < data.length){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => DetailsScreen(animals: data[index],))));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 120.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    image: data[index].photos!.isNotEmpty? DecorationImage(
                                        image: NetworkImage(
                                          "${data[index].photos![0].small}",
                                        ),
                                        fit: BoxFit.cover) : const DecorationImage(
                                        image: AssetImage(
                                          "assets/photo-1575936123452-b67c3203c357.png",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(width: 10.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text("Name: "),
                                        SizedBox(
                                          width: 200.w,
                                          child: Text(data[index].name?? "NA", maxLines: 1, overflow: TextOverflow.ellipsis,),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8.h),
                                      child: Row(
                                        children: [
                                          const Text("Gender: "),
                                          Text(data[index].gender?? "NA"),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text("Type: "),
                                        Text(data[index].type?? "NA"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }else{
                        return const Center(child: CircularProgressIndicator());
                      }
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                      itemCount:loading? data.length + 1 : data.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if(page < animalsModel!.pagination!.totalPages!){
        loading = true;
        page ++;
        BlocProvider.of<AppCubit>(context).GetTokenAnimals(token: access_token, page: page.toString(), type: type);
      }
    }
  }
}
