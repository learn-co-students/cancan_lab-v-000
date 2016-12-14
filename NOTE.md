# rake routes
   Prefix Verb   URI Pattern               Controller#Action
     root GET    /                         sessions#new
    login GET    /login(.:format)          sessions#new
   logout GET    /logout(.:format)         sessions#destroy
 sessions POST   /sessions(.:format)       sessions#create
    users POST   /users(.:format)          users#create
    notes GET    /notes(.:format)          notes#index
          POST   /notes(.:format)          notes#create
 new_note GET    /notes/new(.:format)      notes#new
edit_note GET    /notes/:id/edit(.:format) notes#edit
     note GET    /notes/:id(.:format)      notes#show
          PATCH  /notes/:id(.:format)      notes#update
          PUT    /notes/:id(.:format)      notes#update
          DELETE /notes/:id(.:format)      notes#destroy

# rails g model
Running via Spring preloader in process 5535
Expected string default value for '--jbuilder'; got true (boolean)
Usage:
  rails generate model NAME [field[:type][:index] field[:type][:index]] [options]

Options:
      [--skip-namespace], [--no-skip-namespace]  # Skip namespace (affects only isolated applications)
      [--force-plural], [--no-force-plural]      # Forces the use of the given model name
  -o, --orm=NAME                                 # Orm to be invoked
                                                 # Default: active_record

ActiveRecord options:
      [--migration], [--no-migration]    # Indicates when to generate migration
                                         # Default: true
      [--timestamps], [--no-timestamps]  # Indicates when to generate timestamps
                                         # Default: true
      [--parent=PARENT]                  # The parent class for the generated model
      [--indexes], [--no-indexes]        # Add indexes for references and belongs_to columns
                                         # Default: true
  -t, [--test-framework=NAME]            # Test framework to be invoked
                                         # Default: rspec

Rspec options:
  [--fixture], [--no-fixture]   # Indicates when to generate fixture
  [--fixture-replacement=NAME]  # Fixture replacement to be invoked

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Description:
    Stubs out a new model. Pass the model name, either CamelCased or
    under_scored, and an optional list of attribute pairs as arguments.

    Attribute pairs are field:type arguments specifying the
    model's attributes. Timestamps are added by default, so you don't have to
    specify them by hand as 'created_at:datetime updated_at:datetime'.

    As a special case, specifying 'password:digest' will generate a
    password_digest field of string type, and configure your generated model and
    tests for use with ActiveModel has_secure_password (assuming the default ORM
    and test framework are being used).

    You don't have to think up every attribute up front, but it helps to
    sketch out a few so you can start working with the model immediately.

    This generator invokes your configured ORM and test framework, which
    defaults to ActiveRecord and TestUnit.

    Finally, if --parent option is given, it's used as superclass of the
    created model. This allows you create Single Table Inheritance models.

    If you pass a namespaced model name (e.g. admin/account or Admin::Account)
    then the generator will create a module with a table_name_prefix method
    to prefix the model's table name with the module name (e.g. admin_accounts)

Available field types:

    Just after the field name you can specify a type like text or boolean.
    It will generate the column with the associated SQL type. For instance:

        `rails generate model post title:string body:text`

    will generate a title column with a varchar type and a body column with a text
    type. If no type is specified the string type will be used by default.
    You can use the following types:

        integer
        primary_key
        decimal
        float
        boolean
        binary
        string
        text
        date
        time
        datetime

    You can also consider `references` as a kind of type. For instance, if you run:

        `rails generate model photo title:string album:references`

    It will generate an `album_id` column. You should generate these kinds of fields when
    you will use a `belongs_to` association, for instance. `references` also supports
    polymorphism, you can enable polymorphism like this:

        `rails generate model product supplier:references{polymorphic}`

    For integer, string, text and binary fields, an integer in curly braces will
    be set as the limit:

        `rails generate model user pseudo:string{30}`

    For decimal, two integers separated by a comma in curly braces will be used
    for precision and scale:

        `rails generate model product 'price:decimal{10,2}'`

    You can add a `:uniq` or `:index` suffix for unique or standard indexes
    respectively:

        `rails generate model user pseudo:string:uniq`
        `rails generate model user pseudo:string:index`

    You can combine any single curly brace option with the index options:

        `rails generate model user username:string{30}:uniq`
        `rails generate model product supplier:references{polymorphic}:index`

    If you require a `password_digest` string column for use with
    has_secure_password, you should specify `password:digest`:

        `rails generate model user password:digest`

