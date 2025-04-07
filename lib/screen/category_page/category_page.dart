
import 'package:flutter/material.dart';
import 'package:pdp_quiz/core/theme/colors.dart';
import 'package:pdp_quiz/core/widgets/custom_bottom_nav_bar.dart';
import 'package:pdp_quiz/screen/users/users_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}


class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("My Level",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),),
                  ],
                ),
                myList(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzdnZP_35nAnHmkcEMOmd45INymDTNIZ7kBw&s', text: 'Flutter', score: 3, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersPage()));
                  print('flutter bosildi');
                }),
                myList(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1869px-Python-logo-notext.svg.png', text: 'Python', score: 0, onTap: () {  }),
                myList(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCUaDjGczuu5b038vjXDstYNwIUtEc7rS3Fw&s', text: 'Java', score: 4, onTap: () {  }),
                myList(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2P1DD7vW-dRlK-8dP5braAEzt-8_3XMdyMw&s', text: 'Frontend', score: 2, onTap: () {  }),
                myList(image: 'https://upload.wikimedia.org/wikipedia/commons/1/19/C_Logo.png', text: 'C#', score: 2, onTap: () {  }),
                myList(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAp7qsjXPsV3Ug1CYFg4I5GFdsCqR5kQsO6g&s', text: 'C++', score: 2, onTap: () {  }),
                myList(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGFCqbmn0sgkbwcva34C-s0DR8vX6taf579Q&s', text: 'Android', score: 2, onTap: () {  }),
                myList(image: 'https://cdn3.iconfinder.com/data/icons/social-media-logos-glyph/2048/5315_-_Apple-512.png', text: 'iOs', score: 2, onTap: () {
                  print('ios bosildi');
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(1, context),
    );
  }
}


SizedBox myList({required String image,required String text,required int score,required VoidCallback onTap}){
  return SizedBox(
    height: 90,
    child: Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(image,height: 30,
                  width: 30,fit: BoxFit.cover,),
                SizedBox(width: 10,),
                Text(text),
                Spacer(),
                Text("9/$score"),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}