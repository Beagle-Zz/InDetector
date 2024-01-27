contract c12959{
/** 
 * With this function, the token ownership will be transferred to token creator.
 */
    function getTokenOwner() public view returns (address) {
        return BreezeCoin(TOKEN_ADDRESS).getOwner();
    }
}