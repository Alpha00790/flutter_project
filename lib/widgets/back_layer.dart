import 'package:flutter/material.dart';

class BackLayer extends StatelessWidget {
  const BackLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -80,
          left: -25,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(
                        'https://scontent.fzyl1-1.fna.fbcdn.net/v/t1.6435-9/135934418_2723017654675127_8203263293009641061_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=299RQG9mH7AAX8ZO6ej&_nc_ht=scontent.fzyl1-1.fna&oh=00_AT_jlSGnvjGc-jEnN2PFmgd59ZW4isjgNCYoT5u3OH74Sw&oe=621A0F90'),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                BackLayerButton(
                  icon: Icon(Icons.upload_rounded),
                  lText: 'Upload A Product',
                  onPressed: () => {},
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BackLayerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final String lText;
  const BackLayerButton({
    required this.onPressed,
    required this.icon,
    required this.lText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(lText),
    );
  }
}
