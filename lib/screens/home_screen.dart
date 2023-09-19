import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/widgets/custom_button.dart';
import 'package:aiapait/widgets/custom_text.dart';
import 'package:aiapait/widgets/custom_textfield.dart';
import 'package:aiapait/widgets/filter_button.dart';
import 'package:aiapait/widgets/trademark_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  bool _showSearchField = true;
  bool _showFloatingButton = false;
  String _selectedFilter = "";
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    searchNode.dispose();
    _searchController.dispose();
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (_scrollController.hasClients) {
      if (_scrollController.offset > 1 && _showSearchField) {
        setState(() {
          _showSearchField = false;
          _showFloatingButton = true;
        });
      } else if (_scrollController.offset <= 1 && !_showSearchField) {
        setState(() {
          _showSearchField = true;
          _showFloatingButton = false;
        });
      }
    }
  }

  TextEditingController _searchController = TextEditingController();
  FocusNode searchNode = FocusNode();
  final List<String> _caseStaus = ["Open", "Closed", "Completed"];
  final List<String> _resposeStatus = [
    "Pending",
    "Awaiting",
    "Rejected",
    "Downloaded"
  ];
  final List<String> _process = [
    "01 Docuement Submission",
    "02 E Signature",
    "03 Publication",
    "04 Registeration",
    "05 TMCR"
  ];

  @override
  Widget build(BuildContext context) {
    print(_selectedFilter);

    return Scaffold(
      backgroundColor: Color(AppColors.bgColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              leadingWidth: double.infinity / 2,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "Greetings",
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        text: "Absar Ali",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Color(AppColors.bgColor),
              surfaceTintColor: Color(AppColors.bgColor),
              floating: true,
              pinned: true,
              collapsedHeight: 70,
              actions: <Widget>[
                !_showSearchField ? const Icon(Icons.search) : const SizedBox(),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  _showSearchField
                      ? TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Color(AppColors.black50),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(AppColors.black50),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(AppColors.black50),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(AppColors.black50),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(AppColors.black50),
                                ),
                              ),
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _showMyDialog();
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/ic_settings.svg",
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedFilter = "";
                                      });
                                    },
                                    color: Color(AppColors.black50),
                                    icon: Icon(Icons.close),
                                  ),
                                ],
                              )),
                        )
                      : Center(),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
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
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _showFloatingButton
          ? FloatingActionButton(
              backgroundColor: Color(AppColors.primary),
              shape: CircleBorder(),
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: Color(AppColors.white),
              ),
            )
          : Container(
              color: Colors.transparent,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: CustomButton(
                text: "Add New Trademark",
                onPressed: () {},
              ),
            ),
      floatingActionButtonLocation: _showFloatingButton
          ? FloatingActionButtonLocation.endDocked
          : FloatingActionButtonLocation.centerDocked,
    );
  }

  _showMyDialog() async {
    return showGeneralDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        throw Error();
      },
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                backgroundColor: Color(AppColors.bgColor),
                surfaceTintColor: Color(AppColors.bgColor),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(AppColors.primary),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const CustomText(
                        text: "Filters",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/ic_reset.svg"),
                            const SizedBox(
                              width: 4,
                            ),
                            CustomText(
                              text: "Reset",
                              fontSize: 12,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "Filters",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          _buildFilterCategory(
                              "Case Status", _caseStaus, setState),
                          _buildFilterCategory(
                              "Response Status", _resposeStatus, setState),
                          _buildFilterCategory("Process", _process, setState),
                          const SizedBox(height: 30),
                          CustomButton(
                            text: "Apply Filters",
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ));
      },
      transitionDuration: const Duration(milliseconds: 250),
      barrierDismissible: false,
      barrierLabel: '',
      context: context,
    );
  }

  Widget _buildFilterCategory(
      String category, List<String> options, StateSetter setState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Wrap(
          children: options.map((e) {
            final isActive = e == _selectedFilter;

            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 6, 0),
              child: FilterButton(
                text: e,
                selectedFilter: _selectedFilter,
                onPressed: () {
                  _handleFilterSelection(e, setState);
                },
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _handleFilterSelection(String filter, StateSetter setState) {
    setState(() {
      _selectedFilter = filter == _selectedFilter ? "" : filter;
    });
  }
}
