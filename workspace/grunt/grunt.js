module.exports = function (grunt) {
  'use strict';

  // Load local NPM tasks
  grunt.loadNpmTasks('grunt-recess');
  grunt.loadNpmTasks('grunt-growl');

  grunt.initConfig({

    lint : {
      all: [
        '../js/dtrmn.js'
      ]
    },

    minify : {
      all: [
        '../less/dtrmn.less'
      ]
    },

    recess: {
      main: {
        src: [
        '../less/dtrmn.less'
        ],
        dest: '../css/dtrmn.1.2.7.css',
        options: {
            compile: true,
            compress: true
        }
      }
    },

    watch : {
      scripts: {
        files: [
          '../less/*.less',
          '../js/*.js'
        ],
        tasks: 'lint:all min:dist recess:main'
      }
    },

    min: {
      dist: {
        src : [
          '../bootstrap/docs/assets/js/jquery.js',
          '../bootstrap/docs/assets/js/bootstrap.min.js',
          '../js/responsimage.js',
          '../js/crossref.js',
          '<config:lint.all>'
        ],
        dest: '../js/dtrmn.1.2.7.js',
        separator: ';'
      }
    },

    growl : {
      compile : {
        title : "Grunt.js",
        message : "Grunt was run successfully"
      }
    }

});

// Main task
grunt.registerTask('default', 'lint:all min:dist recess:main growl:compile')};