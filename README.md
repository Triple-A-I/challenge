# limitless

Simple add to cart project with flutter and firebase.

## Getting Started

I used firebase as a server, I added products manually to firestore to focus on main feature in the task,
which is add to cart request.

## Procedure to build the app
Just clone the project, run the pub get, and it will work.

# Main Architecture
I used simply futurebuilder due to the simplicity of the task, but if it is a apart from large project,
I will use provider or bloc to track and handle states successfully.
you can see implementing bloc in my TimerApp with bloc https://github.com/albraa-abdalla/Timer-App-with-Bloc.

As I said, I used something manullay, like using userId cause I didn't Used login and Firebase Authentication.
the field userId in productsInCart collection is for fetching cart products for specific user, but here I have only one user.
