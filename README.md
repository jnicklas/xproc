# XProc

XProc is a refinement for Ruby which allows you to write simple blocks using a
convenient shorthand syntax, inspired by Scala, Crystal and Elixir.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xproc'
```

## Usage

Since it's a refinement, you have to explicitly include it wherever you want to
use it. Use it like this:

``` ruby
require "xproc"

using XProc

["foo", "bar", "quox"].map(&x.gsub("oo", "aa")).select(&x.length <= 3)
# => ["faa", "bar"]
```

It is also possible to pull in XProc into the global namespace:

``` ruby
require "xproc/global"

["foo", "bar", "quox"].map(&x.gsub("oo", "aa")).select(&x.length <= 3)
# => ["faa", "bar"]
```

If your Ruby version does not support refinements you will have to do that.

You can also use positional arguments like this:

``` ruby
[1,2,3,4,5].reduce(&x1 * x2)
# => 120
```

And chain stuff

``` ruby
[1,2,3,4,5].map(&x * 2 + 1)
# => [3, 5, 7, 9, 11]

[123, 456].map(&x.to_s.reverse)
# => ["321", "654"]
```

It does this by recording all method calls on `x` and replaying them when the
proc is called.

## Limitations

The `x` or `x1`... **must** be the first expression after the `&` sign. This does not
work:

``` ruby
[1,2,3,4,5].reduce(&foo(x))
```

Any `x` passed as an argument must be a direct argument to another `x`. This does not
work:

``` ruby
[1,2,3,4,5].reduce([], &x1 + [x2])
[1,2,3,4,5].reduce([], &x1 + foo(x2))
[1,2,3,4,5].reduce([], &x1 + Foo.new(x2))
```

## Is it any good?

[No](https://news.ycombinator.com/item?id=3067434).

## License

[MIT](License.txt)
