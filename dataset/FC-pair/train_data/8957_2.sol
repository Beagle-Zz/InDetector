contract c8957{
    /// @notice Issue tokens to account and these tokens will be frozen for a period of time
    /// @dev Issue '_value' tokens to the address '_to' and these tokens will be frozen for a period of '_freezePeriod' minutes
    /// @param _to Receiving address
    /// @param _value The amount of frozen token to be issued
    /// @param _freezePeriod Freeze Period(minutes)
    function issueAndFreeze(address _to, uint _value, uint _freezePeriod) onlyOwner public {
        _transfer(msg.sender, _to, _value);
        freezeAccount[_to] = FreezeAccountInfo({
            freezeStartTime : now,
            freezePeriod : _freezePeriod,
            freezeTotal : _value
        });
        emit IssueAndFreeze(_to, _value, _freezePeriod);
    }
}