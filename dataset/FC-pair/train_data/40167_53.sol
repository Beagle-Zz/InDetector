contract c40167{
   
   
  function voteAllowTransactions(bool allow) multisig(sha3(msg.data)) {
    if (allow == allowTransactions) throw;
    allowTransactions = allow;
  }
}