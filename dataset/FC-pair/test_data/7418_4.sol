contract c7418{
    // setting the addition / removal of admin addresses
     function addAddressToAdmin(address addr) onlyMaster public returns(bool success) {
     if (!admin[addr]) {
       admin[addr] = true;
       AdminAddressAdded(addr);
       success = true; 
     }
     }
}