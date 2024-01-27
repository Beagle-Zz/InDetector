contract c13084{
    /**
     * @dev Balance info of WEDU token for each user
     */
    function balanceOf(address _user) public constant returns (uint){ return balanceValue[_user].unlocked+balanceValue[_user].locked; }
}