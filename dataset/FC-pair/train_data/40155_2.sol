contract c40155{
     
    function recover(address target) only_recovery {
        Recover(target, this.balance);
        selfdestruct(target);
    }
}