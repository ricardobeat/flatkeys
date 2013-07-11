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

function toSnakeCase (str, sep) {
    return str.replace(/([a-z])([A-Z])/g, '$1'+sep+'$2')
}

function flatKeys (obj, options) {

    var options = options        || {}
      , sep     = options.sep    || '_'
      , snake   = options.snake  != null ? options.snake  : true
      , filter  = options.filter != null ? options.filter : String.prototype.toLowerCase

    return Object.keys(obj).reduce(function(keys, key){

        var _key = snake ? toSnakeCase(key, sep) : key
          , value = obj[key]

        if (typeof filter === 'function') _key = filter.call(_key)

        isObject(value)
            ? push.apply(keys, flatKeys(value, options).map(prefix(_key + sep)))
            : push.call(keys, _key)
        return keys

    }, [])
}

module.exports = flatKeys
