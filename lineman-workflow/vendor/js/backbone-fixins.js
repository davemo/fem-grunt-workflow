
/*
 backbone-fixins 0.0.1

 Boilerplate that strengthens your backbone

 site: https://github.com/testdouble/backbone-fixins
*/


(function() {
  var fixins, ogConfig, root, superView, _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  root = this;

  if (root.Backbone == null) {
    throw "backbone-fixins requires Backbone. Make sure you load Backbone first";
  }

  (_base = root.Backbone).Fixins || (_base.Fixins = {});

  /*
  Extendable Configuration.

  Feel free to override the configuration to suit your project's needs.
  */


  root = this;

  fixins = root.Backbone.Fixins;

  fixins.configuration = ogConfig = {
    templateFunction: function(name) {
      return root.JST[name];
    },
    defaultTemplateContext: function(view) {
      var _ref;
      return ((_ref = view.model || view.collection) != null ? _ref.toJSON() : void 0) || {};
    },
    defaultTemplateLocator: function(view) {
      var name;
      name = fixins.helpers.constructorNameOf(view);
      return "templates/" + (fixins.helpers.titleToSnakeCase(name));
    }
  };

  fixins.configure = function(customConfigurationObject) {
    return fixins.configuration = fixins.helpers.merge(fixins.configuration, customConfigurationObject);
  };

  fixins.resetConfiguration = function() {
    return fixins.configuration = ogConfig;
  };

  /*
  # Random helpers. Pretend these are private, but I won't hide them
  #   in the event you have a really good reason to override them.
  */


  Backbone.Fixins.helpers = {
    constructorNameOf: function(obj) {
      var results;
      results = /function (.{1,})\(/.exec(obj.constructor.toString());
      if (results && results.length > 1) {
        return results[1];
      } else {
        return "";
      }
    },
    titleToSnakeCase: function(titleCasedString) {
      return titleCasedString.replace(/([a-z\d])([A-Z]+)/g, '$1_$2').replace(/[-\s]+/g, '_').toLowerCase();
    },
    startsWith: function(str, options) {
      var starts;
      starts = options.butIsntExactly;
      return str.length > starts.length && str.substr(0, starts.length) === starts;
    },
    merge: function(orig, newStuff) {
      return _(orig).chain().clone().extend(newStuff).value();
    }
  };

  /*
  Backbone.Fixins.SuperView

  Intended to be a view from which each application view will extend in order to DRY
    up the typical housekeeping normally carried out by Backbone.View subclasses (e.g.
    find template, plug in serialized context, render markup into element)
  */

  var fixins, root, superView,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  root = this;

  fixins = root.Backbone.Fixins;

  Backbone.Fixins.SuperView = (function(_super) {

    __extends(SuperView, _super);

    function SuperView() {
      this.render = __bind(this.render, this);
      return SuperView.__super__.constructor.apply(this, arguments);
    }

    SuperView.prototype.render = function() {
      var context, f, template, _i, _len, _ref;
      template = fixins.configuration.templateFunction(superView.locateTemplate(this));
      context = superView.templateContext(this);
      this.$el.html(template(context));
      _ref = _(this).functions();
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        f = _ref[_i];
        if (fixins.helpers.startsWith(f, {
          butIsntExactly: "render"
        })) {
          this[f]();
        }
      }
      return this.trigger('rendered');
    };

    return SuperView;

  })(root.Backbone.View);

  superView = {
    templateContext: function(view) {
      if (view.templateContext != null) {
        return (typeof view.templateContext === "function" ? view.templateContext() : void 0) || view.templateContext;
      } else {
        return fixins.configuration.defaultTemplateContext(view);
      }
    },
    locateTemplate: function(view) {
      if (view.template != null) {
        return (typeof view.template === "function" ? view.template() : void 0) || view.template;
      } else {
        return fixins.configuration.defaultTemplateLocator(view);
      }
    }
  };

}).call(this);
