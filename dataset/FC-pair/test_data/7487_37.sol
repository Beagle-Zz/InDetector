contract c7487{
    //== internal methods
    /**
    * @dev used to actually receive the donation. Will transfer the token to to this contract
    */
    function _receiveDonation(address token, uint _amount) internal returns(uint amount) {
        require(tokenWhitelist[token]);
        amount = _amount;
        // eth donation
        if (token == 0) {
            amount = msg.value;
        }
        require(amount > 0);
        if (token != 0) {
            require(ERC20(token).transferFrom(msg.sender, this, amount));
        }
    }
}