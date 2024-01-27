contract c14268{
    /**
     * @dev Modifier that check that `msg.sender` is an trusted contract
     */
    modifier onlyTrustedContract() {
        require(trustedContract[msg.sender]);
        _;
    }
}