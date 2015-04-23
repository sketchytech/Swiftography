import Foundation
import JavaScriptCore

public struct Crypto {
    public static func sha1(str:String) -> String? {

        if let url = NSBundle.mainBundle().URLForResource("sha1", withExtension: "js"),
                    js = String(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil) {
            
            // First a context and JS virtual machine is created
            let context = JSContext(virtualMachine: JSVirtualMachine())
            
            // Next we send the context the script
            let val = context.evaluateScript(js)
            
            // generate JSValue
            let a:JSValue = context.evaluateScript("CryptoJS.SHA1('\(str)')")
            return a.toString()
        
    }
        else {
            return nil
        }
}
    
    public static func md5(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("md5", withExtension: "js"),
            js = String(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil) {
                
                // First a context and JS virtual machine is created
                let context = JSContext(virtualMachine: JSVirtualMachine())
                
                // Next we send the context the script
                let val = context.evaluateScript(js)
                
                // generate JSValue
                let a:JSValue = context.evaluateScript("CryptoJS.MD5('\(str)')")
                return a.toString()
                
        }
        else {
            return nil
        }
    }
    
    public static func sha3(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("sha3", withExtension: "js"),
            js = String(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil) {
                
                // First a context and JS virtual machine is created
                let context = JSContext(virtualMachine: JSVirtualMachine())
                
                // Next we send the context the script
                let val = context.evaluateScript(js)
                
                // generate JSValue
                let a:JSValue = context.evaluateScript("CryptoJS.SHA3('\(str)')")
                return a.toString()
                
        }
        else {
            return nil
        }
    }
    public static func sha224(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("sha224", withExtension: "js"),
            js = String(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil) {
                
                // First a context and JS virtual machine is created
                let context = JSContext(virtualMachine: JSVirtualMachine())
                
                // Next we send the context the script
                let val = context.evaluateScript(js)
                
                // generate JSValue
                let a:JSValue = context.evaluateScript("CryptoJS.SHA224('\(str)')")
                return a.toString()
                
        }
        else {
            return nil
        }
    }
    public static func sha256(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("sha256", withExtension: "js"),
            js = String(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil) {
                
                // First a context and JS virtual machine is created
                let context = JSContext(virtualMachine: JSVirtualMachine())
                
                // Next we send the context the script
                let val = context.evaluateScript(js)
                
                // generate JSValue
                let a:JSValue = context.evaluateScript("CryptoJS.SHA256('\(str)')")
                return a.toString()
                
        }
        else {
            return nil
        }
    }
    public static func sha384(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("sha384", withExtension: "js"),
            js = String(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil) {
                
                // First a context and JS virtual machine is created
                let context = JSContext(virtualMachine: JSVirtualMachine())
                
                // Next we send the context the script
                let val = context.evaluateScript(js)
                
                // generate JSValue
                let a:JSValue = context.evaluateScript("CryptoJS.SHA384('\(str)')")
                return a.toString()
                
        }
        else {
            return nil
        }
    }
    public static func sha512(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("sha512", withExtension: "js"),
            js = String(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil) {
                
                // First a context and JS virtual machine is created
                let context = JSContext(virtualMachine: JSVirtualMachine())
                
                // Next we send the context the script
                let val = context.evaluateScript(js)
                
                // generate JSValue
                let a:JSValue = context.evaluateScript("CryptoJS.SHA512('\(str)')")
                return a.toString()
                
        }
        else {
            return nil
        }
    }
    public static func ripemd160(str:String) -> String? {
        
        if let url = NSBundle.mainBundle().URLForResource("ripemd160", withExtension: "js"),
            js = String(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil) {
                
                // First a context and JS virtual machine is created
                let context = JSContext(virtualMachine: JSVirtualMachine())
                
                // Next we send the context the script
                let val = context.evaluateScript(js)
                
                // generate JSValue
                let a:JSValue = context.evaluateScript("CryptoJS.RIPEMD160('\(str)')")
                return a.toString()
                
        }
        else {
            return nil
        }
    }
    
}
