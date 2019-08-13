# Sous Chef App!

This is an app that tracks your grocery items, lets you create a shopping list and search recipes based on items that you already have in your kitchen!
## Demo

- [Live Demo](https://sleepy-reaches-47839.herokuapp.com/api)
- [Local Demo](http://localhost:8000/api)

## Set up

Complete the following steps to start a new project (NEW-PROJECT-NAME):

1. Clone this repository to your local machine `git clone https://github.com/muzhaqi16/sous-chef-client.git NEW-PROJECTS-NAME`
2. `cd` into the cloned repository
3. Make a fresh start of the git history for this project with `rm -rf .git && git init`
4. Install the node dependencies `npm install`
5. Move the example Environment file to `.env` that will be ignored by git and read by the express server `mv example.env .env`
6. Edit the contents of the `package.json` to use NEW-PROJECT-NAME instead of `"name": "sous-chef",`
7. Migrate the database to the latest version

## Scripts
  
Start the application `npm start`

Run the tests `npm test`

Run in development mode `npm run dev`

Deploy to a server `npm run deploy`

Migrate database `npm run migrate`

## Api routes

`/api/groceries`

    `GET` get all groceries
    
    `POST` add a new grocery item
    
  `/:grocery_id`
  
    `GET` get grocery item by id
    
    `DELETE` delete grocery item by id
    
    `PATCH` edit grocery item by id
    
`/api/auth`

    `POST` login 
    
`/api/users`

      `POST` add a new user
