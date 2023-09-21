import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/widgets/custom_button.dart';
import 'package:aiapait/widgets/custom_text.dart';
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
  final ScrollController _scrollController = ScrollController();
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

  final TextEditingController _searchController = TextEditingController();
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
    return Scaffold(
      backgroundColor: Color(AppColors.bgColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              leadingWidth: double.infinity,
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
                !_showSearchField
                    ? InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.search_rounded,
                            size: 30,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  _showSearchField
                      ? Card(
                          surfaceTintColor: Color(AppColors.white),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    height: 40,
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.search,
                                            color: Color(AppColors.primary),
                                          ),
                                          const CustomText(
                                              text: 'Search', fontSize: 12),
                                          const Expanded(
                                              child: SizedBox(
                                            width: 20,
                                          )),
                                          if (_selectedFilter != "")
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.grey[400],
                                              ),
                                              padding: const EdgeInsets.all(8),
                                              child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedFilter = "";
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.close,
                                                        size: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      _selectedFilter,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12),
                                                    )
                                                  ]),
                                            ),
                                        ]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    _showMyDialog();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/ic_settings.svg",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Center(),
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
              shape: const CircleBorder(),
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
                          setState(() {});
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
                          setState(() {
                            _selectedFilter = "";
                          });
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
                  builder: (BuildContext context, StateSetter setStates) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFilterCategory(
                              "Case Status", _caseStaus, setStates),
                          _buildFilterCategory(
                              "Response Status", _resposeStatus, setStates),
                          _buildFilterCategory("Process", _process, setStates),
                          const SizedBox(height: 30),
                          CustomButton(
                            text: "Apply Filters",
                            isDisabled: _selectedFilter != "" ? false : true,
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {});
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
          padding: const EdgeInsets.symmetric(vertical: 2.0),
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
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 6, 0),
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
