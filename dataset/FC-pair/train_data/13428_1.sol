contract c13428{
    // ===== End Admin Functions ===== //
    modifier hasFee(uint amount) {
        _;
        _collectFee(msg.sender, calculateFee(amount));
    }
}