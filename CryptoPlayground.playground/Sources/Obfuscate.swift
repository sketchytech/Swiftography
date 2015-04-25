import Foundation



extension String {
    
    // From Rob on Stack overflow http://stackoverflow.com/a/26502285/1694526
    /// Create NSData from hexadecimal string representation
    ///
    /// This takes a hexadecimal representation and creates a NSData object. Note, if the string has any spaces, those are removed. Also if the string started with a '<' or ended with a '>', those are removed, too. This does no validation of the string to ensure it's a valid hexadecimal string
    ///
    /// The use of `strtoul` inspired by Martin R at http://stackoverflow.com/a/26284562/1271826
    ///
    /// :returns: NSData represented by this hexadecimal string. Returns nil if string contains characters outside the 0-9 and a-f range.
    
    func dataFromHexadecimalString() -> NSData? {
        let trimmedString = self.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "<> ")).stringByReplacingOccurrencesOfString(" ", withString: "")
        
        // make sure the cleaned up string consists solely of hex digits, and that we have even number of them
        
        var error: NSError?
        let regex = NSRegularExpression(pattern: "^[0-9a-f]*$", options: .CaseInsensitive, error: &error)
        let found = regex?.firstMatchInString(trimmedString, options: nil, range: NSMakeRange(0, count(trimmedString)))
        if found == nil || found?.range.location == NSNotFound || count(trimmedString) % 2 != 0 {
            return nil
        }
        
        // everything ok, so now let's build NSData
        
        let data = NSMutableData(capacity: count(trimmedString) / 2)
        
        for var index = trimmedString.startIndex; index < trimmedString.endIndex; index = index.successor().successor() {
            let byteString = trimmedString.substringWithRange(Range<String.Index>(start: index, end: index.successor().successor()))
            let num = UInt8(byteString.withCString { strtoul($0, nil, 16) })
            data?.appendBytes([num] as [UInt8], length: 1)
        }
        
        return data
    }
}


func sha1data(key:String) -> [UInt8]? {
    if let source = Crypto.sha1(key) {
        var start = source.startIndex
        var end = advance(start,2)
        var dataArray = [NSData]()
        var data = NSMutableData()
        while end < source.endIndex {
            end = advance(start,2)
            
            if let dataAdd = source[start..<end].dataFromHexadecimalString() {
                data.appendData(dataAdd)
            }
            start = advance(start,2)
            
        }
        var arr = [UInt8](count: data.length, repeatedValue: 0)
        data.getBytes(&arr, length:data.length)
        return arr
    }
return nil
}


public func obfuscateFontIDPF(data:NSData, key:String) -> NSData {
    // convert string to data
    // now do obfuscation
    let source = data
    var destination = [UInt8]()
    let keyData =  sha1data(key)!
    var arr = [UInt8](count: source.length, repeatedValue: 0)
    source.getBytes(&arr, length:source.length)
    arr.count
    var outer = 0
    while outer < 52 && arr.isEmpty == false {
        var inner = 0
        while inner < 20 && arr.isEmpty == false {
            let byte = arr.removeAtIndex(0)      //Assumes read advances file position
            let sourceByte = byte
            let keyByte = keyData[inner]
          //  println(keyByte)
            let obfuscatedByte = (sourceByte ^ keyByte)
            destination.append(obfuscatedByte)
            inner++
        }
        
        outer++
    }
    
    destination.extend(arr)
    let newData = NSData(bytes: &destination, length: count(destination)*sizeof(UInt8))
    arr.removeAll(keepCapacity: false)
    return newData
}

