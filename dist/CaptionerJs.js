(function() {
  var AbstractPlugin, CaptionerJs, CaptionerPluginBottomAnimated, CaptionerPluginStacked,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  AbstractPlugin = (function() {
    function AbstractPlugin(el, title, description, options) {
      this.el = el;
      this.title = title;
      this.description = description;
      this.options = options;
      this.wrapElement = __bind(this.wrapElement, this);
    }

    AbstractPlugin.prototype.wrapElement = function(cls) {
      var wrapper;
      console.log('@el[0].style.width', this.el.attr('width') || this.el[0].style.width || this.el.width());
      wrapper = this.el.wrap("<figure class='" + this.options.cls + "-container " + cls + "'></figure>").parent();
      wrapper.width(this.el.attr('width') || this.el[0].style.width || this.el.width());
      this.el.css({
        width: '100%'
      });
      return wrapper;
    };

    AbstractPlugin.prototype.generateTitleHtml = function(title) {
      if (!title) {
        return '';
      }
      return "<span class=\"caption-title\">" + title + "</span>";
    };

    AbstractPlugin.prototype.generateDescriptionHtml = function(description) {
      if (!description) {
        return '';
      }
      return "<span class=\"caption-description\">" + description + "</span>";
    };

    return AbstractPlugin;

  })();

  CaptionerJs = (function() {
    function CaptionerJs(el, options) {
      var defaultOptions;
      this.el = el;
      defaultOptions = {
        type: 'animated',
        cls: 'CaptionerJs',
        options: {
          startClosed: true
        }
      };
      this.options = $.extend({}, defaultOptions, options);
    }

    CaptionerJs.prototype.addCaption = function(title, description) {
      console.log(this.el);
      if (this.el.attr('data-captioner-enabled')) {
        return;
      }
      this.el.attr('data-captioner-enabled', true);
      if ('stacked' === this.options.type) {
        return new CaptionerPluginStacked(this.el, title, description, this.options, 'stacked');
      }
      if ('static' === this.options.type) {
        return new CaptionerPluginStacked(this.el, title, description, this.options, 'static');
      }
      if ('animated' === this.options.type) {
        return new CaptionerPluginBottomAnimated(this.el, title, description, this.options);
      }
      throw new Error('Invalid caption type : ' + this.options.type);
    };

    CaptionerJs.prototype.removeCaption = function() {
      this.el.attr('data-captioner-enabled', false);
      this.el.find('figcaption').remove();
      return this.el.unrap();
    };

    return CaptionerJs;

  })();

  CaptionerPluginBottomAnimated = (function(_super) {
    __extends(CaptionerPluginBottomAnimated, _super);

    function CaptionerPluginBottomAnimated(el, title, description, options) {
      var caption, wrapper;
      this.el = el;
      this.title = title;
      this.description = description;
      this.options = options;
      CaptionerPluginBottomAnimated.__super__.constructor.call(this, this.el, this.title, this.description, this.options);
      wrapper = this.wrapElement("bottom-animated");
      caption = $("<figcaption class=\"closed\">\n    " + (this.generateTitleHtml(this.title)) + "\n    " + (this.generateCloseButtonHtml()) + "\n    " + (this.generateDescriptionHtml(this.description)) + "\n</figcaption>");
      caption.hide();
      wrapper.append(caption);
      this.captionHeight = caption.outerHeight();
      caption.css({
        bottom: -this.captionHeight
      });
      this.openCloseCaption(caption);
      window.setTimeout(function() {
        caption.show();
        return caption.click();
      }, 100);
    }

    CaptionerPluginBottomAnimated.prototype.openCloseCaption = function(caption) {
      var me;
      me = this;
      return caption.on('click', function() {
        if (caption.hasClass('closed') === true) {
          caption.removeClass('closed');
          caption.addClass('open');
          caption.css('bottom', 0);
          return;
        }
        caption.addClass('closed');
        caption.removeClass('open');
        return caption.css('bottom', -1 * me.captionHeight + caption.find('.caption-title').position().top + caption.find('.caption-title').outerHeight());
      });
    };

    CaptionerPluginBottomAnimated.prototype.generateCloseButtonHtml = function() {
      return "<span class=\"caption-actions caption-close\">&caron;</span><span class=\"caption-actions caption-open\">&circ;</span>";
    };

    return CaptionerPluginBottomAnimated;

  })(AbstractPlugin);

  CaptionerPluginStacked = (function(_super) {
    __extends(CaptionerPluginStacked, _super);

    function CaptionerPluginStacked(el, title, description, options, cls) {
      var template, wrapper;
      this.el = el;
      this.title = title;
      this.description = description;
      this.options = options;
      CaptionerPluginStacked.__super__.constructor.call(this, this.el, this.title, this.description, this.options);
      wrapper = this.wrapElement(cls || "stacked");
      template = "<figcaption>\n    " + (this.generateTitleHtml(this.title)) + "\n    " + (this.generateDescriptionHtml(this.description)) + "\n</figcaption>";
      wrapper.append($(template));
    }

    return CaptionerPluginStacked;

  })(AbstractPlugin);

  (function($) {
    $(document).ready(function() {
      return $(document).find('[role=caption]').each(function(index, el) {
        return $(el).captioner();
      });
    });
    $.fn.captioner = function(title, description) {
      var l, options;
      title = decodeURIComponent(title || this.attr('title') || this.attr('data-title') || '');
      description = decodeURIComponent(description || this.attr('alt') || this.attr('data-description') || '');
      options = {
        type: this.data('captioner-type') || 'stacked'
      };
      l = new CaptionerJs(this, options);
      l.addCaption(title, description);
      return this;
    };
  })(jQuery);

}).call(this);
