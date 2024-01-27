contract c40177{
   
   
  function voteAllowTransactions(bool allow) multisig(sha3(msg.data)) {
    if (allow == allowTransactions) throw;
    allowTransactions = allow;
  }
}