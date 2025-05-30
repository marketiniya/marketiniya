import 'package:flutter/material.dart';
import 'package:marketinya/core/design_system/atoms/spaces.dart';
import 'package:marketinya/core/design_system/themes/app_colors.dart';

class Pagination extends StatelessWidget {
  const Pagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    // Show max 5 pages, with ellipsis if needed
    var pageButtons = <Widget>[];
    const maxVisiblePages = 5;

    if (totalPages <= maxVisiblePages) {
      // Show all pages if total is less than max visible
      pageButtons =
          List.generate(totalPages, (index) => _buildPageButton(index + 1));
    } else {
      // Always show first page
      pageButtons.add(_buildPageButton(1));

      if (currentPage <= 3) {
        // Near start: show 1,2,3,...,last
        pageButtons.addAll([
          _buildPageButton(2),
          _buildPageButton(3),
          _buildEllipsis(),
          _buildPageButton(totalPages),
        ]);
      } else if (currentPage >= totalPages - 2) {
        // Near end: show 1,...,n-2,n-1,n
        pageButtons.addAll([
          _buildEllipsis(),
          _buildPageButton(totalPages - 2),
          _buildPageButton(totalPages - 1),
          _buildPageButton(totalPages),
        ]);
      } else {
        // Middle: show 1,...,current-1,current,current+1,...,last
        pageButtons.addAll([
          _buildEllipsis(),
          _buildPageButton(currentPage - 1),
          _buildPageButton(currentPage),
          _buildPageButton(currentPage + 1),
          _buildEllipsis(),
          _buildPageButton(totalPages),
        ]);
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed:
              currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
          icon: const Icon(Icons.chevron_left, size: 20),
          color: currentPage > 1 ? AppColors.dustyOlive : Colors.grey,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: md, minHeight: md),
        ),
        ...pageButtons,
        IconButton(
          onPressed: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
          icon: const Icon(Icons.chevron_right, size: 20),
          color: currentPage < totalPages ? AppColors.dustyOlive : Colors.grey,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: md, minHeight: md),
        ),
      ],
    );
  }

  Widget _buildPageButton(int pageNumber) {
    final isCurrentPage = pageNumber == currentPage;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: InkWell(
        onTap: isCurrentPage ? null : () => onPageChanged(pageNumber),
        child: Container(
          width: sm,
          height: sm,
          decoration: BoxDecoration(
            color: isCurrentPage ? AppColors.dustyOlive : Colors.transparent,
            borderRadius: BorderRadius.circular(micro),
            border: Border.all(
              color: isCurrentPage ? AppColors.dustyOlive : Colors.grey,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              pageNumber.toString(),
              style: TextStyle(
                fontSize: xxsPlus,
                color: isCurrentPage ? Colors.white : Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEllipsis() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: micro),
      child: Text(
        '...',
        style: TextStyle(
          color: Colors.grey,
          fontSize: xxsPlus,
        ),
      ),
    );
  }
}
