import 'package:flutter/material.dart';

class OdooImageShower extends StatefulWidget {
  const OdooImageShower({super.key});

  @override
  State<OdooImageShower> createState() => _OdooImageShowerState();
}

class _OdooImageShowerState extends State<OdooImageShower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.network('https://odoo.ycfitness.xyz/web/image?model=res.partner&id=20&field=avatar_128&unique=1234')),
    );
  }
}
