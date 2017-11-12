# custom-slack-css

A custom CSS for Slack App users

### What, why

Slack is a wonderful and productive app. Its visual design is well conceived IOHO. However, we find some design decisions do not match our expectations, and some hinder our productivity. Thus, we chose to customize Slack by overriding its default style.

This repository is created and maintained by individuals who work with Slack and whose work productivity is of high priority.

Unfortunately Slack does not support custom CSS and we must rely on a hack.

### Dear Slack!

We appreciate your product and use it daily for work. Please consider allowing users to apply custom CSS, even if that means letting users shoot themselves in the foot. Thank you!

### How

At this time Slack does not officially support custom CSS injection. The following is a hack, known to work on Slack `2.8.2`. There is no guarantee it will work on any other version.

Append the following JavaScript code to the end of your local file:
- `/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js` (MacOS/X)
- `/usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js` (Debian/Ubuntu)

```JavaScript
// The following JavaScript snippet was authored by Jonathan la Cour, https://github.com/lacour
// and released to the public domain under CC0 (https://directory.fsf.org/wiki/License:CC0)
document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   url: 'https://raw.githubusercontent.com/openark/custom-slack-css/master/custom.css',
   success: function(css) {
     $("<style></style>").appendTo('head').html(css);
   }
 });
});
```

If you cloned this repository locally, you may:

```shell
cat slack-hack.js >> /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
```

on Mac OS/X, or:

```shell
cat slack-hack.js >> /usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js
```

on Debian/Ubuntu.

### What happens on Slack upgrade?

Either:

- The file you've appended the JavaScript code to is overwritten, and you will need to re-append the JavaScript code; or:
- Slack completely changes the file names and we'll need to look for a different place to add this hack; or:
- Slack completely change their CSS paths, classes, and DOM structure, and we'll need to figure out everything from the beginning.

We will try and maintain this repository through next Slack versions. It is quite possible you will need to run a different flow, and import different files, per version.

### Credits

The JavaScript hack was proposed by Jonathan la Cour ([@laCour](https://github.com/laCour)), author of  [slack-night-mode](https://github.com/laCour/slack-night-mode), in [this issue](https://github.com/laCour/slack-night-mode/issues/73#issuecomment-287467332). @laCour released the JavaScript snippet to the public domain under [CC0](https://www.gnu.org/licenses/license-list.html#CC0).

### Contributions

At this time, potentially temporarily, this repository is not open to public contributions. The reasoning is:

- We want to create a custom CSS that works for us.
- Others will have different opinion on what works best.
- Slack's CSS is an enormous playground. We could end up with bloated CSS files, and we wish to avoid that.
- So we stick to a reasonable small changeset.

Having said that, let's see how this repo plays.

### License

This repository is released under the [MIT](LICENSE) license.
