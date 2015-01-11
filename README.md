# Cosmeos Camera API

This is a web based service to wrap the [libgphoto2](http://gphoto.sourceforge.net/)
library in an easily accessed REST API.

Despite "EOS" being in the name, this API should be able to service any of the
cameras listed [here](http://gphoto.sourceforge.net/proj/libgphoto2/support.php).

## Installation

First, you'll need to install `libgphoto2`:

On a mac:

```
brew install libgphoto2
```

Then you can bundle:

```
bundle install
```

And start the service:

```
rackup -p 4567
```

## Endpoints

`/camera/configuration` - Lists the current configurations that the camera
has set.

![cosmeos-configuration](http://i.imgur.com/AoVggql.png)

---

`/camera/preview.jpg` - Returns an image preview of the camera.

![cosmeos-preview](http://i.imgur.com/qoPXZ7x.png)
