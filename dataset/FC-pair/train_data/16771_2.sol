contract c16771{
    /**
    * Returns the balance of the qeuried address
    *
    * @param _who The address which is being qeuried
    **/
    function balanceOf(address _who) public view returns(uint256) {
        return balances[_who];
    }
}