contract c217{
    /**
        @dev Owner can withdraw the current balance
    */
    function withdraw() external 
    onlyOwner()  {
        owner.transfer(address(this).balance); //throws on fail
    }
}