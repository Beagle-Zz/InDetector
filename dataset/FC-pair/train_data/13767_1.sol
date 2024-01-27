contract c13767{
    // ===== End Admin Functions ===== //
    modifier hasFee(uint amount) {
        _;
        _collectFee(msg.sender, calculateFee(amount));
    }
}