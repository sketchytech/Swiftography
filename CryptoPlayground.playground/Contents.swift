//: Playground - noun: a place where people can play

import UIKit
let str = "Hello Swift!"

Crypto.sha1(str)
Crypto.sha224(str)
Crypto.sha256(str)
Crypto.sha384(str)
Crypto.sha512(str)
Crypto.sha3(str)
Crypto.md5(str)
Crypto.ripemd160(str)

// IDPF font obfuscation
if let url = NSBundle.mainBundle().URLForResource("Lobster-Regular", withExtension: "ttf"),
    source = NSData(contentsOfURL: url) {
        // obfuscate font using IDPF approach
        let obFont = obfuscateFontIDPF(source,"urn:uuid:9A6376C9-9E0A-4BA4-87CE-667AA91A70DE")
        obFont == source // false, font has been obfuscated
        obfuscateFontIDPF(obFont,"urn:uuid:9A6376C9-9E0A-4BA4-87CE-667AA91A70DE") == source // true, font has been obfuscated back to original state
}