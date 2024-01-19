

import 'package:tsec_hack/consts/firebase_const.dart';

class FirestoreServices {
  //getting user data
  static getUser(uid){
    return firestore.collection(userCollection).where('id',isEqualTo: uid).snapshots();
  }
  static getPost(){
    return firestore.collection(postCollection).snapshots();
  }
  static getProducts(category){
    return firestore.collection(productsCollection).where('p_category',isEqualTo: category).snapshots();
  }
  static getSubCategoryProducts(title){
    return firestore.collection(productsCollection).where('p_subcategory',isEqualTo: title).snapshots();
  }

  static getCart(uid){
    return firestore.collection(cartCollection).where('added by',isEqualTo: uid).snapshots();
  }
  static deleteDocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  static getChatMessages(docId){
    return firestore.collection(chatCollection).doc(docId)
        .collection(messagesCollection).orderBy("created_on",descending: false).snapshots();
  }

  static getAllOrders() {
    return firestore.collection(ordersCollection).where('order_by',isEqualTo: currentUser!.uid).snapshots();
  }

  static getWishlists(){
    return firestore.collection(productsCollection).where('p_wishlist',arrayContains: currentUser!.uid).snapshots();
  }

  static getAllMessages(){
    return firestore.collection(chatCollection).where('fromId',isEqualTo: currentUser!.uid).snapshots();
  }

  static getCounts() async{
    var res=await Future.wait([
      firestore.collection(cartCollection).where('added_by',isEqualTo: currentUser!.uid).get().then((value){
        return value.docs.length;
      }),
      firestore.collection(productsCollection).where('p_wishlist',arrayContains: currentUser!.uid).get().then((value){
        return value.docs.length;
      }),
      firestore.collection(ordersCollection).where('order_by',isEqualTo: currentUser!.uid).get().then((value){
        return value.docs.length;
      }),
    ]);
    return res;
  }

  static allProducts(){
    return firestore.collection(productsCollection).snapshots();
  }

  static getFeaturedProducts(){
    return firestore.collection(productsCollection).where('is_featured',isEqualTo: true).get();
  }

  static searchProducts(title){
    return firestore.collection(productsCollection).get();
  }
}