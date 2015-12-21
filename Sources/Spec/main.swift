import Swiftest

Swiftest.register([
    HandleSpec.self,
    StreamHandleSpec.self,
    TCPHandleSpec.self,
    CastSpec.self,
    LoopSpec.self,
    RunModeSpec.self,
    HandleEquatableSpec.self,
    StatusEquatableSpec.self,
    LoopEquatableSpec.self
])

try Swiftest.run()
