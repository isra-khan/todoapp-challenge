import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/task.dart';
import 'screens/splash_screen.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TaskProvider()),
          // Add more providers as needed
        ],
        child: SplashScreen(), // Corrected
      ),
    );
