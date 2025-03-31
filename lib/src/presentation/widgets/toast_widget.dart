import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../../data/utils/constants.dart';

class ToastWidget {
  networkErrorToast() {
    return BotToast.showNotification(
      title:
          (_) => Text(
            'Sorry',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
      subtitle:
          (_) => Text(
            'No further information could be loaded. Please check your connection.',
            style: TextStyle(color: Colors.white),
          ),
      backgroundColor: Colors.black54,
      leading:
          (cancel) => SizedBox.fromSize(
            size: const Size(40, 40),
            child: IconButton(
              icon: const Icon(Icons.error_outline, color: Colors.white),
              onPressed: cancel,
            ),
          ),
      align: Alignment.bottomCenter,
    );
  }

  loadingToast() {
    return BotToast.showCustomLoading(
      toastBuilder: (_) {
        return const CircularProgressIndicator(color: primaryColor);
      },
      clickClose: true,
      backButtonBehavior: BackButtonBehavior.none,
    );
  }
}
