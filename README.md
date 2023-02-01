# SpotifyLite

A lightweight spotify album/artist searching app.


## Features
### Login

The SpotifyLite app will let you login using your Spotify account. Its hooked up to my own Spotify Web API account. .
To get started, you'll need to click the "Get started" button on the first page. This'll open an InAppWebView which'll
let you sign in to your spotify. To cancel, you can click on the little green button on the top right.

### Main Screen

Once signed in, you'll see a searchfield that you can use to enter your search terms. Enter a value in there and 
submit to get the results. Once retrieved, you should see a list of search results return.

There are two tags on top which will let you flick between albums and artists. The search only returns 10 results, but should
let you scroll if the screen is too small.