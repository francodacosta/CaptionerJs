class AbstractPlugin
    constructor: (@el, @title, @description, @options) ->

    wrapElement: (cls) =>

        wrapper = @el.wrap("""<figure class="#{@options.cls}-container #{cls}" itemscope="itemscope" itemtype="http://schema.org/Photograph"></figure>""").parent()
        wrapper.width(@el.attr('width') || @el[0].style.width || @el.width())
        @el.css({width: '100%'})
        @el.attr('itemprop', 'image')
        @el.attr('width', '')

        return wrapper

    generateTitleHtml: (title) ->
        if not title
            return ''

        return """<span class="caption-title"  itemprop="name" >#{title}</span>"""

    generateDescriptionHtml: (description) ->
        if not description
            return ''

        return """<span class="caption-description"  itemprop="description" >#{description}</span>"""
