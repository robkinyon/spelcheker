// vi:sw=2;

module.exports = function (grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffee: {
      'spelcheker': {
        'files': {
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

  grunt.registerTask('compile:test', [
    'coffee:test',
  ]);

  grunt.registerTask('lint', [
    'jshint',
  ]);

  grunt.registerTask('test', [
    'compile:test', 'lint', 'simplemocha',
  ]);

  grunt.registerTask('default', ['test']);
};
