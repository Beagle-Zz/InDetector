contract c40160{
    
    
   function setBackend(address _backendContract) multisig(sha3(msg.data)) {
     backendContract = _backendContract;
   }
}