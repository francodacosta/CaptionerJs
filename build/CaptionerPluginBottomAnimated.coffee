class CaptionerPluginBottomAnimated extends AbstractPlugin
    constructor: (@el, @title, @description, @options) ->
        super(@el, @title, @description, @options)

        wrapper = @wrapElement("bottom-animated")


        caption = $("""
            <figcaption class="closed">
                #{@generateTitleHtml(@title)}
                #{@generateCloseButtonHtml()}
                #{@generateDescriptionHtml(@description)}
            </figcaption>
        """)

        caption.hide();
        wrapper.append(caption)
        @captionHeight = caption.outerHeight()
        caption.css({bottom: -@captionHeight })

        @openCloseCaption(caption)
        window.setTimeout ->
            caption.show()
            caption.click()
        , 100

    openCloseCaption: (caption) ->

        me = @
        caption.on('click', ->
            if caption.hasClass('closed') is true
                caption.removeClass('closed')
                caption.addClass('open')
                caption.css('bottom', 0)
                return

            # it is important to set the classes before computing styles
            # to make sure we get the correct styles
            caption.addClass('closed')
            caption.removeClass('open')
            caption.css('bottom',  -1 * me.captionHeight + caption.find('.caption-title').position().top + caption.find('.caption-title').outerHeight() )

        )

    generateCloseButtonHtml: ->

        return """<span class="caption-actions caption-close">&caron;</span><span class="caption-actions caption-open">&circ;</span>"""
