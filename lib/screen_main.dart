import 'package:flutter/material.dart';
import 'package:sample_ui/custom_list_tile.dart';

class ScreenMain extends StatefulWidget {
  ScreenMain({Key? key}) : super(key: key);

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  List<String> universityList = [
    "Bangalore University",
    "Mangalore University",
    "Amity University",
    "Manipal University",
    "Kannur University",
    "Kerala Univeristy",
    "APJ University",
    "Delhi University",
    "Jaipur University",
    "Anna University",
    "Annamalai University",
    "Andhra University",
    "Goa University",
    "Thrissur University",
    "Kottayam University"
  ];

  TextEditingController searchController = TextEditingController();

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.teal),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        )),
                    height: size.height - kToolbarHeight - 20,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          const Text(
                            "Select Your University",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: "Search",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                            ),
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                searchText = value;
                              });
                            },
                            focusNode: FocusNode(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Builder(builder: (context) {
                              List<String> searchitems = universityList
                                  .where((element) => element
                                      .toLowerCase()
                                      .contains(searchText.toLowerCase()))
                                  .toList();

                              if (searchitems.isEmpty) {
                                return const Text("No University found!");
                              }

                              return ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      CustomListTileWidget(
                                          name: searchitems[index]),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                                  itemCount: searchitems.length);
                            }),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: size.width * 0.41,
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                    "lib/assets/WhatsApp Image 2022-08-14 at 1.55.51 PM.jpeg"),
                radius: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
