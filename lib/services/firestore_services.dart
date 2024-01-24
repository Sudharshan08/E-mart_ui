import 'package:emart_app/consts/consts.dart';

class FirestoreServices {
//get users data
  static getUser(uid){
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }

  //get products according tocategory

  static getProducts(category){
    return firestore.collection(productsCollection).where('p_category',isEqualTo: category).snapshots();
  }

  //get cart 
  static getCart(uid){
    return firestore.collection(cartCollection).where('added_by', isEqualTo: uid).snapshots();
  }

  //delete from cart screen 
  static deleteDocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }

}