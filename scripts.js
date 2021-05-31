var flavors = ["typescript", "atscript", 
"purescript", 
"reason", "reasonml", 
"eml", 
"clojurescript"];

var frontFrameworks = ["svelte",
"reactjs", "react", "react-jsx", "react.js",
"vue.js", "vuejs", "vue", "vue-js",
"alpine.js",
"preact",
"lit-element",
"stimulusjs",
"angular", "angular2", "angular4", "angular4.x", "angularjs2",
"ember.js", "ember", "emberjs"];

var dataLayers = ["graphql",
"apollo-client",
"vuex",
"xstate",
"redux",
"mobx",
"relay", "relayjs"];

var backendFrameworks = ["next.js", "nextjs",
"express", "express.js", "expressjs",
"fastify",
"nuxt.js", "nuxt", "nuxtjs",
"nestjs",
"strapi",
"koa",
"gatsby", "gatsbyjs",
"hapijs",
"meteor", "meteorjs", "meteor.js"];

var testing = ["testing-library",
"jestjs", "jest",
"cypress", "cypressio",
"playwright",
"storybook",
"puppeteer",
"mocha.js", "mocha",
"jasmine",
"ava",
"webdriver-io"];

var buildTools = ["esbuild", 
"snowpack",
"typescript", "atscript",
"webpack",
"parceljs",
"rollupjs",
//swc = "", I didn"t find anything. Github project is here: https://github.com/swc-project/swc
"romejs",
"gulp",
"browserify"];

var mobileAndDesktop = ["electron",
"capacitor",
"react-native",
// NativeApps - The majority of mobile and desktop apps are still built with native languages like Java, Kotlin, Objective-C, or Swift.
"expo",
"quasar-framework",
"ionic-framework", "ionic",
"nwjs",
"cordova", "apache-cordova"];  

var categoriesArray = [flavors, frontFrameworks, dataLayers, backendFrameworks, testing, buildTools, mobileAndDesktop];
var idArrays = ["flavorsSvg", "frontFrameworksSvg", "dataLayersSvg", "backendFrameworksSvg", "testingSvg", "buildToolsSvg", "mobileAndDesktopSvg"];


d3.csv("ProcessedQueryResults.csv")
    .then(function(data) {
        data.forEach(function (d) {
            var date = new Date();
            var years = Math.floor(d.months/12);
            var months = d.months % 12;
            d["months"] = new Date(date.getFullYear() - years, date.getMonth() - months); // convert elapsed months to JS date
            d["questions"] = parseInt(d.questions);
        });

        csvData = data;
        drawGraph();

    });

var csvData;

function drawGraph() {

    for (let index = 0; index < categoriesArray.length; index++) {

        // Set the dimensions of the canvas / graph
        var margin = {top: 30, right: 20, bottom: 30, left: 75},
        width = 1200 - margin.left - margin.right,
        height = 500 - margin.top - margin.bottom;

        // Set the ranges
        var x = d3.scaleTime().range([0, width]);  
        var y = d3.scaleLinear().range([height, 0]);

        // Define the line
        var questionsline = d3.line()    
        .x(function(d) { return x(d.months); })
        .y(function(d) { return y(d.questions); });

        // Adds the svg canvas
        var svg = d3.select("#"+idArrays[index])
        .append("svg")
            .attr("viewBox",`0 0 ${width + margin.left + margin.right} ${height + margin.top + margin.bottom}`)
        .append("g")
            .attr("transform", 
                "translate(" + margin.left + "," + margin.top + ")");

        const cb = true;

        // Scale the range of the data
        if (cb.checked) {
            x.domain(d3.extent(csvData, function(d) { return d.months; }));
            y.domain([0, d3.max(csvData, function(d) { return d.questions; })]);
        } else {
            const filteredData = csvData.filter(obj => categoriesArray[index].some(e => e == obj.TagName));
            x.domain(d3.extent(filteredData, function(d) { return d.months; }));
            y.domain([0, d3.max(filteredData, function(d) { return d.questions; })]);
        }

        // Group the entries by symbol
        dataNest = Array.from(
            d3.group(csvData, d => d.TagName), ([key, value]) => ({key, value})
        );

        // set the colour scale
        var color = d3.scaleOrdinal(d3.schemeCategory10);

        svg.append("text")
            .attr("x", 5)
            .attr("y", 16)
            .style("fill", "black")
            .text("Tag do StackOverflow")
            .attr("text-anchor", "left")
            .style("alignment-baseline", "middle")

        // Loop through each symbol / key
        var lastValueArray = []
        dataNest.forEach(function(d,i) { 

            if(categoriesArray[index].some(e => e == d.key)) {

                svg.append("path")
                    .attr("class", "line")
                    .attr("fill","none")
                    .style("stroke", function() { // Add the colours dynamically
                        return d.color = color(i); })
                    .attr("d", questionsline(d.value));

                lastValueArray.push([d.key, d.value[d.value.length - 1].questions, d.color])

            }

        });

        lastValueArray.sort(function(a,b) {
            return b[1]-a[1]
        });        

        lastValueArray.forEach(function(d, i) {
            var size = 20;
            // Add one dot in the legend for each name.
            svg.append("rect")
                .attr("x", 5)
                .attr("y", 5 + (i+1)*(size+5)) // 100 is where the first dot appears. 25 is the distance between dots
                .attr("width", size)
                .attr("height", size)
                .style("fill", d[2])

            svg.append("text")
                .attr("x", 5 + size*1.2)
                .attr("y", 12 + (i+1)*(size+5) + (size/2))
                .style("fill", d[2])
                .text(d[0])
                .attr("text-anchor", "left")
                .style("alignment-baseline", "middle")
        });

        // Add the X Axis
        svg.append("g")
                .attr("class", "axis")
                .attr("transform", "translate(0," + height + ")")
                .call(d3.axisBottom(x));

        // Add the Y Axis
        svg.append("g")
                .attr("class", "axis")
                .call(d3.axisLeft(y));

        // Add axis label
        svg.append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", 5 - margin.left)
            .attr("x", 0 - (height / 2))
            .attr("dy", "1em")
            .style("text-anchor", "middle")
            .text("Perguntas/mês");

    }

}