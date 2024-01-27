contract c18675{
    /*
     * @dev     Modifier requiring function caller to be the Etheraffle 
     *          multisig wallet address
     */
    modifier onlyEtheraffle() {
        require(msg.sender == ETHERAFFLE);
        _;
    }
}