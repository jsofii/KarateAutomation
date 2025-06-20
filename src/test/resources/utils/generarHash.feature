Feature: Generar hash MD5

  Scenario: Generar hash de un string
    * def crypto = Java.type('java.security.MessageDigest')
    * def bytes = function(s) crypto.getInstance('MD5').digest(s.getBytes('UTF-8'))
    * def toHex = function(b) b.map(x => ('0' + (x & 0xff).toString(16)).slice(-2)).join('')
    * def generarHash = function(input) toHex(bytes(input))
