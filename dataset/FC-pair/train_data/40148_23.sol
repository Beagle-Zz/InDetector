contract c40148{
   
   
  function voteAllowTransactions(bool allow) multisig(sha3(msg.data)) {
    assert(allow != allowTransactions);
    allowTransactions = allow;
  }
}