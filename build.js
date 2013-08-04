// For all config options and their description see
// https://github.com/jrburke/r.js/blob/master/build/example.build.js

({
    // // look for files in middleman's build folder
    // appDir: "middleman_build", 
    
    // javascripts live in the 'middleman_build/javascripts/' folder
    baseUrl: "./middleman_build/javascripts",
    
    paths: {
      underscore: "lib/underscore",
      backbone: "lib/backbone",
      marionette: "lib/backbone.marionette",
      jquery: "lib/jquery.min",
      tpl: "lib/tpl",
      'backbone_offline': 'lib/backbone_offline'
    },
    
    shim: {
      'backbone_offline': {
        deps: ['underscore', 'backbone'],
        exports: 'Offline'
        
      },
      underscore: {
        exports: "_"
      },        
      backbone: {
        exports: "Backbone",
        deps: ["jquery", "underscore"]
      },
      marionette: {
        exports: "Backbone.Marionette",
        deps: ["backbone"]  
      }
    },              
    
    // keep 'use strict' directive
    useStrict: true,

    name: 'lib/almond',
    include: "application",
    out: "phonegap_build/javascripts/application.js",
    
    // remove license comments
    preserveLicenseComments: false,
        
    // encapsulate the module code so that define/require are
    // not globals.
    wrap: true
})