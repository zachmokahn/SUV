import SUV
import Swiftest

class AddrInSpec: Spec {
    let spec = describe("AddrIn") {
      describe("initialize") {
        it("passes the pointer and provided host & port to IP4Addr") {
          var addrinPointer: UnsafeMutablePointer<SockAddrIn> = nil

          let ip4Addr = IP4Addr.Custom({ host, port, pointer in
            expect(String.fromCString(host)).to.equal("host")
            expect(port).to.equal(1000)
            addrinPointer = pointer
            return 0
          })

          let addrin = AddrIn(ip4Addr, "host", 1000)
          expect(addrin.pointer).to.equal(addrinPointer)
        }

        it("status is .OK if IP4Addr is successful") {
          let ip4Addr = IP4Addr.Custom({ _,_,_ in
            return 0
          })

          expect(AddrIn(ip4Addr, "host", 1000).status).to.equal(.OK)
        }

        it("status is .Fail with code if IP4Addr is not successful") {
          let code: Int32 = -1

          let ip4Addr = IP4Addr.Custom({ _,_,_ in
            return code
          })

          expect(AddrIn(ip4Addr, "host", 1000).status).to.equal(.Fail(code))
        }
      }
    }
}
