contract c4155{
    // Set the token transfer fee.
    // The maximum of feeRate is 0.1%.
    // The maximum of fee is 100 TWDT.
    function setFee(uint256 _feeRate, uint256 _minimumFee, uint256 _maximumFee) onlyOwner public {
        require(_feeRate <= 10);
        require(_maximumFee <= 100);
        require(_minimumFee <= _maximumFee);
        feeRate = _feeRate;
        minimumFee = _minimumFee.mul(10**decimals);
        maximumFee = _maximumFee.mul(10**decimals);
        emit Fee(feeRate, minimumFee, maximumFee);
    }
}