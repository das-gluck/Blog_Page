import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContentPage extends StatelessWidget {
  // const ContentPage({Key? key}) : super(key: key);

  final String title;
  final String image;
  ContentPage({required this.image , required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(Icons.bookmark_border_outlined, size: 20,),
                  color: Colors.grey,
                  onPressed: (){},
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(Icons.favorite_outline, size: 20,),
                  color: Colors.grey,
                  onPressed: (){},
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(Icons.share_outlined, size: 20,),
                  color: Colors.grey,
                  onPressed: (){},
                ),
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: BottomAppBar(
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.headset , color: Colors.grey,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.wb_sunny_outlined, color: Colors.grey)),
                IconButton(onPressed: (){}, icon: Icon(Icons.nights_stay_outlined, color: Colors.grey)),
                IconButton(onPressed: (){}, icon: Icon(Icons.format_size_outlined, color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: EdgeInsets.only(top: 32),
          child: ListView(
            children: [
              Text(
                title, style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic
              ),),
              SizedBox(height: 16,),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/photo.jpeg'),
                  ),
                  SizedBox(width: 6,),
                  Text("John Jonny, "),
                  Text("22 Mar 2091", style: TextStyle(color: Colors.grey),)
                ],
              ),
              SizedBox(height: 16,),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(Icons.remove_red_eye_outlined, color: Colors.grey,size: 18,),
                      Text('6.5K Views', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),),
                    ],
                  ),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6,
                    children: [
                      Icon(Icons.favorite, color: Colors.grey,size: 18,),
                      Text('306 Likes', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),),
                    ],
                  ),

                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6,
                    children: [
                      Icon(Icons.bookmark, color: Colors.grey,size: 18,),
                      Text('55 saves', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(image),
                ),
              ),
              SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'A',
                        style: GoogleFonts.notoSerif(color: Colors.black, fontSize: 32),
                        ),
                      TextSpan(
                        text:
                          ' blog is like an online diary where you can write about anything you like,'
                              ' such as your hobbies, travels, or even your daily life.'
                              ' People all around the world can read your blog and leave comments, '
                              'making it a great way to connect with others. You can also add pictures, '
                              'videos, and links to make your blog more interesting and interactive. '
                              'Some people start blogging just for fun, while others do it to earn money. '
                              'If you have a lot of readers, companies might pay you to advertise their products'
                              ' or services on your blog. Starting a blog is pretty easy. There are many free platforms'
                              ' like WordPress or Blogger where you can create your blog. You just need to sign up, '
                              'choose a design for your blog, and start writing. Remember, '
                              'it’s important to write regularly to keep your readers interested. '
                              'Also, be respectful and considerate of others in your blog posts and comments.',
                         style: GoogleFonts.notoSerif(color: Colors.black, fontSize: 18, height: 1.7),
                      ),

                    ],
                  ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}

