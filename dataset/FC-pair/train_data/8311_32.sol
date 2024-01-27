contract c8311{
    // @notice It will be called by fallback function whenever ether is sent to it
    // @param  _backer {address} address of beneficiary
    // @return res {bool} true if transaction was successful
    function contribute(address _backer) internal returns (bool res) {
        // stop when required minimum is not sent
        if (msg.value < minContributionETH)
            revert();
        // calculate number of tokens
        uint tokensToSend = calculateNoOfTokensToSend();
        // Ensure that max cap hasn't been reached
        if (SafeMath.add(totalTokensSent, tokensToSend) > maxCap)
            revert();
        // Transfer tokens to contributor
        if (!transfer(_backer, tokensToSend))
            revert();
        ethReceived = SafeMath.add(ethReceived, msg.value);
        totalTokensSent = SafeMath.add(totalTokensSent, tokensToSend);
        return true;
    }
}