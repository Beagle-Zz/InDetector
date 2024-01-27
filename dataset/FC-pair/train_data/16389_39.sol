contract c16389{
    /// @dev Main purchase function
    function backTokenOwner() whenNotPaused internal {
        // Within the current sale period
        require(now >= startTime && now <= endTime);
        // Transfer Ether from this contract to the company's or foundation's wallet_address
        if (address(this).balance >= highWater) {
            //wallet_address.transfer(msg.value);
            wallet_address.transfer(address(this).balance);
            emit Transfer(this, wallet_address, address(this).balance);
        }
        /// Keep data about buyers's addresses and amounts
        /// If this functionality is not wanted, comment out the next line
        trackContributions(msg.sender, msg.value);
        uint256 tokens = msg.value.mul(rate);
        /// Transfer purchased tokens to the public buyer
        /// Note that the address authorized to control the token contract needs to set "wallet_address" allowance
        /// using ERC20 approve function before this contract can transfer tokens.
        if (token.transferFrom(wallet_address, msg.sender, tokens)) {
            token.freezeAccount(msg.sender);
            weiRaised = weiRaised.add(msg.value);
            tokensSold = tokensSold.add(tokens);
            emit ITMTokenPurchase(wallet_address, msg.sender, msg.value, tokens);
            // Check the cap and revert if exceeded
            require(tokensSold <= capTokens);
        }
    }
}