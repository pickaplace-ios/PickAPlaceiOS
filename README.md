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
1. User can choose what they are looking for (food, attractions, etc.)
2. User is given five options
3. User can choose 3
4. User is shown one
5. User can see a detailed description of each location
5. App can recommend locations to the user based on criteria

### Optional Stories
1. Settings tab where user can change search parameters
2. User can set favorites
3. User can ignore locations already visited
4. User can message friends the location from within the app
5. User can see a map and directions to the location
6. User can refresh recommendations
7. Add a better looking UI

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

##### Yelp API
- Base URL: https://api.yelp.com/v3/

| Type         | URL                 | Description                                 |
|--------------|---------------------|---------------------------------------------|
| GET          | /businesses/search  | Gets all businesses                         |


---

### App Pitch Presentation
// TODO: Add link to Pitch Presentation Deck
