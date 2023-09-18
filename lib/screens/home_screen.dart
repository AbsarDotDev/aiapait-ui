import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/widgets/custom_text.dart';
import 'package:aiapait/widgets/custom_textfield.dart';
import 'package:aiapait/widgets/trademark_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  FocusNode searchNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchNode.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(AppColors.bgColor),
        appBar: AppBar(
          backgroundColor: Color(AppColors.bgColor),
          toolbarHeight: MediaQuery.of(context).size.height * .08,
          leadingWidth: double.infinity / 2,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Greetings",
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                CustomText(
                  text: "Absar Ali",
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  controller: _searchController,
                  validator: (val) {},
                  currentNode: searchNode,
                  hintText: "Search",
                  preFixIcon: Icons.search,
                  suffixIcon: Icons.online_prediction,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TradeMarkCard(
                        country: "Dubai",
                        description: "Property Leases",
                        index: index + 1,
                        status: "Pending",
                        stepNo: 1,
                        trdNo: "SG29",
                        trdMainStatus: "Open",
                        dateTime: DateTime.now(),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
