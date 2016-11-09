# README

CMPT276: MixBook Application
Requirements and Specification Document
11/07/2016, Version 0XFF000000
Rafael Pena, Sen Lin, Yongzhe Le,
Braden Emerson, Kevin Chung

1. Abstract:

  MixBook is a web application whose primary purpose is to allow users to find mixed drink recipes
based on ingredients that they already own. Users will input those ingredients and MixBook will
find appropriate mixed drink recipes that require as few other ingredients as possible. In addition,
this application will feature user logins that can be used to rate, favorite, and comment on drinks,
receive drink recommendations based on both your ratings and the ratings of others, publish your
own recipes, and personalize a profile page. Within this profile page will be your favorited and
published drinks, along with an uploaded image. All in all, MixBook is designed to be an easy way
for one to find new drinks they did not know they could make, but also has the added benefit of
allowing users to connect with others on the drinks they enjoy.

2. Customers:

  This system will help users save time by not needing to rely on google and finding recipes from
there. Users will also not need to know the recipes by heart. The target audience for MixBook will
be primarily alcohol connoisseurs, casual drinkers and possible bartenders.

3. Competitive Analysis:

  MixBook will be a platform in which finding recipes for alcoholic drinks has never been easier.
Without using such a system, users will have to resort to google searches which prove to be
inefficient when trying to search by multiple ingredients. Recipes for drinks may also vary for
different websites. Having a centralized database may help solve this problem.

  Similar systems of finding food recipes based on what was in your refrigerator can be found easily
on the internet. However, finding alcoholic drink recipe combiners of this kind is lacking and only
one or two can be found from using a simple google search. To add to this, the functionality of
these websites serve only as a search engine rather than also as a social network of sorts. MixBook
will remedy this problem in a Facebook-Esque fashion in which "liking and "disliking" of recipes
can be shown in a profile page. This Profile page will serve as a personal wallpage in which friends
and family can see what kinds of alcoholic drinks a user might like or dislike and act upon that
information. If the user is in a curious mood, they may check their favorite drinks page which
comprises of drinks that they have made and rated. Here, the user is given recommendations based
on their personal tastes and also based on popular ratings.

4. User Stories:

Signup:

  My friend just told me about this site and am very interesting in using it to its full potential. Signing
up should be a quick and minimal so I can use its services immediately. A user friendly interface
would be a good idea. (Iteration1)

Login:

  I already have an account, and I would like to continue using the service. I will provide the correct
email that I used to create the account, and I also would provide the correct matching password to
my corresponding email/username.
Error conditions: wrong email format, email/username, and wrong password to the corresponding
account.

Signup:

  My friend just told me about this site and am very interesting in using it to its full potential. Signing
up should be a quick and minimal so I can use its services immediately. A user friendly interface
would be a good idea.
Error conditions: wrong email format, email/username not unique, and password does not match
it’s confirmation, password is too short/long

Change email/password:

  I would like to change my email and password. I will provide the old password to check my
credentials, and provide the new password I would like to use, and verify that new password. I will
provide a new email that will substitute my old email address.
Error condition: wrong email address format, wrong original password, and new password
confirmation does not match.

View/Edit profile:

  I want people to know about me. As an admin, I would want people to know by having something
indicated by my username.

Admin:

  Admins should be the only people that can change/have access the user database. Here, the
admin is allowed to do whatever they deem necessary to fix the system.
Error Condition: User is not an admin, admin is not logged in

Search function:

  I would like to explore the different kinds of drinks. I want a search bar that would suggest
recipes depending on my input to the search box.
Error conditions: results not found

“About us” page:

  I would like to know what this site is about, and the credit to other resources.
  
For future Iterations:

1. Publish: The Ability for users to publish own recipe
2. Display: Display recipes that are published by users
3. Like/Dislike: The ability rate the recipe
4. Modify the user interface of the site
5. Ability for admins to create other admins.

