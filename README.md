# Fetch Rewards iOS Coding Challenge - RecipeBrowser (Desserts)

This is a coding challenge for Fetch Rewards iOS Engineer Apprenticeship

APIs utilized:
https://themealdb.com/api.php

## Table of contents

- [Overview](#overview)
  - [The Challenge](#the-challenge)
  - [Screenshots](#screenshots)
  - [Built with](#built-with)

## Overview

### The Challenge

2 endpoints were utilized for this challenge:<br>
https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the list of meals in the Dessert category.
https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its ID.

Users should be able to:

- View the list of meals in the Dessert category, sorted alphabetically
- Select a meal and be taken to a detail view that includes:
  - Meal name
  - Instructions
  - Ingredients/measurements
 
Guidelines:

- Asynchronous code must be written using Swift Concurrency (async/await).
- Be sure to filter out any null or empty values from the API before displaying them.
- App should be user friendly and should take basic app design principles into
account.
- Your project should compile using the latest version of Xcode.

### Screenshots

<table>
  <tr>
    <td><img src="https://i.imgur.com/2Hnjjeo.png" width="300"></td>
    <td><img src="https://i.imgur.com/8ahozek.png" width="300"></td>
    <td><img src="https://i.imgur.com/BLG3KbS.png" width="300"></td>
  </tr>
  <tr>
    <td>Entry Page</td>
    <td>Meal List</td>
    <td>Meal Details</td>
  </tr>
</table>

### Built with

- [SwiftUI](https://developer.apple.com/xcode/swiftui/) - Apple iOS Framework
