# Boomtastic

[Formtastic](https://github.com/justinfrench/formtastic) is fantastic form builder, and [Bootstrap](http://getbootstrap.com/2.3.2/) is a great front-end framework.  [Formtastic-Bootstrap](https://github.com/mjbellantoni/formtastic-bootstrap) used to combine them but it is no longer supported.  Boomtastic is our far less comprehensive replacement for Formtastic-Bootstrap.  

## Intended Audience  

Someone whose site had depended on the `formtastic-bootstrap` gem and is desperate for a way to migrate their site forward to Rails 4.1 or above.

## Supported Input Types

We have only updated the following input types.  [Further hacking or patching] may be required if you would like to add others. We use the [original Formtastic names for the input types](https://github.com/justinfrench/formtastic#the-available-inputs).

* `:boolean`
* `:check_boxes`
* `:date_select`
* `:email`
* `:file`
* `:number`
* `:password`
* `:phone`
* `:radio`
* `:select`
* `:string`
* `:text` (text area)
* `:url`

## Dependencies

You should have Rails and Bootstrap.  If you don't have those you probably don't need this gem anyway.

## How to Add

To add this gem, add the following code to your `Gemfile`

```
gem 'formtastic', github: 'r-spell/boomtastic', branch: 'boomtastic'

```

You will need to do a `bundle install` after saving your Gemfile and before running your Rails app.

## Project Sources and Specs

Boomtastic was built on [Formtastic](https://github.com/justinfrench/formtastic).  Indeed this repository is a fork of Formtastic. The limited specs for our hacking are found in `specs/bootsrap`.  These specs use the [Formtastic-Bootstrap](https://github.com/mjbellantoni/formtastic-bootstrap) specs as a template, and should all be passing.  Other specs in this repository are the original Formtastic `3.1-Stable` specs and due to our massive amounts of hacking these will (and should) fail.

## Lead Hackers

This hackery perpetrated by [Rosanna Speller](https://github.com/r-spell) and [Dave Morse](https://github.com/dcmorse).

## License

Copyright (c) 2007-2016 Justin French, released under the MIT license.
