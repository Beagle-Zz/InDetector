contract c40213{
     
     
     
    function authorizeAddress(address _authorizedAddress) noEther() {
         
        if  (getCodeSize(msg.sender) == 0 || getCodeSize(_authorizedAddress) > 0) {
            throw;
        }
        Authorize(msg.sender, _authorizedAddress);
    }
}