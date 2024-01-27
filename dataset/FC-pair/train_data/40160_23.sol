contract c40160{
   
   
  function voteAllowTransactions(bool allow) multisig(sha3(msg.data)) {
    assert(allow != allowTransactions);
    allowTransactions = allow;
  }
}