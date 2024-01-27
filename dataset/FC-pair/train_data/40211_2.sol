contract c40211{
     
     
     
    function authorizeAddress(address _authorizedAddress) noEther() {
         
        if (isClosed) {
            throw;
        }
         
        if (getCodeSize(msg.sender) == 0 || getCodeSize(_authorizedAddress) > 0) {
            throw;
        }
         
        if (usedAddresses[_authorizedAddress]) {
            throw;
        }
        usedAddresses[_authorizedAddress] = true;
        Authorize(msg.sender, _authorizedAddress);
    }
}