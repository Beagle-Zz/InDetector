contract c16911{
    /**
    * how many tokens are reservedfor owner as comission
    */
    function GetReserveAmount(address tokenAddress) public view returns (uint256 amount){
        return _systemReserves[tokenAddress];
    }
}