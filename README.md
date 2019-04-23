# PickAPlace

### App Description
Users will be able to choose from a list of different types of locations (food, bars, entertainment, etc.)
The app will recommend 5 places based on settings and preferences sich as distance and reviews.
The user will select 3 of the 5 places where they would be interested in going and the app chooses one of those

### App Idea Evaluation
- Mobile:
  Very useful when deciding on the next place to go during a night out, or when exploring an unfamiliar city
- Story:
  Removes the challenge of deciding where to go for the night
- Market:
  This app appeals to anyone who enjoys going out for the night and trying new things
- Habit:
  app will most likely be used once a week on weekends when people are trying to find a new place to go to, or when visiting a new place
- Scope:
  Focuses on making it easier to decide where to go for the night

---

### Required User Stories
- [X] User can choose what they are looking for (food, attractions, etc.)
- [X] User is given five options
- [X] User can choose 3
- [X] User is shown the detailed place
- [X] User can see a detailed description of each location
- [X] App can retrieve user location
- [X] App can recommend locations to the user based on criteria
- [X] App can use external APIs


### Optional Stories
- [X] User can change search parameters
- [ ] User can set favorites
- [ ] User can ignore locations already visited
- [X] User can message friends the chosen location
- [X] User can see a map and get directions to the location
- [ ] User can refresh recommendations
- [ ] Add a better looking UI

---


### Screens

#### Navigation Tabs

##### Home
- Selection Screen to choose which category
- Location Screen to grab location
- Radius Screen to grab the user's radius they want to travel
- Parameters Screen for filtering
- Selection Screen to show five randomly chosen places
- Detail Screen to see more details on the five places
- Chosen Screen to show the reccommended place for the user

##### Preferences
- User settings for saving parameter settings and favorite places

##### Nearby
- Nearby Screen which shows all nearby places

---

### Wireframes
[Link to Basic Wireframe](https://github.com/keithatan/PickAPlaceiOS/blob/master/BasicWireframe.pdf)


### Schema
---
#### Models
Businesses

| Property     | Type    | Desctiption                                 |
|--------------|---------|---------------------------------------------|
| objectID     | String  | Unique ID for the location                  |
| name         | String  | Name of business                            |
| isClosed     | boolean | is the business currently closed            |
| phoneNumber  | int     | phone number for business                   |
| businessType | String  | type of business (restaurant, coffee, etc.) |
| URL          | URL     | URL of business website                     |
| image        | URL     | background image for business               |
| address      | String  | address of business                         |
| price        | String  | price range of business                     |
| rating       | int     | rating out of 5 for business                |
| distance     | double  | distance to business from current location  |

#### Networking

##### Foursquare API
- Base URL: https://api.foursquare.com/v2/

| Type         | URL                       | Description                                 |
|--------------|---------------------------|---------------------------------------------|
| GET          | /search/recommendations/  | Gets events, venues, places in an area      |

##### Yelp API
- Base URL: https://api.yelp.com/v3/

| Type         | URL                 | Description                                 |
|--------------|---------------------|---------------------------------------------|
| GET          | /businesses/search  | Gets all businesses                         |


---

### Progress GIFs
<img src='https://github.com/pickaplace-ios/PickAPlaceiOS/blob/master/PickAPlaceiOSP1.gif?raw=true' title='PickAPlace Walkthrough' width='' alt='Video Walkthrough' />

---

### App Pitch Presentation
// TODO: Add link to Pitch Presentation Deck
