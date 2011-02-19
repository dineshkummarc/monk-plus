My project
==========

Set up RVM

    rvm --rvmrc --create 1.9.2@myproject

Install dependency gems

    monk install

Start

    monk start

Run tests

    monk test

Skeleton Info
-------------

### ORM-less

The skeleton comes with no ORM by default.

However, there are sample config files in `config/` for Ohm and Sequel which has
instructions on how to set them up.

### Sinatra-style configuration

The bootstrapper loads all of `config/*.rb`, starting with the default files (like `haml.default.rb`).

 * To set settings: `Main.set :name, "Hello"`
 * To retrieve settings: `settings.name`

### JS Minification

Uses JsFiles (to compress JS files).

 * Edit `config/jsfiles.defaults.rb` to see which JS files are to be processed.

### HTML5 boilerplate

Some things from the HTML5 boilerplate were roughly followed:

 * Modernizr built in
 * Load JQuery/Modernizr/etc via CDN (Google's and Cachedcommon's public CDNs)
 * DD_belatedPNG
 * ...among other things (which should be fairly trivial to remove)

### And more

 * The jQuery helpers ensure that jQuery is loaded from Google servers first before
   falling back to the app-provided jQuery file.

 * Uses AgentSniff to do browser detection. The HTML class is automatically set.

 * A couple of new helpers have been added.

History
-------

Aside from all the things above, this skeleton also features other improvements.

### Other changes from the original Monk skeletons

 * Uses the unofficial Monk-shake instead of Monk.

   * Uses `Monkfile` instead of `Thorfile`.

 * It alerts users when gems aren't installed.

 * Most gems aren't vendored anymore. You have to install them yourself.
   (`monk install` has been greatly improved afterall!)

 * Added the `monk irb` task.

 * Deprecated the `monk copy_example` command.

### Other changes from Monk 0.x skeletons

 * Removed dependency on the `monk-glue` gem.

   * The old `app_config()` has been deprecated in favor of Sinatra's
     config system.

   * [Pistol](http://github.com/monk/pistol) is used for auto-reloading.

 * Removed dependency on the `dependencies` gem.

   * Now uses a plain old `.gems` file instead of the `dependencies` file.

 * Uses Cutest + Capybara for testing (intead of Contest + Webrat).
