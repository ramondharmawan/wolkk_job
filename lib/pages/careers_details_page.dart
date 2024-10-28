import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CareerDetailsPage extends StatefulWidget {
  const CareerDetailsPage({super.key, required this.title});
  final String title;

  @override
  State<CareerDetailsPage> createState() => _CareerDetailsPageState();
}

class _CareerDetailsPageState extends State<CareerDetailsPage> {
  final List<String> reasons = [
    "Asia’s fastest-growing digital economy",
    "274 million people, 50% under 30 years old",
    "3rd biggest young workforce after India and China",
    ">30% of population with English proficiency",
    ">850 IT Universities and Academies",
    ">80,000 fresh IT graduates entering the workforce every year",
  ];

  final List<Map<String, String>> jobCategories = [
    {'title': 'Focus Jobs', 'category': 'Engineering'},
    {'title': 'Focus Jobs', 'category': 'Machine Learning'},
    {'title': 'Focus Jobs', 'category': 'Content Review'},
  ];

  final List<Map<String, String>> jobDetails = [
    {
      'title': 'Join the team redefining how the world experiences design.',
      'details':
          "Thanks for stopping by. We know job hunting can be a little time consuming and you're probably keen to find out what's on offer, so we'll get straight to the point."
    },
    {
      'title': 'Where and how you can work',
      'details':
          "Our flagship campus is in Sydney. We also have a campus in Melbourne and co-working spaces in Brisbane, Perth and Adelaide. But you have choice in where and how you work, we trust our Canvanauts to choose the balance that empowers them and their team to achieve their goals."
    },
    {
      'title': 'About the team',
      'details':
          "Join the innovation powerhouse - Content Machine Learning team at Canva! Our vision is to empower all our users with the safest and highest quality content at scale. We build models and human-in-the-loop workflows to amplify our content review efforts"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeader(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _detailJobTitle(),
                  const SizedBox(height: 30),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          jobCategories[index]['title'] ?? '',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          jobCategories[index]['category'] ?? '',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800),
                        ),
                      );
                    },
                    itemCount: jobCategories.length,
                    shrinkWrap: true,
                  ),
                  const SizedBox(height: 50),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          jobDetails[index]['title'] ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          jobDetails[index]['details'] ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(30, 20, 20, 20),
                      );
                    },
                    itemCount: jobCategories.length,
                    shrinkWrap: true,
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Senior Machine Learning Engineer - Content Review',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    _buildContactButton(
                      const Color(0xFF425B76),
                      'Apply Now',
                      () {
                        GoRouter.of(context).go('/apply');
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailJobTitle() {
    return const Text(
      'Senior Machine Learning Engineer - Content Review',
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
    );
  }

  AppBar _buildHeader() {
    return AppBar(
      toolbarHeight: 160,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200),
        child: Column(
          children: [
            _buildLanguageSelector(),
            const SizedBox(height: 40),
            _buildNavigationRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return const SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.language, color: Colors.black, size: 18),
          SizedBox(width: 5),
          Text(
            'English',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(width: 5),
          Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 18),
        ],
      ),
    );
  }

  Widget _buildNavigationRow() {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://wolkk.com/hs-fs/hubfs/logo%20small.jpg?width=240&height=152&name=logo%20small.jpg',
            height: 180,
          ),
          Row(
            children: [
              _buildMenuItem('Home'),
              _buildMenuItem('Blog'),
              _buildMenuItem('Services', isDropdown: true),
              _buildMenuItem('Customers'),
              _buildMenuItem('About', isDropdown: true),
              _buildMenuItem('Download eBook'),
              _buildMenuItem('Careers'),
              _buildContactButton(
                const Color(0xFF425B76),
                'Contact Us',
                () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, {bool isDropdown = false}) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).go('/careers');
      },
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          if (isDropdown)
            const Icon(Icons.keyboard_arrow_down,
                color: Colors.black, size: 18),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildContactButton(final Color? bgColor, final String? title,
      final VoidCallback? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? const Color(0xFF425B76),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: SizedBox(
        height: 50,
        width: 120,
        child: Center(
          child: Text(
            title ?? 'Contact Us',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
