import 'package:auto_routes_test/common/extensions/integer_extension.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 72, height: 72, child: CircleAvatar(backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),)),
              24.width,
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alibek Test',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('alibek.yesetov@bk.ru'),
                ],
              )
            ],
          ),

          12.height,

          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Text(
              '“A budget is telling your money where to go instead of wondering where it went.”',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }
}
