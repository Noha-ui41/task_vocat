
// ABSTRACT CLASS
abstract class LibraryItem {
  String title;
  String id;

  LibraryItem(this.title, this.id);

  void displayInfo(); // must be implemented
}

// INTERFACE
abstract class Borrowable {
  void borrow();
  void returnItem();
}

// BOOK CLASS
class Book extends LibraryItem implements Borrowable {
  String author;
  bool _isAvailable = true;

  Book(super.title, super.id, this.author);

  // Getter
  bool get isAvailable => _isAvailable;

  // Setter
  set isAvailable(bool value) {
    _isAvailable = value;
  }

  @override
  void borrow() {
    if (_isAvailable) {
      _isAvailable = false;
      print("Book borrowed successfully");
    } else {
      print("Book is not available");
    }
  }

  @override
  void returnItem() {
    _isAvailable = true;
    print("Book returned successfully");
  }

  // Method Overloading (using optional parameters)
  void displayBookInfo({
    bool showAuthor = false,
    bool showAll = false,
  }) {
    if (showAll) {
      print("Title: $title, Author: $author, Available: $_isAvailable");
    } else if (showAuthor) {
      print("Title: $title, Author: $author");
    } else {
      print("Title: $title");
    }
  }

  @override
  void displayInfo() {
    displayBookInfo(showAll: true);
  }
}

// MAGAZINE CLASS
class Magazine extends LibraryItem {
  int issueNumber;

  Magazine(super.title, super.id, this.issueNumber);

  @override
  void displayInfo() {
    print("Magazine: $title, Issue: $issueNumber");
  }
}

// MEMBER CLASS
class Member {
  String name;
  String memberId;

  Member(this.name, this.memberId);

  void displayMember() {
    print("Member Name: $name, ID: $memberId");
  }
}

// BUILDER CLASS
class BookBuilder {
  String? _title;
  String? _id;
  String? _author;

  BookBuilder setTitle(String title) {
    _title = title;
    return this;
  }

  BookBuilder setId(String id) {
    _id = id;
    return this;
  }

  BookBuilder setAuthor(String author) {
    _author = author;
    return this;
  }

  Book build() {
    return Book(_title!, _id!, _author!);
  }
}

// CALLABLE CLASS
class BookSearch {
  List<Book> books;

  BookSearch(this.books);

  Book? call(String title) {
    for (var book in books) {
      if (book.title.toLowerCase() == title.toLowerCase()) {
        return book;
      }
    }
    return null;
  }
}

// LIBRARY MANAGEMENT
class Library {
  List<Book> books = [];
  List<Member> members = [];

  void addBook(Book book) {
    books.add(book);
  }

  void addMember(Member member) {
    members.add(member);
  }

  void displayBooks() {
    for (var book in books) {
      book.displayInfo();
    }
  }

  void displayMembers() {
    for (var member in members) {
      member.displayMember();
    }
  }
}


void main() {
  Library library = Library();

  // Create book using Builder
  Book book1 = BookBuilder()
      .setTitle("Clean Code")
      .setId("B1")
      .setAuthor("Robert C. Martin")
      .build();

  Member member1 = Member("Noha", "M1");

  library.addBook(book1);
  library.addMember(member1);

  print("=== Library Books ===");
  library.displayBooks();

  print("\n=== Library Members ===");
  library.displayMembers();

  print("\n=== Borrow & Return ===");
  book1.borrow();
  book1.returnItem();

  print("\n=== Display Book Info ===");
  book1.displayBookInfo();
  book1.displayBookInfo(showAuthor: true);
  book1.displayBookInfo(showAll: true);

  print("\n=== Search Book ===");
  BookSearch search = BookSearch(library.books);
  Book? foundBook = search("Clean Code");

  if (foundBook != null) {
    print("Book Found: ${foundBook.title}");
  } else {
    print("Book not found");
  }
}
