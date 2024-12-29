import 'package:flutter_dotenv/flutter_dotenv.dart';

// Box keys
const categoriesBox = 'category_box';
const budgetsBox = 'budget_box';
const transactionsBox = 'transaction_box';
const accountsBox = 'account_box';

//
var supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
var supabaseKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
var serverClientId = dotenv.env['SERVER_CLIENT_ID'];
