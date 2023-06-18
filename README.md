# Saasonrails

Short description and motivation.

## Usage

How to use my plugin.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "saasonrails"
```

##### Delete the `views/layouts/` directory

```console
rm -rf views/layouts
```

##### Add `saasonrails` to the asset pipeline

```ruby
<%= stylesheet_link_tag "saasonrails.tailwind", "data-turbo-track": "reload" %>
```

##### Add `Saasonrails::Controllers::Application` to your `ApplicationController`

```ruby
# file: app/controllers/application_controller
include Saasonrails::Controllers::Application
```

##### Copy migrations

```console
./bin/rails saasonrails_engine:install:migrations
```
