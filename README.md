##### Prerequisites

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