Examples:
    `rails generate model account`

        For ActiveRecord and TestUnit it creates:

            Model:      app/models/account.rb
            Test:       test/models/account_test.rb
            Fixtures:   test/fixtures/accounts.yml
            Migration:  db/migrate/XXX_create_accounts.rb

    `rails generate model post title:string body:text published:boolean`

        Creates a Post model with a string title, text body, and published flag.

    `rails generate model admin/account`

        For ActiveRecord and TestUnit it creates:

            Module:     app/models/admin.rb
            Model:      app/models/admin/account.rb
            Test:       test/models/admin/account_test.rb
            Fixtures:   test/fixtures/admin/accounts.yml
            Migration:  db/migrate/XXX_create_admin_accounts.rb

# rails g resource
Running via Spring preloader in process 5652
Expected string default value for '--test-framework'; got false (boolean)
Expected string default value for '--jbuilder'; got true (boolean)
Usage:
  rails generate resource NAME [field[:type][:index] field[:type][:index]] [options]

Expected string default value for '--test-framework'; got false (boolean)
Expected string default value for '--test-framework'; got false (boolean)
Expected string default value for '--helper'; got false (boolean)
Expected string default value for '--assets'; got false (boolean)
Options:
      [--skip-namespace], [--no-skip-namespace]  # Skip namespace (affects only isolated applications)
      [--force-plural], [--no-force-plural]      # Forces the use of the given model name
  -o, --orm=NAME                                 # Orm to be invoked
                                                 # Default: active_record
      [--model-name=MODEL_NAME]                  # ModelName to be used
  -c, --resource-controller=NAME                 # Resource controller to be invoked
                                                 # Default: controller
  -a, [--actions=ACTION ACTION]                  # Actions for the resource controller
      --resource-route                           # Indicates when to generate resource route
                                                 # Default: true

ActiveRecord options:
      [--migration], [--no-migration]    # Indicates when to generate migration
                                         # Default: true
      [--timestamps], [--no-timestamps]  # Indicates when to generate timestamps
                                         # Default: true
      [--parent=PARENT]                  # The parent class for the generated model
      [--indexes], [--no-indexes]        # Add indexes for references and belongs_to columns
                                         # Default: true
  -t, [--test-framework]                 # Indicates when to generate test framework

Controller options:
      [--skip-routes], [--no-skip-routes]  # Don't add routes to config/routes.rb.
  -e, [--template-engine=NAME]             # Template engine to be invoked
                                           # Default: erb
      [--helper]                           # Indicates when to generate helper
      [--assets]                           # Indicates when to generate assets

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Description:
    Stubs out a new resource including an empty model and controller suitable
    for a restful, resource-oriented application. Pass the singular model name,
    either CamelCased or under_scored, as the first argument, and an optional
    list of attribute pairs.

    Attribute pairs are field:type arguments specifying the
    model's attributes. Timestamps are added by default, so you don't have to
    specify them by hand as 'created_at:datetime updated_at:datetime'.

    You don't have to think up every attribute up front, but it helps to
    sketch out a few so you can start working with the model immediately.

    This generator invokes your configured ORM and test framework, besides
    creating helpers and add routes to config/routes.rb.

    Unlike the scaffold generator, the resource generator does not create
    views or add any methods to the generated controller.

Examples:
    `rails generate resource post` # no attributes
    `rails generate resource post title:string body:text published:boolean`
    `rails generate resource purchase order_id:integer amount:decimal`
