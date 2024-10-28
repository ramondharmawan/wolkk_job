import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wolkk_job/api/job_api.dart';
import 'package:wolkk_job/pages/custom_appbar.dart';

class CareerPages extends StatefulWidget {
  const CareerPages({super.key});

  @override
  State<CareerPages> createState() => _CareerPagesState();
}

class _CareerPagesState extends State<CareerPages> {
  @override
  void initState() {
    getJobs(5, 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Center(
                child: Text(
                  'Wolkk Job!',
                  style: TextStyle(fontSize: 100),
                ),
              ),
              const SizedBox(height: 80),
              const SizedBox(
                height: 100,
                child: TextField(
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    hintStyle: TextStyle(fontSize: 30),
                    hintText: 'Search',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.search, color: Colors.black, size: 40),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.grey, width: 3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.grey, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.black, width: 3),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Row(
                children: [
                  _buildDropdownButtonWithBorder(context, 'Team', ['Team A']),
                  const SizedBox(width: 10),
                  _buildDropdownButtonWithBorder(context, 'Sub-speciality',
                      ['Sub-speciality', 'Sub-speciality 2']),
                  const SizedBox(width: 10),
                  _buildDropdownButtonWithBorder(
                      context, 'Work Type', ['Full Time', 'Part Time']),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(color: Color(0xFFD3d3d3), thickness: 3),
              const SizedBox(height: 20),
              FutureBuilder(
                  future: getJobs(5, 10),
                  builder: (context, response) {
                    if (!response.hasData) {
                      if (response.hasError) {
                        return Center(
                          child: Text(
                            'Error: ${response.error}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      }

                      return _buildShimmer();
                    }

                    return Column(
                      children: [
                         Text('${response.data!.pagination.perPage} Live Result',
                            style: const TextStyle(fontSize: 22)),
                        const SizedBox(height: 40),
                        ListView.builder(
                          itemCount: response.data!.data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = response.data!.data[index];
                            return _jobsItem(
                              title: item.title,
                              subtitle: item.tags.join(', '),
                              location: item.location,
                              onTap: () =>
                                  GoRouter.of(context).go('/career_details'),
                            );
                          },
                        ),
                      ],
                    );
                  }),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          height: 170,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButtonWithBorder(
      BuildContext context, String hint, List<String> items) {
    return Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Text(
            hint,
            style: const TextStyle(fontSize: 16),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (value) {
            // Handle selection change if necessary
          },
        ),
      ),
    );
  }

  Widget _jobsItem({
    required String title,
    required String subtitle,
    required String location,
    void Function()? onTap,
  }) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.grey.withOpacity(0.4),
            hoverColor: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 2),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
