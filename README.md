# EcoHub

EcoHub is a promotion and refer code sharing website to provide Columbia students more access to valid promo and refer codes.

## Explanation

This is an explanation for like and dislike feature. We don't think it problematic as likes, dislikes and unlike are 3 different operations. For example, clicking dislike on a promo with "1" like is to send it to -1 rather than 0, as it shows user's dislike about certain object, not merely undoing the previous like behavior. So the result should be -1. When user only wants to undo the previous behavior, he or she can just click the previous corresponding control. For example, click the clicked like control to make the count minus 1 or click the clicked dislike control to make the count plus 1.

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

- Tag: `launch`
- Branch: `launch`
- Heroku: https://ecos-hub-3.herokuapp.com

## Links

- Github: https://github.com/saas-EcoHub/EcoHub

## Features

- Posts promotion codes and refer codes
- Supports likes and dislikes on promo info to sort and filter most valid/popular promotions
- Comments on existing promotions
- Supports likes and dislikes on comments and replies
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
