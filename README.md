flatKeys
=========

    npm install flatkeys

Flatten object key hierarchies into a list of strings using a custom separator. Used in [Konf](http://github.com/ricardobeat/konf) to populate a config object from `process.env` variables.

### Usage

    flatKeys({
        zero: {
            one: 1,
            two: {
                three: 3
            }
        }
    })

Returns the array

    [
        'zero'
        'zero_one'
        'zero_two'
        'zero_two_three'
    ]

### Options

    flatKeys(keys, {
        sep    : '_'         // separator
        snake  : true        // convert keys from camelCase to snake_case
        filter : toLowerCase // transformation function, defaults to `String.prototype.toLowerCase`
    })

Running the example above with `{ sep: ':', filter: String.prototype.toUpperCase }` would yield

    [
        'ZERO'
        'ZERO:ONE'
        'ZERO:TWO'
        'ZERO:TWO:THREE'
    ]

#### License

[MIT](http://ricardo.mit-license.org)
