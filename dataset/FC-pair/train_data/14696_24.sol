contract c14696{
      /**
      * @dev Transfer the specified amount of tokens to the specified address.
      *      Invokes the `tokenFallback` function if the recipient is a contract.
      *      The token transfer fails if the recipient is a contract
      *      but does not implement the `tokenFallback` function
      *      or the fallback function to receive funds.
      *
      * @param _to    Receiver address.
      * @param _value Amount of tokens that will be transferred.
      */
    function transfer(address _to, uint256 _value) public returns (bool) {
        bytes memory empty;
        require(transfer(_to, _value, empty));
        return true;
    }
}