# parallel-watir

Running Watir tests in parallel.

Install required gems with:

    gem install bundle
    bundle install

At `./features/support/env.rb` edit `environment`, `username` and `access_key`.

Run tests in parallel with `rake`.

Optionally, edit `./config/cucumber.yml` or `processes` in `Rakefile`.
