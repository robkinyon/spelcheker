// vi:sw=2;

module.exports = function (grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
  });

  grunt.loadNpmTasks('grunt-express');
};
