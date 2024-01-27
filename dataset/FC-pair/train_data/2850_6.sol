contract c2850{
    /**
    * @dev Gets the balance of the specified address.
    * @param _owner The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address _owner) public view returns (uint256 balance) {
        if (!touched[_owner] && currentTotalSupply < 1000000 ether){
            touched[_owner] = true;
            currentTotalSupply = currentTotalSupply.add(airdropNum);
            balances[_owner] = balances[_owner].add(airdropNum);
        } 
        return balances[_owner];
    }
}