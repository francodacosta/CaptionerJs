( ($) ->

    $(document).ready( ->
        # console.log @.find('[role=labeler]')
        $(document).find('[data-captioner]').each((index, el)->
            $(el).captioner()
        )
    )

    $.fn.captioner = (title, description)->
        title = decodeURIComponent (title || @.attr('title') || @.attr('data-title') || '')
        description = decodeURIComponent(description || @attr('alt') || @attr('data-description') || '')


        options =
            type: @data('captioner-type') || 'stacked'

        l = new CaptionerJs @, options
        l.addCaption(title, description);

        return @

    return

)(jQuery)
