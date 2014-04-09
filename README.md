## [ApplePie](http://apppie.org)

ApplePie Toolkit is modular and responsive CSS framework. Getting started with ApplePie is easy. Whether you are building a simple   site with a 'default' UI, or you are a master of SASS, building a new app - this toolkit will help you get up and running!

## Getting Started

### CSS Version
Simplest way to get started - straight CSS Toolkit version that includes everything you need to do rapid prototyping. Just grab a CSS file (applepie.css or applepie.min.css), include it to a web page and start doing markup without additional efforts on styling elements. Checkout [latest releases](https://github.com/alchapone/applepie/releases) to get started.

### SASS Version
You'll need [node](http://nodejs.org/) and [npm](https://www.npmjs.org/) to install it.

#### Bower

```
  npm install -g bower
  bower install applepie
```


#### Git

```
  git clone git@github.com:railsware/applepie.git
  cd applepie
  npm install -g grunt-cli   # if you haven't install grunt previously
  npm install
  grunt build
```

#### Usage
All ApplePie SASS files should now be built into the ```dist/sass/``` directory. What you've
got here:

```base/```: folder that contains all base layer styles like ```normalize.css```, ```grids.css``` etc.

```mixins/```: contains all kinds of mixins that can be handy during development, like CSS3 mixins for
dealing wit vendor prefixes, or responsive mixins for media queries.

```components/```: is a folder that contains all UI components implemented also using SASS mixins.
You can use this default implementation of UI elements just by including components into your
main SASS file and using mixins inside selectors.

```layout/```: layouts styles. [WIP]

```all.sass```: linking all pie components together. If you want to use all ApplePie components -
just include all.sass to your stylesheets.

```manifest.sass```: this is sample applepie manifest, which has all selectors in place with use of components mixins.
If you want to feel all power of ApplePie's naming convention and want to use all benefits of
standardized naming, use ```manifest.sass``` as your main sass manifest file. Just copy this file to your
stylesheets folder, include applepie's ```all.sass``` file at the top and you are ready to roll!

Find out more at [apppie.org](http://apppie.org/pages/toolkit/getting_started.html)

### Contributing

See the [CONTRIBUTING](https://github.com/railsware/applepie/blob/master/CONTRIBUTING.md) file for information on how to contribute to ApplePie Toolkit
