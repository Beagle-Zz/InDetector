contract c40171{
    
    
   function setBackend(address _backendContract) multisig(sha3(msg.data)) {
     backendContract = _backendContract;
   }
}