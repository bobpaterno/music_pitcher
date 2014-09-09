# User logs into website
As an user
In order to keep my activity proprietary
I want to securely log in

Usage
* User visits user site login page
* User enters username and password
* User logs into secure website

Acceptance Criteria
* Invalid username and password are rejected
* user page URLs are not accessible unless logged in


# User selects from menu options
As an user
In order to navigate to pitch or add songs
I want to see a menu with those options

Usage
* User sees a menu with two links
  - Pitch Song
  - List Song

Acceptance Criteria
* User is logged in
* If user is not logged in, this page will display not authorized
* Pitch song option leads to the Pitch Song new page
* List song option leads to the List Song index page


# User goes to Pitch Song page
As an user
In order to create a dynamically generated song list
I want to fill out a form on the Pitch Song page

Usage
* User selects from a list of songs in a select box, or
* User selects by clicking a song in the select box, or
* User types the name of a song in a search above select box
* User fills in email address of pitch-ee
* User fills in contents of email subject and body
* User fills in the "notes about pitch" field
* User clicks Send button and email is sent to the pitch-ee

Acceptance Criteria
* User is logged in, if not, page will display not authorized
* User must select at least one song
* User must fill in a valid email address
* User must fill in something for the subject field
* User must fill in something for the body field
* User may optionally fill in the "notes about pitch" field
* Database must save the time and date of the pitch
* A record of the song list and corresponding notes/subject/body fields

