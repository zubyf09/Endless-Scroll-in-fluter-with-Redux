# UpDay Assignemnt

Please implement an app that fetches pictures from the [Shutterstock API](http://api.shutterstock.com/) and displays them in an infinite scrollable view. You can review [API documentation](https://developers.shutterstock.com/api/v2).
Please use the search endpoint of *Shutterstock*, making sure that new pictures will be fetched and shown when the user scrolls to the end of the list.


## Solution
I've used the search endpoint of *Shutterstock* to fetch pictures. As per requirement pictures are fetched and shown when the user scrolls to the end of the list.

I've implemented mobile end solution only, backend was already implemented by *Shutterstock*. 

I've used [**Redux**](https://blog.novoda.com/introduction-to-redux-in-flutter) pattern for app architecture because of following reasons: 

*  Ability to insert a middleware to log the different actions, By simply adding reference of the middleware method when initializing the Store.
*  Redux allows to centralize the management of a State,Reducers can perform the transition from one state to another
*  It forces the developer to structure the application in terms of “Event -> Action -> Model -> ViewModel -> View”.
As well as Redux have some pros it has some cons too. Like
*  One single Store and a huge State
*  Use of top-level functions/methods
*  Too many “if … then” comparisons at both reducers and middlewares levels
*  Too many rebuilds on each state changed

## Conclusions 
I am not restricting on Redux for every application. All Patterns (Redux,Provider,Bolc,etc...) 
have advantage and disadvantages too, So my understanding is, You can write a perfect scalable code if you have complete understanding of any of 
Patten(Bloc,Redux,Provider etc....) architecture and implementations.

 
## App Screenshot
[https://github.com/zubyf09/upday_assignment/blob/master/Screenshot%202019-07-06%20at%205.57.41%20PM.png]

## External Libraries 
* ###  [Reselect](https://pub.dev/packages/reselect)
    I have to search images so in order to find data from AppState, I Used reslect because it help us to find data easily by filleting  the AppState. 
    
## Additional Extra Time on Project.

If I had to spend extra time, then I would write unit/widget tests.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.

## CV LINK
[CV_Muhammad Zubair]( https://drive.google.com/file/d/1HT1ummSIS9TdjRVakr_Q8pEFVS4zPOTy/view?usp=sharing)

## License
[MIT](https://choosealicense.com/licenses/mit/)


[Reflectly hero image]: https://i.dailymail.co.uk/i/pix/2015/09/01/18/2BE1E88B00000578-3218613-image-m-5_1441127035222.jpg


## References
* [https://medium.com/flutter-community/let-me-help-you-to-understand-and-choose-a-state-management-solution-for-your-app-9ffeac834ee3]
* [https://www.didierboelens.com/2019/04/bloc---scopedmodel---redux---comparison/]
* [https://apolofer.wordpress.com/2019/01/03/state-management-redux-vs-bloc/]
* [https://blog.novoda.com/introduction-to-redux-in-flutter/]