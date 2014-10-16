( ($) ->

    $(document).ready( ->
        # console.log @.find('[role=labeler]')
        $(document).find('[role=caption]').each((index, el)->
            $(el).captioner()
        )
    )

    $.fn.captioner = (title, description)->
        title = decodeURIComponent (title || @.attr('title') || @.attr('data-title') || '')
        description = decodeURIComponent(description || @attr('alt') || @attr('data-description') || '')


        options =
            type: @data('captioner-type') || 'static'
            cls  :  @data('captioner-class') || 'CaptionerJs'
            options:
                startClosed: @data('captioner-start-closed') || true


        l = new CaptionerJs @, options
        l.addCaption(title, description);

        return @

    return

)(jQuery)
