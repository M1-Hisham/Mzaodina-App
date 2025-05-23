import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzaodina_app/core/resources/resources.dart';
import 'package:mzaodina_app/core/widgets/custom_elevated_button.dart';

class Bid {
  final int number;
  final String name;
  final double amount;
  final DateTime dateTime;

  Bid({
    required this.number,
    required this.name,
    required this.amount,
    required this.dateTime,
  });
}

class BidsDialog extends StatefulWidget {
  final List<Bid> bids;

  const BidsDialog({super.key, required this.bids});

  @override
  State<BidsDialog> createState() => _BidsDialogState();
}

class _BidsDialogState extends State<BidsDialog> {
  int currentPage = 0;
  static const int itemsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    int totalPages = (widget.bids.length / itemsPerPage).ceil();

    if (currentPage < 0) currentPage = 0;
    if (currentPage >= totalPages) currentPage = totalPages - 1;

    final visibleBids =
        widget.bids
            .skip(currentPage * itemsPerPage)
            .take(itemsPerPage)
            .toList();

    return Dialog(
      backgroundColor: R.colors.whiteLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "لوحة سجل المزايدات",
                style: R.textStyles.font18blackW500Light,
              ),
              SizedBox(height: 34.h),
              _buildHeaderRow(),

              Divider(color: R.colors.primaryColorLight, thickness: 0.5),
              ...visibleBids.map(_buildBidRow),

              SizedBox(height: 5),
              _buildPagination(totalPages),

              SizedBox(height: 26.h),
              CustomElevatedButton(
                text: 'اغلاق',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _headerCell("#"),
        _headerCell("اسم المزايد"),
        _headerCell("المبلغ"),
        _headerCell("الوقت"),
      ],
    );
  }

  Widget _buildBidRow(Bid bid) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dataCell(bid.number.toString().padLeft(2, '0')),
              _dataCell(bid.name),
              _dataCell('؋ ${bid.amount.toStringAsFixed(2)}'),
              _dataCell(
                '${_formatTime(bid.dateTime)}\n${_formatDate(bid.dateTime)}',
              ),
            ],
          ),
        ),
        Divider(color: R.colors.primaryColorLight, thickness: 0.5),
      ],
    );
  }

  Widget _headerCell(String text) => FittedBox(
    child: Text(
      text,
      style: R.textStyles.font14BlackW500Light,
      textAlign: TextAlign.center,
    ),
  );
  Widget _dataCell(String text) => FittedBox(
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: R.textStyles.font12Grey3W500Light,
    ),
  );

  String _formatTime(DateTime dt) =>
      "${dt.hour}:${dt.minute.toString().padLeft(2, '0')} م";
  String _formatDate(DateTime dt) =>
      "${dt.day.toString().padLeft(2, '0')}-${dt.month.toString().padLeft(2, '0')}-${dt.year}";

  Widget _buildPagination(int totalPages) {
    const int maxVisibleButtons = 2;
    int startPage = (currentPage - maxVisibleButtons ~/ 2).clamp(
      0,
      totalPages - maxVisibleButtons,
    );
    int endPage = (startPage + maxVisibleButtons).clamp(0, totalPages);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => setState(() => currentPage--),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color:
                  currentPage == 0
                      ? R.colors.secondButton
                      : R.colors.primaryColorLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(R.images.forwardButton),
          ),
        ),
        if (startPage > 0)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text("..."),
          ),
        SizedBox(width: 8.w),
        ...List.generate(endPage - startPage, (index) {
          int pageIndex = startPage + index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () => setState(() => currentPage = pageIndex),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                decoration: BoxDecoration(
                  color:
                      currentPage == pageIndex
                          ? R.colors.primaryColorLight
                          : R.colors.secondButton,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${pageIndex + 1}',
                  style: R.textStyles.font10whiteW500Light.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }),
        if (endPage < totalPages)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text("..."),
          ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () => setState(() => currentPage++),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color:
                  currentPage == totalPages - 1
                      ? R.colors.secondButton
                      : R.colors.primaryColorLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(R.images.backButton),
          ),
        ),
      ],
    );
  }
}
