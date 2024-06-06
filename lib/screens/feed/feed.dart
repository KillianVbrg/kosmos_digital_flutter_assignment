import 'package:assignment/constants/colors.dart';
import 'package:assignment/screens/posting/postImageSelector.dart';
import 'package:assignment/screens/profile/profile_overview.dart';
import 'package:assignment/services/firestore/post_store.dart';
import 'package:assignment/widgets/post.dart';
import 'package:assignment/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  const Feed({super.key, this.previousRoute});

  final String? previousRoute;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final user = "Anna Clark";
  final post = "assets/picture_placeholder_1.png";

  late bool showSuccess;

  @override
  void initState() {
    Provider.of<PostStore>(context, listen: false).fetchPosts();

    showSuccess = widget.previousRoute == "posting" ? true : false;

    if(showSuccess){
      new Future.delayed(const Duration(seconds: 3), (){
        if(mounted){
          setState(() {
            showSuccess = false;
          });
        }
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.primaryColor.withOpacity(0.5),
          onTap: (index){
            if(index == 1){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileOverview()));
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
                label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "",
            ),
          ],
          currentIndex: 0,
          iconSize: 20,
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            if(showSuccess)
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 5 ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(52, 230, 148, 1),
                  ),
                  width: double.infinity,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StyledTitleMedium("Post publié !"),
                      StyledTitleSmall("Votre post a bien été publié.",)
                    ],
                  ),
                ),
              ),
            if(!showSuccess)
              Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledHeadlineSmall(
                              text: "Bonjour, Anna 👋🏻",
                              centered: false,
                            ),
                            StyledTitleLarge("Fil d'actualités"),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileOverview()));
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/profile_placeholder_2.png"),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 25,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),


            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Récents",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Stack(
                children: [
                  Consumer<PostStore>(
                    builder: (context, value, child){
                      return ListView.builder(
                        itemCount: value.posts.length,
                        itemBuilder: (_, index){
                          return Post(user: value.posts[index].authorId, imagePath: value.posts[index].image);
                        },
                      );
                    },
                  ),
                  Positioned.fill(
                    bottom: 10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle_rounded,
                          size: 75,
                          color: Colors.white,
                        ),
                        onPressed: (){
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => PostImageSelector(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
