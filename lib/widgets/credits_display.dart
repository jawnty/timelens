import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/credits_service.dart';
import '../theme/app_theme.dart';
import 'purchase_sheet.dart';

class CreditsDisplay extends StatelessWidget {
  const CreditsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreditsService>(
      builder: (context, creditsService, child) {
        final displayText = creditsService.getCreditsDisplayText();
        final isUnlimited = creditsService.isAllowlistedUser;

        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const PurchaseSheet(),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isUnlimited
                  ? AppTheme.accentCyan.withValues(alpha: 0.15)
                  : AppTheme.primaryColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isUnlimited
                    ? AppTheme.accentCyan.withValues(alpha: 0.3)
                    : AppTheme.primaryColor.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isUnlimited ? Icons.all_inclusive : Icons.photo_camera,
                  size: 16,
                  color: isUnlimited ? AppTheme.accentCyan : AppTheme.primaryColor,
                ),
                const SizedBox(width: 6),
                Text(
                  displayText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isUnlimited ? AppTheme.accentCyan : AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
