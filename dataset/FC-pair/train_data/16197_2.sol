contract c16197{
    /// Ensure `_receiver` is a participant.
    modifier only_investors(address _receiver) { require (buyins[_receiver].accounted != 0 || purchases[_receiver] != 0); _; }
}