CaptionerJs
==============================================================================
Beautiful and semantically correct captions

Getting Started
-------------------------------------------------------------------------------
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



Why another caption plugin ?
-------------------------------------------------------------------------------
There are lots of caption plugins out there but CaptionerJs was built with code quality in mind.

CaptionerJs won't burry your image inside layers of ```div's```, instead it makes use of ```figure``` and
 ```figcaption``` to produce uncluttered and semantically correct HTML.

You can write valid HTML, CaptionerJs will make use of ```title``` and ```alt```
attributes to create the caption

CaptionerJs is plugin based, you can easily add new caption types

Examples
-------------------------------------------------------------------------------
Point your browser to ```dist/demo/index.html``` to see it in action or visit
the [CaptionerJs home page](http://francodacosta.com/captionerJs)
