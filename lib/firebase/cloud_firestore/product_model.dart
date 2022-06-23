

class ProductModel{
  final String? name;
  final String? price;
  ProductModel(this.name,this.price);

  Map<String,dynamic> toMap(){
    return {
      "name":this.name,
      "price":this.price,
    };
  }
}