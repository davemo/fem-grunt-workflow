# we want to abstract away "extend", because it's conflated with _.extend and Coffee's "extends"

root = this
root.def = root.extend
