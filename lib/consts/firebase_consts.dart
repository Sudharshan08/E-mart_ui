import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

//collections

const usersCollection = "users";

const productsCollection = "products";
const chatsCollection = "chats";
const messagesCollection = "messages";
const cartCollection = "cart";

const ordersCollection = "orders";
