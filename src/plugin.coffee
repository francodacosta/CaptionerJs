( ($) ->

    $(document).ready( ->
        # console.log @.find('[role=labeler]')
        $(document).find('[role=caption]').each((index, el)->
            $(el).CaptionerJs()
        )
    )

    $.fn.CaptionerJs = (options)->
        title = decodeURIComponent (@.attr('title') || @.attr('data-title') || '')
        description = decodeURIComponent(@attr('alt') || @attr('data-description') || '')

        options = options || {}
        defaultOptions =
            type: @data('captioner-type') || 'static'
            cls  :  @data('captioner-class') || 'CaptionerJs'
            options:
                startClosed: @data('captioner-start-closed') || false

        options = $.extend({}, defaultOptions, options)

        l = new CaptionerJs @, options
        l.addCaption(title, description);

        return @

    return

)(jQuery)
