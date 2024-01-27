contract c10189{
    /**
    * @dev Presence of this function indicates the contract is a Custom Token.
    */
    function isCustomToken() public pure returns(bool isCustom) {
        return true;
    }
}