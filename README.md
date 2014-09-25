# Music Pitcher Application

This web application allows a user to sign in as an administrator, add new
songs, select from a list of songs to "pitch" them to potential clients,  and email,
that "pitch" to potential clients.
The email contains a link to a dynamically created page with the selected song(s).
In addition to selecting songs, the admin can add/edit/delete songs in the song library.

## Example Use:
Administrator logs into the site.  Clicks on the "New Pitch" button and constructs
a pitch containing:
* the client the admin is pitching to
* notes about this particular pitch
* the email address to which the pitch will go
* the email subject and message
* and finally, the song(s) that will be included in the pitch

After the pitch is created, the application will send an email to the client
containing a link to the site and a list of songs in the pitch.  When the client visits
the site for the first time, a flag is set that the admin can see (it's useful to
know if the client has listened to the songs).

## Key Technologies used
* AWS S3 for song catalog storage (with carrierwave and fog)
* Postmark for email service to clients

## Contributors
Bob Paterno

## Credits
AdminLTE for template

## License
The MIT License (MIT)

Copyright (c)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
