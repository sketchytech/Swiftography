import Foundation


// thanks to this SO response for strtod http://stackoverflow.com/questions/24031621/swift-how-to-convert-string-to-double/27144221?stw=2#27144221
func sha1data(str:String) -> [UInt8] {
    var keydata = ""
    var dataArray = [UInt8]()
    if let crypto = Crypto.sha1(str) {
        keydata = crypto
        for i in stride(from: 0, to: count(keydata), by: 2) {
            var str = "0x\(first(keydata)!)"
            keydata.removeAtIndex(keydata.startIndex)
            str.append(first(keydata)!)
            keydata.removeAtIndex(keydata.startIndex)
            dataArray.append(UInt8(strtod(str,nil)))
        }
    }
    return dataArray
}


public func obfuscateFontIDPF(data:NSData, key:String) -> NSData {
    // convert string to data
    // now do obfuscation
    let source = data
    var destination = [UInt8]()
    let keyData =  sha1data(key)
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

