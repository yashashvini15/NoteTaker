# Note Taker Project

This project is a Note Taker application developed using Java 13, Hibernate, Servlets, and JSPs. It allows users to add, update, delete, and search notes through a web interface.

## Technologies Used

- Java 13
- Hibernate
- Servlets
- JSP (JavaServer Pages)
- Maven (for dependency management)

## Project Structure

The project structure includes the following main components:

- **Servlets:** Handle HTTP requests and manage communication between the frontend (JSP) and backend (Hibernate).
- **JSP Pages:** Provide the user interface for adding, updating, deleting, and viewing notes.
- **Hibernate:** Used for object-relational mapping (ORM) to interact with the database.
- **Persistence.xml:** Configuration file for Hibernate.
- **Maven:** Manages project dependencies and build.

## Setup Instructions

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yashashvini15/NoteTaker.git
   cd NoteTaker
2. **Set Up Database:**

-> Create a MySQL database named note_taker (or configure database details in persistence.xml).

3. **Build and Run:**

-> Open the project in IntelliJ IDEA.
-> Configure your servlet container (e.g., Tomcat) to run the application.
-> Run the application.

4. **Access the Application:**

-> Open your web browser and go to http://localhost:<port>/NoteTaker to access the application.

## Functionality

-> Add Note: Allows users to add a new note with a title and content.
-> Update Note: Enables editing of existing notes.
-> Delete Note: Deletes selected notes from the database.
-> Search Notes: Search notes by title or content keywords.

