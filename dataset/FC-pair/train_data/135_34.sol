contract c135{
    /**
        @dev Allows to check if an eth_address can claim a horsey from this contract
            should we also check if already claimed here?
        @param raceAddress The ethorse race you want to claim from
        @param eth_address The users address you want to claim the token for
        @return True only if eth_address is a winner of the race contract at raceAddress
    */
    function can_claim(address raceAddress, address eth_address) public view returns (bool) {
        bool res;
        (res,) = _isWinnerOf(raceAddress, eth_address);
        return res;
    }
}