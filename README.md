ss-cucumber
===========

Cucumber.js integration for SocketStream

Installation
---

    npm install ss-cucumber

Usage
---

To seed your SocketStream application with the files and folders required for using Cucumber:

    cd [socketstream app directory]
    ss-cucumber init


You'll want to edit the support/world.js and replace INSERT_URL_HERE with the url at which your Socketstream application loads (i.e. http://localhost:3000).

You'll notice a socketstream_steps.js file in the step_definitions directory. This provides a list of step definitions to use with your application out of the box. You can create feature files that use these steps to drive the selenium browser.

If you haven't got cucumber.js installed already:

    npm install -g cucumber

And run:

    cucumber.js

This will run cucumber.js against your application via a selenium client. For more information behind all of this, see [my blog post](http://paulbjensen.co.uk/posts/2012/07/24/testing-socketstream-apps-with-cucumber).

Step definitions available
---

* I am on the homepage
* I follow "link text"
* I fill in "field_name" with "value"
* I press "button text"
* I should see "web page text"

There will be more added over time. This is just a start for now. If you have any that you'd like to see, send me a message, or feel free to fork this branch and make a pull request.

License & Credits
---

&copy;2012 Paul Jensen. Licensed under the MIT License.