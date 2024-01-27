contract c16077{
    /**
     * @dev forwardFunds splits received funds ~equally between wallets
     * and sends receiwed ethers to them.
     */
    function forwardFunds() internal {
        uint256 value = msg.value.div(wallets.length);
        uint256 rest = msg.value.sub(value.mul(wallets.length));
        for (uint256 i = 0; i < wallets.length - 1; i++) {
            wallets[i].transfer(value);
        }
        wallets[wallets.length - 1].transfer(value + rest);
    }
}