JavaScript Callback Invalidation
================================

When dealing with AJAX or other asynchronous calls, it is possible that you may need to created a second request while previous requests have not yet returned. In order to avoid responses returning out of order, these previous requests' callbacks need to be invalidated or ignored. This is simple to do, yet will clutter up your classes or event handlers more than needed.

Usage
=====

Create a new `CallbackInvalidator` for each unique type of asynchronous call being made. For example, if you have a collection that fetches data from a server, create a `CallbackInvalidator` for it.

```javascript
this.invalidator = new CallbackInvalidator();
```

Then, whenver you need to run an async call that invalidates previous executions, first call `invalidator.reset`:

```javascript
this.invalidator.reset();
```

Then, add your callback, and pass the value returned from `invalidator.add()` to the async call:

```javascript
$.ajax({
  url: "test.html"
}).done(this.invalidator.add(function() {
  // ...
}, this));
```

Notes
=====

For your convenience, you may pass the scope of the callback method as the second argument of `invalidator.add()`.