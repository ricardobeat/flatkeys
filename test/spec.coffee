assert = require 'assert'
flatKeys = require '../'

suite 'flatKeys', ->

    test 'is a function', ->
        assert typeof flatKeys is 'function'

    test 'flattens nested keys', ->
        assert.deepEqual flatKeys({
            one: 1
            two:
                deep1: 1
                deep2: 2
                three:
                    deep3: 3
            four:
                deep4: 4
                deep5: 5
                five: six: seven: end: yes
        }), [
            'one'
            'two_deep1'
            'two_deep2'
            'two_three_deep3'
            'four_deep4'
            'four_deep5'
            'four_five_six_seven_end'
        ]

    test 'ignores arrays', ->
        assert.deepEqual flatKeys({
            one: 1
            two:
                deep1: 1
                deep2: 2
                three:
                    deep3: [1,2,3]
                    deep4: yes
        }), [
            'one'
            'two_deep1'
            'two_deep2'
            'two_three_deep3'
            'two_three_deep4'
        ]

    test 'converts to lowercase by default', ->
        assert.deepEqual flatKeys({
            ONE: 1
            TWO: THREE: 3
        }), [
            'one'
            'two_three'
        ]

    test 'converts camelCase to snake_case', ->
        assert.deepEqual flatKeys({
            oneThing: on
            nestedThing: otherThing: 1
        }), [
            'one_thing'
            'nested_thing_other_thing'
        ]

    test 'preserves existing separator', ->
        assert.deepEqual flatKeys({
            one_thing: 1
            one_moreThing: 2
        }), [
            'one_thing'
            'one_more_thing'
        ]

    test 'can use a custom separator', ->
        assert.deepEqual flatKeys({ one: two: three: 1 }, { sep: ':' }), ['one:two:three']
        assert.deepEqual flatKeys({ one: two: three: 1 }, { sep: '::' }), ['one::two::three']
        assert.deepEqual flatKeys({ zero: 0, one: two: three: 1 }, { sep: '%' }), ['zero', 'one%two%three']

    test 'preserves existing custom separator', ->
        assert.deepEqual flatKeys({
            'one-thing': 1
            'one-moreThing': 2
        }, { sep: '-' }), [
            'one-thing'
            'one-more-thing'
        ]

    test 'without a filter', ->
        assert.deepEqual flatKeys({
            'aBcDEfG': 1
        }, { filter: false, snake: false }), [
            'aBcDEfG'
        ]
