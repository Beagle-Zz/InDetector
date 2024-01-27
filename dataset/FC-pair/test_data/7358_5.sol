contract c7358{
    /**
    * @dev returns contract metadata in one function call, rather than separate .call()s
    * Not sure if this works yet
    */
    function getMarriageDetails() public view returns (
        address, string, string, string, string, uint, uint256) {
        return (
            owner,
            leftName,
            leftVows,
            rightName,
            rightVows,
            marriageDate,
            bellCounter
        );
    }
}