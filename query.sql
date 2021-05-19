declare @languages table(lang varchar(30))

-- JavaScript Flavors
-- TypeScript, PureScript, Reason, Elm, ClojureScript

insert into @languages values ('typescript'), ('atscript'),
('purescript'),
('reason'), ('reasonml'),
('eml'),
('clojurescript'),

-- Front-end Frameworks
-- Svelte, React, Vue.js, Alpine.js, Preact, LitElement, Stimulus, Angular, Ember

('svelte'),
('reactjs'), ('react'), ('react-jsx'), ('react.js'),
('vue.js'), ('vuejs'), ('vue'), ('vue-js'),
('alpine.js'),
('preact'),
('lit-element'),
('stimulusjs'),
('angular'), ('angular2'), ('angular4'), ('angular4.x'), ('angularjs2'), -- doesn't include AngularJS (1.x)
('ember.js'), ('ember'), ('emberjs'),

-- Data Layer
-- GraphQL, Apollo Client, Vuex, XState, Redux, MobX, Relay

('graphql'),
('apollo-client'),
('vuex'),
('xstate'),
('redux'),
('mobx'),
('relay'), ('relayjs'), -- Suggested synonym

-- Back-end Frameworks
-- Next.js, Express, Fastify, Nuxt, Nest, Strapi, Koa, Gatsby, Hapi, Meteor

('next.js'), ('nextjs'),
('express'), ('express.js'), ('expressjs'),
('fastify'),
('nuxt.js'), ('nuxt'), ('nuxtjs'), -- Suggested synonym
('nestjs'),
('strapi'),
('koa'),
('gatsby'), ('gatsbyjs'), -- Suggested synonym
('hapijs'),
('meteor'), ('meteorjs'), ('meteor.js'),

-- Testing
-- Testing Library, Jest, Cypress, Playwright, Storybook, Puppeteer, Mocha, Jasmine, AVA, WebdriverIO

('testing-library'),
('jestjs'), ('jest'),
('cypress'), ('cypressio'),
('playwright'),
('storybook'),
('puppeteer'),
('mocha.js'), ('mocha'),
('jasmine'),
('ava'),
('webdriver-io'),

-- Build Tools
-- esbuild, Snowpack, TypeScript, webpack, Parcel, Rollup, SWC, Rome, Gulp, Browserify

('esbuild'),
('snowpack'),
-- already setted SET @TypeScript = ('typescript'), ('atscript'),
('webpack'),
('parceljs'),
('rollupjs'), -- potentially has questions in 'rollup' tag too, but mixed with SQL questions 
-- SET @SWC = (''), I didn't find anything. Github project is here: https://github.com/swc-project/swc
('romejs'),
('gulp'),
('browserify'),

-- Mobile & Desktop
-- Electron, Capacitor, React Native, Native Apps, Expo, Quasar, Ionic, NW.js, Cordova
('electron'),
('capacitor'),
('react-native'),
-- @NativeApps - The majority of mobile and desktop apps are still built with native languages like Java, Kotlin, Objective-C, or Swift.
('expo'),
('quasar-framework'),
('ionic-framework'), ('ionic'),
('nwjs'),
('cordova'), ('apache-cordova')