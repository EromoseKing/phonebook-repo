import 'dart:io';
import 'package:phonebook/phonebook.dart';

void main() {
  print('\u{260F} Phonebook \u{260F}');
  print('Press 1 to create a new contact\nPress 2 to Edit existing contacts');
  print('Press 3 to Search for contacts\nPress 4 to Delete contacts');
  print('Press 5 to Display all contacts');
  print('Press 0 to close phonebook\n');

  int? entry = int.tryParse(stdin.readLineSync()!);

  do {
    while (entry == null) {
      print('No option detected!!!');
      entry = int.tryParse(stdin.readLineSync()!);
    }

    if (entry == 0) {
      print('Thank you for using this application');
      break;
    }
    var contact = PhoneBook();

    switch (entry) {
      case 1:
        contact.createContact();
        print('New contact successfully created\n');
        break;
      case 2:
        contact.editContact();
        break;
      case 3:
        contact.searchContact();
        break;
      case 4:
        contact.deleteContact();
        break;
      case 5:
        contact.displayContacts();
        break;
      default:
        print('Invalid input!\n');
    }
    print('What do you want to do next?\n');
    print('Press 1 to create a new contact\nPress 2 to Edit existing contacts');
    print('Press 3 to Search for contacts\nPress 4 to Delete contacts');
    print('Press 5 to Display all contacts');
    print('Press 0 to close phonebook\n');

    entry = int.tryParse(stdin.readLineSync()!);
    while (entry == null) {
      print('No option detected!!!');
      entry = int.tryParse(stdin.readLineSync()!);
    }
  } while (entry != 0);
}

// class PhoneBook {
//   // Map declaration to store contacts information
//   static Map<String, String> contactList = {};

//   void createContact() {
//     // Taking contact name from user
//     print('Create a new contact\nEnter contact name');
//     var contactName = stdin.readLineSync()!;
//     while (contactName.isEmpty) {
//       print('Contact name is a required field\nEnter contact name');
//       contactName = stdin.readLineSync()!;
//     }

//     // Taking contact phone number from user
//     print('Enter contact phone number');
//     var phoneNumber = stdin.readLineSync()!;
//     while (phoneNumber.isEmpty || phoneNumber.length != 11) {
//       print(
//           'Phone number is a required field\nEnter contact phone number (11 digits)');
//       phoneNumber = stdin.readLineSync()!;
//     }

//     // Ensuring only digits are entered by the user
//     int? number = int.tryParse(phoneNumber);
//     while (number == null) {
//       print('Enter a valid number!!!');
//       phoneNumber = stdin.readLineSync()!;
//       String numberCheck = phoneNumber.toString();
//       while (numberCheck.length != 11 || numberCheck.isEmpty) {
//         print('Enter a valid contact phone number (11 digits)!');
//         phoneNumber = stdin.readLineSync()!;
//         numberCheck = phoneNumber.toString();
//       }
//       number = int.tryParse(phoneNumber);
//     }

//     // Saving contact information to the map collection
//     contactList[contactName] = phoneNumber;
//   }

//   void editContact() {
//     print('Edit existing contacts\nEnter contact name');
//     // Checks for invalid user entry
//     var searchEntry = stdin.readLineSync()!;
//     while (searchEntry.isEmpty) {
//       print('Enter a search entry');
//       searchEntry = stdin.readLineSync()!;
//     }

//     // Searches the map for user entry and gives edit options if entry found
//     if (contactList.containsKey(searchEntry)) {
//       print('0 - Edit name \n1 - Edit phone number');
//       var edit = int.tryParse(stdin.readLineSync()!);
//       while ((edit == null) || (edit.isNegative) || (edit > 1)) {
//         print('Invalid input');
//         edit = int.tryParse(stdin.readLineSync()!);
//       }

//       // Edit contact name
//       if (edit == 0) {
//         print('Enter a new contact name');
//         var newName = stdin.readLineSync()!;
//         while (newName.isEmpty) {
//           print('Invalid input. Try again');
//           newName = stdin.readLineSync()!;
//         }
//         contactList[newName] = contactList[searchEntry]!;
//         contactList.remove(searchEntry);
//         print('Contact name successfully updated');
//       }

