# README

# Ruby on Rails Iterable.com Integration
# Web-Based Event Trigger and Email Notification System

This Ruby on Rails (RoR) application allows users to trigger two types of events (Event A and Event B) associated with a user in iterable.com. Additionally, the application integrates with the iterable.com API to send email notifications for Event B.

## Getting Started

Follow the steps below to clone the repository and set up the application on your local machine.

### Prerequisites

- Ruby on Rails installed
- Git installed

# Web-Based Event Trigger and Email Notification System

## Overview

### User Interface:

- **Buttons:**
  - **Create Event A:** Generates an instance of Event A associated with a user in iterable.com.
  - **Create Event B:** Generates an instance of Event B associated with a user in iterable.com.

### iterable.com Integration:

- **API Integration:**
  - Seamlessly integrated with iterable.com API.
  - Utilizes iterable.com API to send targeted email notifications for Event B.

- **Testing with Mocks:**
  - Iterable.com API interactions are mocked using over-the-wire mocks for reliable testing.

### Clone the Repository


`git clone git@github.com:shimroz1992/ROR_Assigment_CB.git`
`cd ROR_Assigment_CB`
### Install Dependencies
`bundle install`
### Database Setup
`rails db:migrate`
#### Run the Application
`rails server`
or    
`rails s`

## Usage
- Click "Create Event A" to generate an instance of Event A.
- Click "Create Event B" to generate an instance of Event B and trigger an email notification.


## Testing
### RSpec
RSpec is used for testing. Run the test suite with
- rspec
### Code Linting with RuboCop
RuboCop is configured to maintain code quality. Run RuboCop with:
- rubocop -A

### Authentication
Devise gem is used for user authentication. Customize authentication features as needed.


## Conclusion
Thank you for exploring our Web-Based Event Trigger and Email Notification System! We hope this application proves to be a valuable resource for integrating with iterable.com mock data , managing events, and sending email notifications seamlessly.

Feel free to contribute, report issues, or provide feedback. We welcome your input to improve the functionality, code quality, and user experience of this project.

If you have any questions or need assistance, please don't hesitate to reach out. Happy coding!


