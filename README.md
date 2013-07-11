flatKeys
=========

    npm install flatkeys

Flatten object key hierarchies into a list of strings using a custom separator. Used in [Konf](http://github.com/ricardobeat/konf) to populate a config object from `process.env` variables.

    flatKeys({
        zero: {
            one: 1,
            two: {
                three: 3
            }
        }
    })

    /*
    [
        'zero'
        'zero_one'
        'zero_two'
        'zero_two_three'
    ]
    */

#### License

[MIT](http://ricardo.mit-license.org)
