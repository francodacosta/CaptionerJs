CaptionerJs
==============================================================================

Beautiful and semantically correct captions


Getting Started
--------------------------------------------------------------------------------

 Start by making sure jQuery is included in your page

```html
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
```

Then include CaptionerJs in your page

```html
<script src="/path/to/CaptionerJs.js"></script>
```

And finally add caption information to your images

```html
<img
    src="./images/chicory.jpg"
    role="caption"
    title="Chicory flower"
    alt="Common chicory, Cichorium intybus, is a somewhat woody, perennial herbaceous plant usually with bright blue flowers, rarely white or pink."
 />
```

CaptionerJs will be applied to all elements containing a ```role="caption"```

Configuration Options
--------------------------------------------------------------------------------
CaptionerJs can be configured using markup:

* __data-captioner-type__: the type of caption to show, defaults to ```static```
* __data-captioner-class__: the css class to add to the container element, defaults to ```CaptionerJs```
* __data-captioner-start-closed__: when showing an animated caption should it start open or closed, defaults to ```false```

Or JavaScript
```js
    $("img").CaptionerJs({
        type: "...",
        cls  : "...",
        options: {
            startClosed: ...
        }
    });
```
_If using the javascript option, do not set the_ ```role="caption"``` _attribute on your elements_

__Available Caption types__:
* __static__, the caption is on the lower end of the image
* __animated__, the same as static but the caption can be opened or closed
* __classic__, the caption is shown below the image

Why another caption plugin ?
--------------------------------------------------------------------------------

There are lots of caption plugins out there but CaptionerJs was propositally built to create clean and uncluttered HTML.

CaptionerJs won't burry your image inside layers of ```div's```, instead it makes use of ```figure``` and ```figcaption``` to produce uncluttered and semantically correct HTML.

You can write valid HTML, CaptionerJs will make use of ```title``` and ```alt```
attributes to create the caption

CaptionerJs is plugin based, you can easily add new caption types

Examples
-------------------------------------------------------------------------------
Point your browser to ```dist/demo/index.html``` to see it in action or visit
the [CaptionerJs home page](http://francodacosta.com/captionerJs)
