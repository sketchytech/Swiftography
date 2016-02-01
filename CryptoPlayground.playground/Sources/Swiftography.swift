import Foundation
import JavaScriptCore

public struct Crypto {
    public static func aes(data:String, password:String, iv:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("aes", withExtension: "js") {
            var a:JSValue?
            do {
                let js = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                // First a context and JS virtual machine is created
                let context = JSContext(virtualMachine: JSVirtualMachine())
                
                // Next we send the context the script
                context.evaluateScript(js)
                
                // generate JSValue
                a = context.evaluateScript("CryptoJS.AES.encrypt('\(data)','\(password)')")
                
            }
            catch {
                
            }
            return a!.toString()
            
            
        }
        else {
            return nil
        }
    }

    public static func sha1(str:String) -> String? {

        if let url = NSBundle.mainBundle().URLForResource("sha1", withExtension: "js") {
            var a:JSValue?
            do {
                 let js = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                // First a context and JS virtual machine is created
                let context = JSContext(virtualMachine: JSVirtualMachine())
                
                // Next we send the context the script
                context.evaluateScript(js)
                
                // generate JSValue
                a = context.evaluateScript("CryptoJS.SHA1('\(str)')")

            }
            catch {
                
            }
                return a!.toString()
            
        
    }
        else {
            return nil
        }
}
    
    public static func md5(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("md5", withExtension: "js")
        {
    var a:JSValue?
    do {
        let js = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
        // First a context and JS virtual machine is created
        let context = JSContext(virtualMachine: JSVirtualMachine())
        
        // Next we send the context the script
        context.evaluateScript(js)
        // generate JSValue
        a = context.evaluateScript("CryptoJS.MD5('\(str)')")
        
    }
    catch {
        
    }
    
    return a!.toString()
                
        }
        else {
            return nil
        }
    }
    
    public static func sha3(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("sha3", withExtension: "js")
{
        var a:JSValue?
    do {
                    let js = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
        // First a context and JS virtual machine is created
        let context = JSContext(virtualMachine: JSVirtualMachine())
        
        // Next we send the context the script
        context.evaluateScript(js)
        // generate JSValue
        a = context.evaluateScript("CryptoJS.SHA3('\(str)')")
    }
    catch {
        
    }
    
    
                return a!.toString()
                
        }
        else {
            return nil
        }
    }
    public static func sha224(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("sha224", withExtension: "js")
         {
            var a:JSValue?
            do {
                let js = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                // First a context and JS virtual machine is created
                let context = JSContext(virtualMachine: JSVirtualMachine())
                
                // Next we send the context the script
                context.evaluateScript(js)
                // generate JSValue
                a = context.evaluateScript("CryptoJS.SHA224('\(str)')")
            }
            catch {
                
            }
            
                
            
            return a!.toString()
                
        }
        else {
            return nil
        }
    }
    public static func sha256(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("sha256", withExtension: "js")
            {var a:JSValue?
                do {

                    let js = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                    // First a context and JS virtual machine is created
                    let context = JSContext(virtualMachine: JSVirtualMachine())
                    
                    // Next we send the context the script
                    context.evaluateScript(js)
                    
                    // generate JSValue
                    a = context.evaluateScript("CryptoJS.SHA256('\(str)')")
                }
                catch {
                    
                }
                
                return a!.toString()
                
        }
        else {
            return nil
        }
    }
    public static func sha384(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("sha384", withExtension: "js")
             {
  
                    var a:JSValue?
                do {
                    let js = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                    // First a context and JS virtual machine is created
                    let context = JSContext(virtualMachine: JSVirtualMachine())
                    
                    // Next we send the context the script
                    context.evaluateScript(js)
                    
                    // generate JSValue
                     a = context.evaluateScript("CryptoJS.SHA384('\(str)')")

                }
                catch {
                    
                }
                return a!.toString()
                
        }
        else {
            return nil
        }
    }
    public static func sha512(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("sha512", withExtension: "js") {
            var a:JSValue?
            do {


         let js = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
            // First a context and JS virtual machine is created
            let context = JSContext(virtualMachine: JSVirtualMachine())
            
            // Next we send the context the script
            context.evaluateScript(js)
            
            // generate JSValue
            a = context.evaluateScript("CryptoJS.SHA512('\(str)')")
        }
        catch {
            
        }

                return a!.toString()
                
        }
        else {
            return nil
        }
    }
    public static func ripemd160(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("ripemd160", withExtension: "js")
             {
                var a:JSValue?
                do {
                    let js = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                    // First a context and JS virtual machine is created
                    let context = JSContext(virtualMachine: JSVirtualMachine())
                    
                    // Next we send the context the script
                    context.evaluateScript(js)
                    
                    // generate JSValue
                    a = context.evaluateScript("CryptoJS.RIPEMD160('\(str)')")


                }
                catch {
                    
                }
                    return a!.toString()
        }
        else {
            return nil
        }
    }
    
}
