// vi:sw=2;

module.exports = function (grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    jshint: {
      'spelcheker': {
        src: [
          __filename,
        ],
      },
    },
  });

  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-express');

  grunt.registerTask('lint', [
    'jshint',
  ]);

  grunt.registerTask('test', [
    'lint',
  ]);

  grunt.registerTask('default', ['test']);
};
