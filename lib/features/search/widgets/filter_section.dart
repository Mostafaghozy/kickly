import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';

class FilterSection extends StatefulWidget {
  final String title;
  final List<String> options;
  final bool isRadio;
  final int crossAxisCount;

  const FilterSection({
    super.key,
    required this.title,
    required this.options,
    this.isRadio = false,
    this.crossAxisCount = 2,
  });

  @override
  State<FilterSection> createState() => FilterSectionState();
}

class FilterSectionState extends State<FilterSection> {
  String? radioValue;
  final Set<String> checkedValues = {};

  void reset() {
    setState(() {
      radioValue = null;
      checkedValues.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: widget.title,
          color: Colors.black,
          size: 16,
          weight: FontWeight.w800,
        ),
        Gap(10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            crossAxisSpacing: widget.isRadio ? 60 : 10,
            mainAxisSpacing: 1,
            childAspectRatio: 4,
          ),
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            final item = widget.options[index];
            final selected = widget.isRadio
                ? radioValue == item
                : checkedValues.contains(item);

            return InkWell(
              onTap: () {
                setState(() {
                  if (widget.isRadio) {
                    radioValue = item;
                  } else {
                    selected
                        ? checkedValues.remove(item)
                        : checkedValues.add(item);
                  }
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.isRadio
                      ? Radio<String>(
                          value: item,
                          groupValue: radioValue,
                          onChanged: (value) {
                            setState(() => radioValue = value);
                          },
                          activeColor: AppColors.primary,
                          visualDensity: VisualDensity.compact,
                        )
                      : Checkbox(
                          value: selected,
                          onChanged: (_) {
                            setState(() {
                              selected
                                  ? checkedValues.remove(item)
                                  : checkedValues.add(item);
                            });
                          },
                          activeColor: AppColors.primary,
                          checkColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                          visualDensity: VisualDensity.compact,
                        ),
                  Expanded(
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
