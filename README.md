# Kafiil

## Overview

Kafiil is a registration and login system with profile management, country listing, and service discovery features. It includes a multi-step registration process, login functionality, and endpoints for fetching user profile data, countries, and services.

## Features

- **User Registration**:
  - Multi-step registration form with dynamic data.
  - First Screen: Basic user information (Name, Email, Password, User Type).
  - Second Screen: Additional details (Avatar, About, Salary, Birth Date, Gender, Skills, Favorite Social Media).

- **User Login**:
  - Simple login form with email and password fields.

- **Profile Page**:
  - Fetch and display user profile information.

- **Countries**:
  - Paginated list of countries.

- **Services**:
  - List of services and popular services.

## Demo

Here’s a demonstration of how the Kafiil application works:

<img src="screen_shots/kafiil.gif" alt="Kafiil Demo" width="300" height="500">

*Note: Replace `path/to/your/demo.gif` with the actual path to your GIF file.*

## API Endpoints

- **Registration**:
  - `POST /api/register` - Submit registration data.
  
- **Login**:
  - `POST /api/login` - Submit login credentials.
  
- **Profile**:
  - `GET /api/whoami` - Retrieve user profile data.
  
- **Countries**:
  - `GET /api/countries` - Retrieve paginated list of countries.
  
- **Services**:
  - `GET /api/services` - Retrieve list of services.
  - `GET /api/popular-services` - Retrieve list of popular services.
