contract c13489{
    /** 
     *  @dev view balance of contract
     */
    function getBalanceContract() constant returns(uint){
        return address(this).balance;
    }
}