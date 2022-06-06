# fizzfau-ui

UI Notification System

# exports

There are two basic exports, the important part is id logic.

- To draw notify
```
exports["fizzfau-ui"]:DrawNotify(id, text, color, icon)
```
- To clear it

```
  exports["fizzfau-ui"]:Clear(id)
```

# Examples

```
exports["fizzfau-ui"]:DrawNotify("fizzfau-ui:drawthetextplease", "Hello FiveM", rgba(0,0,0,0.0) or nil, " any fas fa icons" or nil)
```

```
  exports["fizzfau-ui"]:Clear("fizzfau-ui:drawthetextplease")
```

# IMPORTANT

If you want to use this in a while loop you need to check it with variable control like:

```
  if not send then
    send = true
    exports["fizzfau-ui"]:Clear("fizzfau-ui:drawthetextplease")
  end
```

otherwise resmon values can be higher and loads of notifications spams on screen.

css credit: nitros
