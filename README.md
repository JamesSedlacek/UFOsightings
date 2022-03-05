# UFO Sightings Take-Home Assignment

## Description
You are going to build an app that keeps track of U.F.O sightings.

You will be building an application that displays a list of all the users’ past UFO sightings. <br>
The application will also allow the user to add/delete sightings.  <br>
You will be extending this project with additional features in later stages. <br>
Please only implement the specified user-facing features below and nothing more.  <br>
If you have extra time consider refactoring your code and making  <br>
it easier to support other features ( DB, Server API etc). <br>

You may work using all the tools and reference materials that you are normally using.  <br>
You may use any 3rd party libraries, but be ready to justify their usage and explain  <br>
how they are actually working! We recommend keeping your project in source control,  <br>
making commits as often as you work. When you are done share the repository using  <br>
a zip file or any online Git account (Github/Bitbucket etc). <br>

Please don’t spend more than 3 hours on this portion of the project.  <br>
Please do not continue to work on your project after submitting it. <br>
Expected time: 2.5 hours

<hr>

## Requirements
- The application will display a list of UFO sightings. It will also support adding and deleting UFO sighting entries.
- Each sighting includes:
  - The data of the sighting
  - The time of the sighting (blob, lampshade, mysteriousLights
  - The speed at which the UFO was traveling
- Each sighting belongs in one of two categories according to its type. The blob and
lampshade types belong in the “Strange Flyers” category, and the mysteriousLights type
has its own category which is named after it - Mysterious Lights
- A tab/segmented control is shown at the top of the list to present each of the two
categories. Only sighings belonging to the selected tab/segment will be shown in the list
- The list of sightings should be stored in memory only. There is no persistence and no
records are fetched from a web service.
- A “+” button will allow adding UFO sightings
  - When tapped an entry with random attributes will be added to the in-memory list of sighings corresponding to the tab the user is on (i.e “Strange Flyers” or “Mysterious Light”). The displayed list will be updated in the UI
- Ability to remove an entry
  - When an entry in the displayed list of items is swiped, display a remove button
 
  - When the remove button is clicked/swiped, the selected entry will be removed from the in-memory list of entries and the displayed list will be updated accordingly.
- The application is the starting point of more features later in the interview. Structure your solution with a clear separation of concerns that it will be a sturdy foundation to build more features upon.
- Your application should match the provided design specification identically

<hr>

## Design
