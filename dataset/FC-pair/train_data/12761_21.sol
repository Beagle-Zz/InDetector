contract c12761{
    /**
    * @dev Returns current annual interest
    */
    function annualInterest() public view returns(uint256) {
        return getAnnualInterest(now);                                                                      // solium-disable-line
    }
}