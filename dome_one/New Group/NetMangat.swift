////
////  NetMangat.swift
////  dome_one
////
////  Created by yangchengcheng on 2025/4/7.
////
//import CoreLocation
//import SystemConfiguration.CaptiveNetwork
//
//class NetMangat: NSObject, PNetMLanScannerDelegate {
//    private let locationManager = CLLocationManager()
//    private var completion: ((String?, String?) -> Void)?
//    
//    override init() {
//        super.init()
//        locationManager.delegate = self
//    }
//    
//    // 带有权限检查的网络信息获取
//    func fetchNetworkInfo() {
//        // 检查当前权限状态
//        switch locationManager.authorizationStatus {
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted, .denied:
//            print("需要位置权限来获取WiFi信息")
//        default:
//            getNetworkDetails()
//        }
//    }
//    
//    func getNetworkDetails() {
//        let ssid = fetchSSID()
//        let ip = getIPAddress()
//        completion?(ssid, ip)
//    }
//    
//    // 获取 WiFi 名称 (iOS 12+)
//    func fetchSSID() -> String? {
//        var ssid: String?
//        if let interfaces = CNCopySupportedInterfaces() as? [CFString] {
//            for interface in interfaces {
//                if let info = CNCopyCurrentNetworkInfo(interface) as? [String: Any] {
//                    ssid = info[kCNNetworkInfoKeySSID as String] as? String
//                    break
//                }
//            }
//        }
//        return ssid
//
//    }
//    
//    // 获取本地 IP 地址
//    func getIPAddress() -> String? {
//        var address: String?
//        var ifaddr: UnsafeMutablePointer<ifaddrs>?
//        
//        guard getifaddrs(&ifaddr) == 0 else { return nil }
//        guard let firstAddr = ifaddr else { return nil }
//        
//        for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
//            let interface = ptr.pointee
//            let name = String(cString: interface.ifa_name)
//            
//            let addrFamily = interface.ifa_addr.pointee.sa_family
//            guard addrFamily == UInt8(AF_INET) else { continue }
//            
//            guard name.hasPrefix("en") else { continue } // 排除 lo 等其他接口
//            guard (Int32(interface.ifa_flags) & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) else { continue }
//            
//            var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
//            getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
//                        &hostname, socklen_t(hostname.count),
//                        nil, socklen_t(0), NI_NUMERICHOST)
//            
//            address = String(cString: hostname)
//            break
//        }
//        freeifaddrs(ifaddr)
//        return address
//    }
//
//    func fetchNetworkLocation() {
//        print(self.fetchSSID() ?? "暂无数据")
////        PhoneNetManager.shareInstance().netStartPing("www.baidu.com", packetCount: 10) { aaa in
////            print(aaa ?? "无数据")
////        }
////        let lanScanner = PNetMLanScanner.shareInstance()
////        lanScanner.delegate = self
////        lanScanner.scan()
////        PhoneNetManager.shareInstance().netPortScan("www.baidu.com", beginPort: 100, endPort: 9000) { astring, abool, aerror in
////            print("string: \(String(describing: astring))\nbool: \(abool)\nerror: \(String(describing: aerror))")
////        }
////    }
////    func startTraceRoute(host: String) {
////        PhoneNetManager.shareInstance().netStartTraceroute("www.apple.com") { hop, _ in
////            print("路由节点: \(hop ?? "无数据")")
////        }
////        PhoneNetManager.shareInstance().netGetNetworkInfo()
//    }
//}
//
//extension NetMangat: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager,
//                        didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse || status == .authorizedAlways {
//            getNetworkDetails()
//        } else {
//            completion?(nil, "位置权限被拒绝")
//        }
//    }
//}
