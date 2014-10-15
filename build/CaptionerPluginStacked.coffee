class CaptionerPluginStacked extends AbstractPlugin
    constructor: (@el, @title, @description, @options, cls) ->
        super(@el, @title, @description, @options)

        wrapper = @wrapElement(cls || "stacked")

        template = """
            <figcaption>
                #{@generateTitleHtml(@title)}
                #{@generateDescriptionHtml(@description)}
            </figcaption>
        """
        wrapper.append($(template))
