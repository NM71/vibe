import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe/features/auth/presentation/cubits/auth_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // BUILD UI
  @override
  Widget build(BuildContext context) {
    // SCAFFOLD
    return Scaffold(
      // APPBAR
      appBar: AppBar(
        title: const Text("Your Vibe"),
        centerTitle: true,
        actions: [
          // logout button
          IconButton(onPressed: () {
            context.read<AuthCubit>().logout();
          }, icon: const Icon(Icons.logout))
        ],
      ),

      // DRAWER
      drawer: const Drawer(),
    );
  }
}
