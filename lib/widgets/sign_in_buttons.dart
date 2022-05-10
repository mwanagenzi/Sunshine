import 'package:flutter/material.dart';

class FacebookSignInButton extends StatelessWidget {
  const FacebookSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.white,
      leading: const Icon(
        Icons.facebook_rounded,
        color: Colors.black,
      ),
      title: Text(
        'Continue with Facebook',
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.black,
            ),
      ),
      onTap: () {
        //TODO Open Facebook account api
      },
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.white,
      leading: const Icon(
        Icons.search_outlined,
        color: Colors.black,
      ),
      title: Text(
        'Continue with Google',
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.black,
            ),
      ),
      onTap: () {
        //TODO Open Google account api
      },
    );
  }
}
