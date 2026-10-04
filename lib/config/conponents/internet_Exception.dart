import 'package:flutter/material.dart';

class InternetException extends StatelessWidget {
  final VoidCallback onPress;
  const InternetException({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .15),
        Icon(Icons.cloud_off, color: Colors.red, size: 50),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "we're unable to show result.\n Please Check your data\nConnection",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 20),
            ),
          ),
        ),
        ElevatedButton(onPressed: (){
          onPress;
        }, child:Text('RETRY',style: Theme.of(context).textTheme.bodySmall,))
      ],
    );
  }
}
