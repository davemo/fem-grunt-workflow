# we want to abstract away "extend", because it's conflated with _.extend and Coffee's "extends"

root = this
root.def = _(extend).wrap (ex, args...) ->
  [namespace, target] = args
  unless typeof(target) is "object"
    target.prototype.namespacePath = namespace
  ex.apply(this, args)
