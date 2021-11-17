# EcoHub

EcoHub is a promotion and refer code sharing website to provide Columbia students more access to valid promo and refer codes.



## Team Members

- Yihan Yin (yy3114)
- Wenqian Yan (wy2249)
- Hanyi Li (hl3512)
- Zijian Zhang (zz2795)

## Iterations

### Iteration 1

- Tag: `iter1`
- Branch: `iter-1`
- Heroku: https://ecos-hub-1.herokuapp.com

### Iteration 2

- Tag: `iter2`
- Branch: `iter-2`
- Heroku: https://ecos-hub-2.herokuapp.com

### Launch

- ToDo

## Links

- Github: https://github.com/saas-EcoHub/EcoHub

## Features

- Posts promotion codes and refer codes
- Supports likes and dislikes on promo info to sort and filter most valid/popular promotions
- Comments on existing promotions
- User registration and log in functionalities

## Instructions


### Running with Rails

Install `ruby 2.6.6`. Also, install bundle with `gem install bundle`.

Then, install the required packages with `bundle install`:
```
bundle install
```

Setup the database:
```
bundle exec rake db:setup
```

Then start the server.

```
bundle exec rails server -b 0.0.0.0
```

### Runing the tests

To run `rspec` tests, run

```
bundle exec rake db:drop RAILS_ENV=test
bundle exec rake db:setup RAILS_ENV=test
bundle exec rspec spec
```

#### Cucumber

To run `cucumber` tests, run

```
bundle exec rake db:drop RAILS_ENV=test
bundle exec rake db:create RAILS_ENV=test
bundle exec rake db:migrate RAILS_ENV=test
bundle exec cucumber features
```

#### Coverage

After running all the above tests, the coverage report is generated in the `coverage/` directory.
