class AbstractPlugin
    constructor: (@el, @title, @description, @options) ->

    wrapElement: (cls) =>
        console.log '@el[0].style.width', @el.attr('width') || @el[0].style.width || @el.width()
        wrapper = @el.wrap("<figure class='#{@options.cls}-container #{cls}'></figure>").parent()
        wrapper.width(@el.attr('width') || @el[0].style.width || @el.width())
        @el.css({width: '100%'})

        return wrapper

    generateTitleHtml: (title) ->
        if not title
            return ''

        return """<span class="caption-title">#{title}</span>"""

    generateDescriptionHtml: (description) ->
        if not description
            return ''

        return """<span class="caption-description">#{description}</span>"""
