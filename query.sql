-- JavaScript Flavors
-- TypeScript, PureScript, Reason, Elm, ClojureScript

SET @TypeScript = ('typescript', 'atscript');
SET @PureScript = ('purescript');
SET @Reason = ('reason', 'reasonml');
SET @Elm = ('eml');
SET @ClojureScript = ('clojurescript');

-- Front-end Frameworks
-- Svelte, React, Vue.js, Alpine.js, Preact, LitElement, Stimulus, Angular, Ember

SET @Svelte = ('svelte');
SET @React = ('reactjs', 'react', 'react-jsx', 'react.js');
SET @Vuejs = ('vue.js', 'vuejs', 'vue', 'vue-js');
SET @Alpine = ('alpine.js');
SET @Preact = ('preact');
SET @LitElement = ('lit-element');
SET @Stimulus = ('stimulusjs');
SET @Angular = ('angular', 'angular2', 'angular4', 'angular4.x', 'angularjs2'); -- doesn't include AngularJS (1.x)
SET @Ember = ('ember.js', 'ember', 'emberjs');

-- Data Layer
-- GraphQL, Apollo Client, Vuex, XState, Redux, MobX, Relay

SET @GraphQL = ('graphql');
SET @ApolloClient = ('apollo-client');
SET @Vuex = ('vuex');
SET @XState = ('xstate');
SET @Redux = ('redux');
SET @MobX = ('mobx');
SET @Relay = ('relay', 'relayjs'); -- Suggested synonym

-- Back-end Frameworks
-- Next.js, Express, Fastify, Nuxt, Nest, Strapi, Koa, Gatsby, Hapi, Meteor

SET @Nextjs = ('next.js', 'nextjs');
SET @Express = ('express', 'express.js', 'expressjs');
SET @Fastify = ('fastify');
SET @Nuxt = ('nuxt.js', 'nuxt', 'nuxtjs'); -- Suggested synonym
SET @Nest = ('nestjs');
SET @Strapi = ('strapi');
SET @Koa = ('koa');
SET @Gatsby = ('gatsby', 'gatsbyjs'); -- Suggested synonym
SET @Hapi = ('hapijs');
SET @Meteor = ('meteor', 'meteorjs', 'meteor.js');

-- Testing
-- Testing Library, Jest, Cypress, Playwright, Storybook, Puppeteer, Mocha, Jasmine, AVA, WebdriverIO

SET @TestingLibrary = ('testing-library');
SET @Jest = ('jestjs', 'jest');
SET @Cypress = ('cypress', 'cypressio');
SET @Playwright = ('playwright');
SET @Storybook = ('storybook');
SET @Puppeteer = ('puppeteer');
SET @Mocha = ('mocha.js', 'mocha');
SET @Jasmine = ('jasmine');
SET @AVA = ('ava');
SET @WebdriverIO = ('webdriver-io');

-- Build Tools
-- esbuild, Snowpack, TypeScript, webpack, Parcel, Rollup, SWC, Rome, Gulp, Browserify

SET @esbuild = ('esbuild');
SET @Snowpack = ('snowpack');
-- already setted SET @TypeScript = ('typescript', 'atscript');
SET @webpack = ('webpack');
SET @Parcel = ('parceljs');
SET @Rollup = ('rollupjs'); -- potentially has questions in 'rollup' tag too, but mixed with SQL questions 
-- SET @SWC = (''); I didn't find anything. Github project is here: https://github.com/swc-project/swc
SET @Rome = ('romejs');
SET @Gulp = ('gulp');
SET @Browserify = ('browserify');
