import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance; // Authenatication
FirebaseFirestore firestore = FirebaseFirestore.instance; // Firebase storage
User? currentUser = auth.currentUser; // Fetching users data and checking

//collections - Users info
const userCollection = "users";

const postCollection = "post";

const productsCollection = "products";

const cartCollection = "cart";

const chatCollection = "chat";

const messagesCollection = "messages";

const ordersCollection = "orders";
