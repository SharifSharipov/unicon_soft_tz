import 'package:flutter/material.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title:  Text('Description',style: context.textStyle.appBarTitle,),
        centerTitle: true,
      ),
      backgroundColor: context.colorScheme.surface,
    );
  }
}