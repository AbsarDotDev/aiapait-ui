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
                      ? Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Set the card's border radius
                          ),
                          surfaceTintColor: Color(AppColors.white),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.search,
                                            color: Color(AppColors.primary),
                                          ),
                                          CustomText(
                                              text: 'Search', fontSize: 12),
                                          Expanded(
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
                                              padding: EdgeInsets.all(8),
                                              child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedFilter = "";
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      _selectedFilter,
                                                      style: TextStyle(
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
            final isActive = e == _selectedFilter;

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
