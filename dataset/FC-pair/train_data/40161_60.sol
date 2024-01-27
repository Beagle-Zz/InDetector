contract c40161{
    
    
   function setBackend(address _backendContract) multisig(sha3(msg.data)) {
     backendContract = _backendContract;
   }
}