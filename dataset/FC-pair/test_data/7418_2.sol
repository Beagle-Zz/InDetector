contract c7418{
    // setting the addition / removal of master addresses
     function addAddressToMaster(address addr) onlyOwner public returns(bool success) {
     if (!master[addr]) {
       master[addr] = true;
       MasterAddressAdded(addr);
       success = true; 
     }
     }
}