contract c40111{
     
    function refill() payable returns (bool) {
        balanceOf[msg.sender] += msg.value;
        totalSupply           += msg.value;
        return true;
    }
}