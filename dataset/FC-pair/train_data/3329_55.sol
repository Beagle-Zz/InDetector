contract c3329{
    /**
     * @dev Modifier for address whith whitelisting rights
    */
    modifier onlyWhitelister(){
        require(msg.sender == whitelister);
        _;
    }
}