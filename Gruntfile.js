// vi:sw=2;

module.exports = function (grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffee: {
      'spelcheker': {
        'files': {
          'lib/app.js': 'lib/**/*.coffee',
        },
      },
      'test': {
        'files': {
          'spec/test.js': 'spec/**/*.coffee',
        },
      },
    },
    jshint: {
      'spelcheker': {
        src: [
          'spec/**/*.js',
          'lib/**/*.js',
          __filename,
        ],
      },
    },
    simplemocha: {
      options: {
        globals: [ 'should' ],
        ignoreLeaks: false,
      },
      'spelcheker': {
        src: [ 'spec/**/*.js' ],
      },
    },
  });

  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-express');
  grunt.loadNpmTasks('grunt-simple-mocha');

  grunt.registerTask('compile', [
    'coffee',
  ]);

  grunt.registerTask('lint', [
    'jshint',
  ]);

  grunt.registerTask('test', [
    'compile', 'lint', 'simplemocha',
  ]);

  grunt.registerTask('default', ['test']);
};
