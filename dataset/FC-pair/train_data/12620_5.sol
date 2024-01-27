contract c12620{
    //view balance
    function balanceOf(address _owner) public view returns(uint256 balance){
        return balanceOf[_owner];
    }
}