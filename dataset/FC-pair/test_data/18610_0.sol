contract c18610{
    /**
     * @dev  Modifier to prepend to functions rendering them
     *       only callable by the Etheraffle multisig address.
     */
    modifier onlyEtheraffle() {
        require(msg.sender == etheraffle);
        _;
    }
}