# spelcheker #

This provides a REST server that, given a word, will return back either:
* success that the word is spelled properly
* failure and suggestions (if possible) for what the word could be

# API #

```GET /``` returns:
```JSON
{
  "success": false,
  "word": "",
  "suggestion": null
}
```

```GET /<word>```, if the word is spelled properly, returns:
```JSON
{
  "success": true,
  "word": "<word>",
  "suggestion": null
}
```

```GET /<word>```, if the word is *not* spelled properly, returns:
```JSON
{
  "success": false,
  "word": "<word>",
  "suggestion": "word1"
}
```

# Setup #

To setup your development environment, you will need:
* VirtualBox
   * Downoad and install from https://www.virtualbox.org/wiki/Downloads
      * The extension pack is not needed.
* Vagrant
   * Download and install from http://downloads.vagrantup.com/
   * Run ```vagrant plugin install vagrant-vbguest```
      * This will guarantee that the VM always has the latest guest extensions.

The Vagrantfile in this checkout will do the rest (assuming you have an active
internet connection).

## Starting work ##

Assuming you've installed everything detailed in Setup, then it's just:
* ```vagrant up```

The first time may take a while.
