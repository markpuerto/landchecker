## Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.3.0](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [7.1.3](https://github.com/organization/project-name/blob/master/Gemfile#L12)
- Postgres [app](https://www.postgresql.org/)
- [Postgis](https://www.postgresql.org/)

##### 1. Check out the repository

```bash
git clone git@github.com:markpuerto/landchecker.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database and postgis.

```ruby
rails db:create
psql ${database_name} -c "CREATE EXTENSION postgis"
```

##### 3. Import the sql

Import the given sql file.

```ruby
psql ${owner} -d ${database_name} < ${path_to_file.sql}
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000


## About the project

This is built using the [API-only Application](https://guides.rubyonrails.org/api_app.html) guidelines of rails. The given task is to build an endpoint that fetches information for the Local Government Areas in Victoria with a given identifier and also to fetch all information.

Constraints are added in the code to check the following:
- Valid number value for the id parameter
- If the id exists in the database
- and for the bonus part, pagination and to check if database is existing.

No models are used in the project since the given sql has no primary key and timestamps which causes issues. I added a service class to connect from the project to the pg database and create query helpers to fetch information and convert to objects.

I also created the StandardError class to streamline the error handling for the constraints rather than creating multiple render lines for the error.

2 API endpoints are added:
- show (/lgas/:id)
- index (/lgas)

For pagination, by default it returns 10 results per page. Page is set to 1 if nothing is set. In the JSON object, a pagination object is added to help navigate with the urls for next and previous pages.

##### Disclaimer

The following are not added and not part of the exam but can be added if needed:
- Testing
- Authentication