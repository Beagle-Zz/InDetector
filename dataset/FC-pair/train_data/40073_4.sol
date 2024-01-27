contract c40073{
     
    function getBalance(address _address) constant returns (uint) {
        return allowance[_address][msg.sender]
             > balanceOf[_address] ? balanceOf[_address]
                                   : allowance[_address][msg.sender];
    }
}