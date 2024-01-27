contract c10716{
    /// @dev Set the ICO_Contract.
    /// @param _ICO_Contract crowdsale contract address
    function setICO_Contract(address _ICO_Contract) onlyOwner public {
        ICO_Contract = _ICO_Contract;
    }
}