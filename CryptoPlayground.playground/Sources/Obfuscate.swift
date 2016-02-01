import Foundation


public func obfuscateFontIDPF(data:NSData, key:String) -> NSData {
    // convert string to data
    // now do obfuscation
    let source = data
    var destination = [UInt8]()
    var keyData =  sha1data(key)
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
          
            let obfuscatedByte = (sourceByte ^ keyByte)
          
            destination.append(obfuscatedByte)
            inner++
        }
        
        outer++
    }
    
    destination.appendContentsOf(arr)
    let newData = NSData(bytes: &destination, length: destination.count*sizeof(UInt8))
    arr.removeAll(keepCapacity: false)
    return newData
}

// thanks to this SO response for strtod http://stackoverflow.com/questions/24031621/swift-how-to-convert-string-to-double/27144221?stw=2#27144221
public func sha1data(str:String) -> [UInt8] {
    var keydata = ""
    var dataArray = [UInt8]()
    if let crypto = Crypto.sha1(str) {
        keydata = crypto
        for _ in 0.stride(to: keydata.characters.count, by: 2) {
            var str = "0x\(keydata.characters.first!)"
            keydata.removeAtIndex(keydata.startIndex)
            str.append(keydata.characters.first!)
            keydata.removeAtIndex(keydata.startIndex)
            dataArray.append(UInt8(strtod(str,nil)))
        }
    }
    return dataArray
}