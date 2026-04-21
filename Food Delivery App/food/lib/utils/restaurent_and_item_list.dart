import 'package:food/models/category_model.dart';
import 'package:food/models/restaurant_model.dart';

class RestaurantAndItemList {
  RestaurantAndItemList._();

  static List<RestaurantModel> restaurantList = [
    RestaurantModel(
      title: 'Rose Garden Restaurants',
      itemList: 'Burger - Chicken - Rich - Wings',
      imageUrl: 'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=500',
    ),
    RestaurantModel(
      title: 'Spicy Hub',
      itemList: 'Pizza - Pasta - Sandwich',
      imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500',
    ),
    RestaurantModel(
      title: 'Food Corner',
      itemList: 'Burger - Fries - Nuggets',
      imageUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=500',
    ),
    RestaurantModel(
      title: 'Italiano Express',
      itemList: 'Pizza - Lasagna - Pasta',
      imageUrl: 'https://images.unsplash.com/photo-1528605248644-14dd04022da1?w=500',
    ),
    RestaurantModel(
      title: 'BBQ Nation',
      itemList: 'BBQ - Grill - Steak',
      imageUrl: 'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDh8fHJlc3RhdXJhbnR8ZW58MHx8MHx8fDA%3D',
    ),
    RestaurantModel(
      title: 'Desi Flavors',
      itemList: 'Rice - Curry - Biriyani',
      imageUrl: 'https://plus.unsplash.com/premium_photo-1673108852141-e8c3c22a4a22?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cmVzdGF1cmFudHxlbnwwfHwwfHx8MA%3D%3D',
    ),
    RestaurantModel(
      title: 'Fast Feast',
      itemList: 'Burger - Pizza - Cold Drinks',
      imageUrl: 'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHJlc3RhdXJhbnR8ZW58MHx8MHx8fDA%3D',
    ),
    RestaurantModel(
      title: 'Cafe Delight',
      itemList: 'Coffee - Cake - Snacks',
      imageUrl: 'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?w=500',
    ),
    RestaurantModel(
      title: 'Ocean Taste',
      itemList: 'Fish - Prawn - Crab',
      imageUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTd8fHJlc3RhdXJhbnR8ZW58MHx8MHx8fDA%3D',
    ),
    RestaurantModel(
      title: 'Street Bites',
      itemList: 'Fuchka - Chotpoti - Roll',
      imageUrl: 'https://plus.unsplash.com/premium_photo-1676310055316-d73c9d5eeb51?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTh8fHJlc3RhdXJhbnR8ZW58MHx8MHx8fDA%3D',
    ),
  ];

  static List<CategoryModel> categoryList = [
    CategoryModel(
      title: "Pizza",
      imageUrl: "https://img.freepik.com/free-psd/delicious-pepperoni-pizza-culinary-delight_632498-24206.jpg?semt=ais_hybrid&w=740&q=80",
    ),
    CategoryModel(
      title: "Burger",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShlVZ2iOsr0lr_tWqMaNwuHefUjjdkXuA6ag&s",
    ),
    CategoryModel(
      title: "Fried Chicken",
      imageUrl: "https://img.freepik.com/free-psd/crispy-fried-chicken-bucket-delicious-treat_191095-86006.jpg?semt=ais_hybrid&w=740&q=80",
    ),
    CategoryModel(
      title: "Pasta",
      imageUrl: "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDI0LTA2L2FuZ3VzdGVvd19wYXN0YV9ib3dsX3dpdGhfaW5ncmVkaWVudF9pbl9zdHlsZV9vZl90b3Bkb3duX3Nob3Rfb19jNGFjZDE3Yy00MmNkLTRhODUtOTA4ZC1kNzY2NmFkNTg0MWQucG5n.png",
    ),
    CategoryModel(
      title: "Sandwich",
      imageUrl: "https://img.freepik.com/free-photo/sandwich_1339-1108.jpg?semt=ais_hybrid&w=740&q=80",
    ),
    CategoryModel(
      title: "Coffee",
      imageUrl: "https://png.pngtree.com/png-clipart/20240810/original/pngtree-flying-cup-of-coffee-with-splash-and-png-image_15739217.png",
    ),
    CategoryModel(
      title: "Ice Cream",
      imageUrl: "https://static.vecteezy.com/system/resources/previews/044/570/761/non_2x/assortment-of-colorful-ice-cream-scoops-in-waffle-cones-with-fresh-fruits-on-a-transparent-background-png.png",
    ),
    CategoryModel(
      title: "Biriyani",
      imageUrl: "https://img.freepik.com/free-psd/delicious-chicken-biryani-bowl_632498-25547.jpg?semt=ais_hybrid&w=740&q=80",
    ),
    CategoryModel(
      title: "Seafood",
      imageUrl: "https://w7.pngwing.com/pngs/410/683/png-transparent-plate-of-seafood-seafood-lobster-crab-boston-lobster-meal-food-animals-recipe-thumbnail.png",
    ),
    CategoryModel(
      title: "Dessert",
      imageUrl: "https://img.freepik.com/free-psd/delicious-raspberry-chocolate-ice-cream-sundae_632498-24987.jpg?semt=ais_hybrid&w=740&q=80",
    ),
  ];
}