//       // Edit contact phone number
//       else if (edit == 1) {
//         print('Enter a new phone number');
//         var newNumber = stdin.readLineSync()!;
//         while (newNumber.isEmpty || newNumber.length != 11) {
//           print(
//               'Phone number is a required field\nEnter contact phone number (11 digits)');
//           newNumber = stdin.readLineSync()!;
//         }

//         // Ensures digits and digits alone are the input entry
//         int? number = int.tryParse(newNumber);
//         while (number == null) {
//           print('Enter a valid phone number!!!');
//           while (number.toString().length != 11) {
//             print('Must');
//           }
//           newNumber = stdin.readLineSync()!;
//           String numberCheck = newNumber.toString();
//           while (numberCheck.length != 11 || numberCheck.isEmpty) {
//             print('Enter a valid contact phone number (11 digits)!');
//             newNumber = stdin.readLineSync()!;
//             numberCheck = newNumber.toString();
//           }
//           number = int.tryParse(newNumber);
//         }
//         contactList[searchEntry] = newNumber;
//         print('Contact number successfully updated');
//       }
//     }

//     // Output if contact search entry not found
//     else {
//       print('Contact not found');
//     }
//   }

//   void searchContact() {
//     print('Search for contacts');
//     print('Enter contact name or index letter');

//     // Taking user input
//     var searchEntry = stdin.readLineSync();
//     while (searchEntry == null) {
//       print('Enter a search entry');
//       searchEntry = stdin.readLineSync();
//     }

//     // Searches for a specific user input and display the contact information
//     if (searchEntry.length > 1) {
//       if (contactList.containsKey(searchEntry)) {
//         print('Name: $searchEntry\nPhonenumber:${contactList[searchEntry]}');
//       } else {
//         print('Contact not found!');
//       }
//     } else {
//       // Searches and display all contacts with the index input of user
//       int x = 1;
//       for (var i in contactList.entries) {
//         String indexSearch = i.key;
//         if (indexSearch[0] == searchEntry) {
//           print('$x Name: ${i.key}\n  Phonenumber: ${i.value}\n');
//         }
//         ++x;
//       }
//     }
//   }

//   void deleteContact() {
//     print('Delete contact information');
//     print('0- Delete all contacts\n1- Search and delete a contact');
//     print('9- Return to main menu');

//     // Takes option entry information from user
//     int? entry = int.tryParse(stdin.readLineSync()!);
//     while (entry == null) {
//       print('Enter a valid input!\n');
//       entry = int.tryParse(stdin.readLineSync()!);
//     }

//     // Tests entry with a number of cases
//     switch (entry) {
//       case 0:
//         print('Are you sure you want to delete all contacts?');
//         print('This action cannot be undone!!!\n');
//         print('\tno       yes');
//         String? noYes = stdin.readLineSync();
//         while (noYes == null) {
//           print('Enter a valid input string\nno         yes');
//           noYes = stdin.readLineSync();
//         }
//         if (noYes.toUpperCase() == 'NO' || noYes.toLowerCase() == 'no') {
//           deleteContact();
//         } else if (noYes.toUpperCase() == 'YES' ||
//             noYes.toLowerCase() == 'yes') {
//           contactList.clear();
//         }
//         break;
//       case 1:
//         print('Enter contact name');
//         String? entry = stdin.readLineSync();
//         while (entry == null) {
//           print('Invalid input!');
//           entry = stdin.readLineSync();
//           if (contactList.containsKey(entry)) {
//             contactList.remove(entry);
//           } else {
//             print('Contact not found!');
//           }
//         }
//         break;
//       case 9:
//         break;
//       default:
//         print('Invalid input please try again');
//     }
//   }

//   void displayContacts() {
//     // Displays all contacts information
//     print('Display all contacts');
//     int x = 1;
//     for (var i in contactList.entries) {
//       print('$x Name: ${i.key}\n  Phonenumber: ${i.value}\n');
//       ++x;
//     }
//   }
// }
