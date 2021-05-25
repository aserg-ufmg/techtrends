import pandas as pd

def main():
    df = pd.read_csv('QueryResults.csv')

    print("Tamanho do DF sem processamento: " + str(len(df)))

    # JavaScript Flavors
    df.TagName = df.TagName.apply(lambda x: 'typescript' if x == 'atscript' else x)
    df.TagName = df.TagName.apply(lambda x: 'reason' if x == 'reasonml' else x)

    # Front-end Frameworks
    df.TagName = df.TagName.apply(lambda x: 'reactjs' if x == 'react' else x)
    df.TagName = df.TagName.apply(lambda x: 'reactjs' if x == 'react-jsx' else x)
    df.TagName = df.TagName.apply(lambda x: 'reactjs' if x == 'react.js' else x)
    df.TagName = df.TagName.apply(lambda x: 'vue.js' if x == 'vuejs' else x)
    df.TagName = df.TagName.apply(lambda x: 'vue.js' if x == 'vue' else x)
    df.TagName = df.TagName.apply(lambda x: 'vue.js' if x == 'vue-js' else x)
    df.TagName = df.TagName.apply(lambda x: 'angular' if x == 'angular2' else x)
    df.TagName = df.TagName.apply(lambda x: 'angular' if x == 'angular4' else x)
    df.TagName = df.TagName.apply(lambda x: 'angular' if x == 'angular4.x' else x)
    df.TagName = df.TagName.apply(lambda x: 'angular' if x == 'angularjs2' else x)
    df.TagName = df.TagName.apply(lambda x: 'ember.js' if x == 'ember' else x)
    df.TagName = df.TagName.apply(lambda x: 'ember.js' if x == 'emberjs' else x)

    # Data Layer
    df.TagName = df.TagName.apply(lambda x: 'relay' if x == 'relayjs' else x)

    # Back-end Frameworks
    df.TagName = df.TagName.apply(lambda x: 'next.js' if x == 'nextjs' else x)
    df.TagName = df.TagName.apply(lambda x: 'express' if x == 'express.js' else x)
    df.TagName = df.TagName.apply(lambda x: 'express' if x == 'expressjs' else x)
    df.TagName = df.TagName.apply(lambda x: 'nuxt.js' if x == 'nuxt' else x)
    df.TagName = df.TagName.apply(lambda x: 'nuxt.js' if x == 'nuxtjs' else x)
    df.TagName = df.TagName.apply(lambda x: 'gatsby' if x == 'gatsbyjs' else x)
    df.TagName = df.TagName.apply(lambda x: 'meteor' if x == 'meteorjs' else x)
    df.TagName = df.TagName.apply(lambda x: 'meteor' if x == 'meteor.js' else x)

    # Testing
    df.TagName = df.TagName.apply(lambda x: 'jestjs' if x == 'jest' else x)
    df.TagName = df.TagName.apply(lambda x: 'cypress' if x == 'cypressio' else x)
    df.TagName = df.TagName.apply(lambda x: 'mocha.js' if x == 'mocha' else x)

    # Build Tools
    # Typescript conversions already made

    # Mobile & Desktop
    df.TagName = df.TagName.apply(lambda x: 'ionic-framework' if x == 'ionic' else x)
    df.TagName = df.TagName.apply(lambda x: 'cordova' if x == 'apache-cordova' else x)

    df['questions'] = df.groupby(['months', 'TagName'])['questions'].transform('sum')
    new_df = df.drop_duplicates(subset=['months', 'TagName'])
    
    print("Tamanho do DF pós processamento: " + str(len(new_df)))

    new_df.to_csv("ProcessedQueryResults.csv", sep=',', encoding='utf-8')


if __name__ == "__main__":
    main()