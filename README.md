# FurFound - A Platform to Reunite Lost Pets with Their Owners

FurFound is a web application designed to help reunite lost pets with their owners. Users can create accounts, post information about lost or found pets, and browse pet posts. Admins can oversee all users and manage posts. The application also provides features for adding pets to user profiles and reporting missing pets with an easy-to-use interface.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [Usage](#usage)
  - [User Roles](#user-roles)
  - [Pets Database](#pets-database)
  - [Posts](#posts)
  - [User Profile](#user-profile)
  - [Search Functionality](#search-functionality)
  - [QR Code Integration](#qr-code-integration)
- [Deployment](#deployment)
- [Tech Stack](#tech-stack)
- [Contributing](#contributing)
- [License](#license)

---

## Features
- **User Authentication with Devise**: Allows users to sign up, log in, and manage their accounts.
- **Admin Approval System**: Admins can approve user accounts before they become active.
- **Posts for Lost and Found Pets**: Users can create posts about lost and found pets, including details like name, breed, last seen, photo, and species.
- **Profile Page with Pets Section**: Users can add their pets to their profile, and if their pet goes missing, they can report it easily.
- **QR Code Integration**: Allows scanning to view specific pet information.
- **Report Notification Mailer**: Users will receive notifications from their email from their reported missing pets.


---

## Installation

### Prerequisites
Ensure you have the following installed on your system:
- [Ruby 3.0+](https://www.ruby-lang.org/en/downloads/)
- [Rails 7+](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/) or [SQLite](https://www.sqlite.org/index.html) (development only)
- [Node.js](https://nodejs.org/en/download/)
- [Yarn](https://classic.yarnpkg.com/en/docs/install/#windows-stable)
- [ImageMagick](https://imagemagick.org/script/download.php) (for image processing)
- Git

### Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/furfound.git
   cd furfound

2. **Install dependencies:** First, ensure that all gems and npm packages are installed.
   ```bash
   bundle install
   yarn install

3. **Database setup:** Set up your database by running the following commands:
   ```bash
   rails db:create
   rails db:migrate

4. **Set up ImageMagick for image processing:** Make sure ImageMagick is installed and configured. If you're using CarrierWave with MiniMagick, ensure it’s working with:
   ```bash
   sudo apt-get install imagemagick

5. **Run Rails Server**
   ```bash
   rails server / rails s

 6. **### Seed the Database:** After setting up your database, run the following command to seed it with a pre-made admin account:
    ```bash
    rails db:seed
    
## Admin Credentials
- Email: admin@test.com
- Password: furfoundadmin123!

## Running the Application

Open your browser and navigate to http://localhost:3000.
You can sign up as a regular user or log in as an admin if you've already created an account.
Explore the features such as adding pets, reporting missing pets, and posting lost or found pet notices.


## Usage
### User Roles
Regular Users: Default role. Users can add pets, report missing pets, and view posts. They must be approved by an admin before fully accessing the system.
Admins: Can manage users and approve accounts, delete or edit any post, and have additional access to features such as user searches.
Pets Database
Users can add pets to their profile, which includes fields such as:

- Name
- Breed
- Color
- Species
- Photo
- QR Code
From the pet profile, users can click a Report Missing button, which automatically generates a post for the lost pet in the system.

### Posts
The post system allows users to add details about their lost or found pets. Admins have full control over all posts, while regular users can only edit or delete their own.

### User Profile
Each user has a profile that displays their information:

- Profile Picture
- Phone Number
- Home Address
- 16-digit Account Number (First four digits represent month and year)

## QR Code Integration
When pets are reported missing, a QR code is generated that can be scanned to display the pet’s information on the show page. This allows quick access to the pet's details.


## Tech Stack

Frontend: HTML, CSS, Bootstrap, JavaScript, jQuery
Backend: Ruby on Rails, Devise (for authentication), Pundit (for authorization)
Database: PostgreSQL (production), SQLite (development)
Image Processing: CarrierWave with MiniMagick
Mailer: ActionMailer for sending approval and notification emails
Third-Party Services: Google OAuth for sign-up, Fly.io for deployment

## Sample Photos

![Home](https://github.com/user-attachments/assets/12e91de7-e142-42fe-9e64-3d92c6592276)
![UserProfile](https://github.com/user-attachments/assets/9eefa83b-8329-43f5-87a7-0b95d575d513)
![PetProfile](https://github.com/user-attachments/assets/cd0403b1-a59a-453c-a03d-00f270d83979)
![LostPets](https://github.com/user-attachments/assets/90843223-94ac-4f47-969c-bd213c636c0b)
![MissingPet](https://github.com/user-attachments/assets/1f4b034b-842b-418f-a772-13cb25ed7324)
![PetsOverview](https://github.com/user-attachments/assets/bd3af581-ab1d-4ddb-bcdd-6faac5bdb026)
![MissingPetInfo](https://github.com/user-attachments/assets/cefe0bf6-5952-43c8-8fd2-28255432160f)

## License
This project is licensed under the MIT License - see the LICENSE file for details.

Thank you for using FurFound! We hope this platform helps reunite pets with their owners.
