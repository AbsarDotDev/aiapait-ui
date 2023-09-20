import 'package:aiapait/utils/colors.dart';
import 'package:aiapait/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TradeMarkCard extends StatefulWidget {
  final String trdMainStatus;
  final DateTime dateTime;
  final int index;
  final String description;
  final String country;
  final String trdNo;
  final int stepNo;
  final String status;
  const TradeMarkCard(
      {super.key,
      required this.trdMainStatus,
      required this.dateTime,
      required this.index,
      required this.description,
      required this.country,
      required this.trdNo,
      required this.stepNo,
      required this.status});

  @override
  State<TradeMarkCard> createState() => _TradeMarkCardState();
}

class _TradeMarkCardState extends State<TradeMarkCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 3,
      child: InkWell(
        splashColor: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        widget.trdMainStatus.toLowerCase() == 'open'
                            ? Icons.circle_outlined
                            : Icons.circle,
                        color: Color(
                            widget.trdMainStatus.toLowerCase() == 'closed'
                                ? AppColors.red
                                : AppColors.green),
                        size: 8,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      CustomText(
                        text: widget.trdMainStatus,
                        fontSize: 12,
                        color: widget.trdMainStatus.toLowerCase() == 'closed'
                            ? AppColors.red
                            : AppColors.green,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Created on: ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                            text: DateFormat('d MMMM, yyyy')
                                .format(widget.dateTime),
                            // '${widget.dateTime.day} ${widget.dateTime.month}, ${widget.dateTime.year}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: widget.index < 10
                      ? "0${widget.index.toString()} "
                      : widget.index.toString(),
                  style: TextStyle(fontSize: 16, color: Color(AppColors.black)),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            '${widget.description} - ${widget.country} - ${widget.trdNo}',
                        // '${widget.dateTime.day} ${widget.dateTime.month}, ${widget.dateTime.year}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Poppins')),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Color(AppColors.dividerColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(text: "Process:  ", fontSize: 12),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Color(AppColors.primary),
                            shape: BoxShape.circle),
                        child: Center(
                          child: CustomText(
                            text: widget.stepNo.toString(),
                            fontSize: 10,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      CustomText(
                        text: "  POA & Application",
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Status: ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.status,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: Color(widget.status.toLowerCase() ==
                                        'pending'
                                    ? AppColors.green
                                    : widget.status.toLowerCase() == 'awaiting'
                                        ? AppColors.yellow
                                        : widget.status.toLowerCase() ==
                                                'rejected'
                                            ? AppColors.red
                                            : AppColors.primary))),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
