class CaptionerJs

    constructor: (@el, options) ->
        defaultOptions =
            type : 'animated'
            cls  : 'CaptionerJs'
            options:
                startClosed: true

        @options = $.extend({}, defaultOptions, options)

    addCaption: (title, description) ->
        console.log @el
        if @el.attr('data-captioner-enabled')
            return

        @el.attr('data-captioner-enabled', true)

        if 'stacked' == @options.type
            return new CaptionerPluginStacked(@el, title, description, @options, 'stacked')

        if 'static' == @options.type
            return new CaptionerPluginStacked(@el, title, description, @options, 'static')

        if 'animated' == @options.type
            return new CaptionerPluginBottomAnimated(@el, title, description, @options)

        throw new Error('Invalid caption type : ' + @options.type)

    removeCaption: () ->
        @el.attr('data-captioner-enabled', false)
        @el.find('figcaption').remove()
        @el.unrap()
