# Swiftography
Standard cryptographic algorithms in a Swift Playground
## CryptoJS
Swiftorgraphy leverages the [CryptoJS](https://code.google.com/p/crypto-js/) repository via JavaScriptCore framework. It is featured in a playground here but can transfered to a regular app as well.
## IDPF font obfuscation added
Font obfuscation in line with [IDPF EPUB standard](http://www.idpf.org/epub/30/spec/epub30-ocf.html#font-obfuscation) works to obfuscate and de-obfuscate fonts.
## Example
As you'll see in the playground all is self-explanatory and easy to use, simply write:
```
let str = "Hello Swift!"

Crypto.sha1(str) // "9c602d242f2ecedff6dd3703576e1fa39aa25706"
Crypto.sha224(str) // "807db20e8e9f401114c7d542609bda14b8ebcb723f662cc14602ee96"
Crypto.sha256(str) // "bf452d84b203dfe67b45f1d73be4866f2552f8414eff79452375a467f02e30d7"
Crypto.sha384(str) // "f1a8c74940995d34dc90b7972c50c36c1a5e9137c723aeacf0e11d527f63f487f96707c339e58e9a210cc2084243b028"
Crypto.sha512(str) // "636130e3878c8c47ee266849d8c8754481dae9018a32f74ac13a7773390dfee02e7472fb7caa1c1a33e846bcc16204e895ddd11dd8175e87f3b2451b7326c03f"
Crypto.sha3(str) // "f23a824632ba5a27fc2d7bf3683032acb27862eb49d7bce825c75f86a52a2b123aab3c76035fab5a5aad01b0cc0c495b2140198260a0e7441ba9235f26795338"
Crypto.md5(str) // "ba135edf6168271dfe4ed79e719e8188"
Crypto.ripemd160(str) // "1c87b79ebcb075d87242486fe0e8e43b9ccdd311"
```
In addition to common crypotography algorithms, repo now includes IDPF EPUB standard font obfuscation.
```
// IDPF font obfuscation
if let url = NSBundle.mainBundle().URLForResource("Lobster-Regular", withExtension: "ttf"),
    source = NSData(contentsOfURL: url) {
        // obfuscate font using IDPF approach
        let obFont = obfuscateFontIDPF(source,"urn:uuid:9A6376C9-9E0A-4BA4-87CE-667AA91A70DE")
        obFont == source // false, font has been obfuscated
        obfuscateFontIDPF(obFont,"urn:uuid:9A6376C9-9E0A-4BA4-87CE-667AA91A70DE") == source // true, font has been obfuscated back to original state
}
```
