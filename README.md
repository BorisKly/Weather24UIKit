WeatherApp


WeatherApp is a simple iOS application built using the classical MVC (Model-View-Controller) architecture.
The app fetches weather information for a given location using latitude and longitude coordinates entered by the user. 
The weather data is fetched through a network request and displayed on the screen.

Architecture
The app is structured following the MVC pattern:
Model: The model handles weather data, parsing the JSON response from the network.
View: The view is responsible for displaying the user interface, including text fields for user input and a label to display weather data.
Controller: The controller manages user interactions, coordinates with the model to fetch data, and updates the view with the fetched weather information.

<img width="366" alt="Screenshot 2024-09-21 at 22 47 30" src="https://github.com/user-attachments/assets/b0b4bd56-1573-4289-8467-b6f33bce0660">
