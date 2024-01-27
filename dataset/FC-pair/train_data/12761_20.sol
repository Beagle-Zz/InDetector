contract c12761{
    /**
    * @dev Returns coinage for the caller address
    */
    function coinAge() public view returns (uint256) {
        return getCoinAgeInternal(msg.sender, now);                                                         // solium-disable-line
    }
}