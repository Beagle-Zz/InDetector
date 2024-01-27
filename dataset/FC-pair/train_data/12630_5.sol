contract c12630{
    //util for excute transfer action
    function transfer_opt(address from,address to,uint value) private{
        //sure target no be 0x0
        require(to != 0x0);
        //check balance of sender
        require(contract_users[from] >= value);
        //sure the amount of the transfer is greater than 0
        require(contract_users[to] + value >= contract_users[to]);
        uint previousBalances = contract_users[from] + contract_users[to];
        contract_users[from] -= value;
        contract_users[to] += value;
        emit Transfer(from,to,value);
        assert(contract_users[from] + contract_users[to] == previousBalances);
    }
}