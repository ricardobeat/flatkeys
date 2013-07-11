var push     = Array.prototype.push
  , toString = Object.prototype.toString

function isObject (o) {
    return toString.call(o) === '[object Object]'
}

function prefix (pref) {
    return function (str) {
        return pref + str
    }
}

function flatKeys (obj, sep) {
    var sep = sep || '_', value

    return Object.keys(obj).reduce(function(keys, key){
        isObject(value = obj[key])
            ? push.apply(keys, flatKeys(value, sep).map(prefix(key + sep)))
            : push.call(keys, key)
        return keys
    }, [])
}

module.exports = flatKeys
