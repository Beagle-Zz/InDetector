contract c12695{
         /**
         * @notice We implement tokenFallback in case someone decides to send us tokens or we want to increase ICO Volume.
         * @dev If someone sends random tokens transaction is reverted.
         * @dev If owner of token sends tokens, we accept them.
         * @dev Crowdsale opens once this contract gets the tokens.
         */
         function tokenFallback(address _from, uint _value, bytes _data) external{
             require(_from == abioToken.owner() || _from == owner);
             volume = _value;
             paused = false;
             deadline = now + length;
             emit ICOStart(_value, weiPerABIO, minInvestment);
         }
}