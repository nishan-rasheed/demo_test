class CartModel {

  String name;
  num price;
  String description;
  num qty;
  String image;

    CartModel({
      required this.name,
      required this.price,
      required this.description,
      required this.qty,
      required this.image,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) =>CartModel(
      name: json['name'], 
      price: json['price'],  
      description:json['description'],  
      qty: json['qty'],
      image:json['image'],);
        


}