import 'package:flutter/material.dart';
import 'package:marketinya/utils/image_utils.dart';
import 'package:marketinya/widgets/custom_app_bar.dart';
import 'package:marketinya/widgets/footer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/blog_model.dart';
import '../widgets/blog/check_services_and_free_consultation_section.dart';
import 'package:marketinya/utils/color_utils.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final List<BlogModel> _data = [
    BlogModel(
      headerValue: 'Защо е важно да имаме ТОП ниво на клиентско обслужване?',
      expandedValue:
          '''Adobe разработва модел за генериране на видео за Firefly, който ще добави нови инструменти към платформата Premiere Pro. Те ще позволят на потребителите да разширяват кадри, както и да добавят или премахват обекти чрез текстови команди – аналогично на функцията Generative Fill във Photoshop...''',
      imageAsset: ImageUtils.whyTopLevelServicesImage,
      views: 0,
      date: '18.04.2024',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadViews();
  }

  Future<void> _loadViews() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      for (var post in _data) {
        post.views = prefs.getInt(post.headerValue) ?? post.views;
      }
    });
  }

  Future<void> _incrementViews(BlogModel post) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      post.views++;
      prefs.setInt(post.headerValue, post.views);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        activeTab: 'Блог',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header1(),
            _header2(),
            _buildBlogCards(),
            const CheckServicesAndFreeConsultationSection(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Padding _header1() {
    return const Padding(
      padding: EdgeInsets.only(left: 156, top: 100, bottom: 32),
      child: Text(
        'НОВОСТИ В МАРКЕТИНГА',
        style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Padding _header2() {
    return const Padding(
      padding: EdgeInsets.only(left: 156, bottom: 124),
      child: Text(
        'Каĸво е необходимо да знаем, за да имаме успешни\nреĸламни ĸампании.',
        style: TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Center _buildBlogCards() {
    return Center(
      child: Column(
        children: _data.map<Widget>((BlogModel post) {
          return SizedBox(
            width: 552,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: ColorUtils.charcoal,
              margin: const EdgeInsets.only(bottom: 24.0),
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: SizedBox(
                      width: 552,
                      height: 265,
                      child: Image.asset(post.imageAsset, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      post.headerValue,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.visibility,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${post.views}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Време за прочит: 5 м.',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          post.date,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                          ),
                          child: const Text(
                            'Виж още',
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            _incrementViews(post);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
