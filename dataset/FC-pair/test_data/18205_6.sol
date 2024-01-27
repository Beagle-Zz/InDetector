contract c18205{
    /// @notice Buy tokens from contract by sending ether
    function buy() inICOtimeframe payable public {
        uint amount = msg.value * (10 ** uint256(decimals)) / buyPrice;            // calculates the amount
        _transfer(this, msg.sender, amount);              				// makes the transfers
        paidIn[msg.sender] += msg.value;
    }
}